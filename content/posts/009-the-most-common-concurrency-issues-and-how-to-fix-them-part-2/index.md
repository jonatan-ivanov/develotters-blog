---
title: "The Most Common Concurrency Issues and How to Fix Them: Part 2"
lead: ""
description: "The Most Common Concurrency Issues and How to Fix Them"

date: 2020-08-22T12:00:00-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["concurrency", "java"]
---

In the [first part](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1) of the series, I showed you a simple class which has three concurrency issues. In this post, I would like to explain the first issue.
By the end of the series, you will understand their basic mechanism, you will be able to identify them and I will give you a couple of advice on how to fix them.

<!--more-->

**Disclaimer:** I'm not going deep down the rabbit hole (e.g.: Java Memory Model, happens-before, etc.) but I'm trying to explain the issues in a simple way. If you already know all the three different issues with the demo code below and you want to learn more, I suggest you check out the tests I wrote to demo/reproduce the issues and the [Java Concurrency in Practice book](https://jcip.net/).

# Race Condition

A **race condition** is a situation where the behavior of the software depends on the sequence/timing of the execution in multi-threaded environments.

OK, but what does this mean? Let's see an example, throughout the increment method. Incrementing a value consists of 3 steps:

1. Reading the value from the memory
2. Incrementing it (+1)
3. Writing it back to the memory

On multiple threads, this could look like this:

| Thread A    | Thread B    | Memory |
|-------------|-------------|--------|
| `read`      |             | 0      |
| `increment` |             | 0      |
| `write`     |             | 1      |
|             | `read`      | 1      |
|             | `increment` | 1      |
|             | `write`     | 2      |

Since the increment operation is not happening in a single step but it consists of 3 steps, we need to talk a little about **atomicity**. Atomic operations are executed in all-or-nothing which means that other threads will not be able to see the operation in a partially-completed state. They see it as either the whole thing was executed or nothing. From their perspective, an atomic operation looks *"instantaneous"*, there is no *in-between*.

Since other threads can see the intermediate steps (it is not a single `read-increment-write` action but 3 separate steps), we can say that the increment operation is not atomic.

Because of this, if the sequence/timing of the execution is not fortunate, we can get a different result:

| Thread A    | Thread B    | Memory |
|-------------|-------------|--------|
| `read`      |             | 0      |
|             | `read`      | 0      |
| `increment` |             | 0      |
|             | `increment` | 0      |
| `write`     |             | 1      |
|             | `write`     | 1      |

As you can see, the result of the increment method is based on "luck" so we can say (not very accurately) that **race condition** is a situation where the behavior depends on "luck". :)

# How to spot and fix Race Conditions

**First**, look for **shared mutability** (something that is shared between threads and also can be modified). E.g.: if you see that a class has a field (static or non-static) which is modified in a method (in a non-atomic way) and the method can be invoked from multiple threads, I might have bad news. This is exactly the case with the `value` field in the `UnsafeCounter` class (see the [first post](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1)).

To fix this type of issue, you can either **eliminate shared mutability** (by making your objects immutable or not shared) or **make the operations atomic**. Since usually immutability is the safest path and since ["shared mutability is devil's work"](http://blog.agiledeveloper.com/2015/11/the-power-and-practicality-of.html) I would try to go for immutability first. I intentionally picked an example where this is not possible and we need to take the *hard* path (later) but please always use immutable objects wherever you can, you will make everyone's life easier.

**Second**, check if you are **using thread-safe components**. Your component is only thread-safe if all of the components it is using are thread-safe (assuming you don't make them atomic). Here's an example which looks thread-safe, but it is not (please ignore other issues with this code):

{{< highlight java >}}
public class DateService {
    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public String getFormattedDate(long timestamp) {
        Date date = new Date(timestamp);
        return DATE_FORMAT.format(date);
    }
}
{{< /highlight >}}

[`SimpleDateFormat`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/text/SimpleDateFormat.html) is not thread-safe so this method in this form can't be thread-safe either. The JavaDoc warns you about it (as far as I remember, I learned this by accident during a perf test):
>Date formats are not synchronized. It is recommended to create separate format instances for each thread. If multiple threads access a format concurrently, it must be synchronized externally.

Classes in the JDK which (surprisingly) are not thread-safe (I'm sure this list is way longer than this):

- `SimpleDateFormat`
- `Marshaller`
- `Unmarshaller`

Btw, the "goto" implementations in the Collections Framework are not thread-safe (might not be very surprising though) either:
  - `ArrayList`, `LinkedList`
  - `HashSet`, `TreeSet`, `LinkedHashSet`
  - `HashMap`, `TreeMap`, `LinkedHashMap`

You can find thread-safe implementations in the [Collections Framework](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/doc-files/coll-reference.html) (e.g.: `ConcurrentHashMap`) and the Java Time API contains a thread-safe [DateTimeFormatter](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/time/format/DateTimeFormatter.html). Unfortunately, I don't know any good way to fix the `Marshaller` and the `Unmarshaller` in JAXB except synchronization.

## How to fix Race Conditions by making operations atomic

I think the best advice I can ever give to you is this: **Try to avoid writing code.**  
So let me introduce you to the `java.util.concurrent.atomic` package which (in this case) solves the problem for you:

{{< highlight java >}}
public class SafeCounter implements Counter {
    private final AtomicLong value = new AtomicLong();

    @Override
    public long get() {
        return value.get();
    }

    @Override
    public void set(long newValue) {
        value.set(newValue);
    }

    @Override
    public void increment() {
        value.incrementAndGet();
    }
}
{{< /highlight >}}

But what if you can't eliminate shared mutability, there is no existing class that could solve the problem for you and/or you can't use a thread-safe implementation?  
Please note that this should be your last resort and you need to prepare for the fight. :) Also, this is a big topic, discussing it in details could be the subject of a book. Oh, wait: [Java Concurrency in Practice](https://jcip.net/). :)

The simpler tool you can use is the `synchronized` keyword:

- [Guide to the Synchronized Keyword in Java from Baeldung](https://www.baeldung.com/java-synchronized)
- [Oracle Synchronization Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/sync.html)
- [Synchronized Methods from the same Oracle Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/syncmeth.html)

The more sophisticated one is called `Lock`:

- [Oracle Lock Objects Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/newlocks.html)
- [`java.util.concurrent.locks` package](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/concurrent/locks/package-summary.html)

In the next article, I would like to explain the rest of the issues as well as how to fix them using `synchronized`.

# Tests

I created tests for the first two issues: [`CounterTest.java`](https://github.com/jonatan-ivanov/concurrency-basics/blob/master/src/test/java/org/example/concurrent/CounterTest.java).
Please feel free to clone/fork the repo and play with the code. You can modify the implementations (or add new ones) and watch if the tests are failing. Try to play with `synchronized`, `volatile`, and `Lock`s.
Understanding the tests could also be a fun exercise. :)

**WARNING: Since the behavior is based on "luck", the tests are not consistent, they can give false positives.**

The `UnsafeCounter` and the `SafeCounter` classes in this post are also available in the GitHub repo: [concurrency-basics](https://github.com/jonatan-ivanov/concurrency-basics).

# Posts in this series

- [The Most Common Concurrency Issues and How to Fix Them: Part 1](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1)
- [The Most Common Concurrency Issues and How to Fix Them: Part 2](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-2)
- [The Most Common Concurrency Issues and How to Fix Them: Part 3](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-3)
- [The Most Common Concurrency Issues and How to Fix Them: Part 4](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-4)
