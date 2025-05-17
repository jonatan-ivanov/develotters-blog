---
title: "The Most Common Concurrency Issues and How to Fix Them: Part 3"
lead: ""
description: "The Most Common Concurrency Issues and How to Fix Them Part 3"

date: 2020-08-24T19:20:00-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["concurrency", "java"]
---

In the [first part](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1/) of the series, I showed you a simple class which has three concurrency issues. In the [second one](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-2/), I explained the first issue: Race Condition. In this post, I would like to explain the rest of them.
By the end of the series, you will understand their basic mechanism, you will be able to identify them and I will give you a couple of advice on how to fix them.

I wrote a few tests to demonstrate two of the issues, the third one is tough, please let me know if you have any idea how can it be tested. I'm also interested if you have any ideas for improvements for the existing tests because…  
…well, keep reading and you will see. :)

<!--more-->

**Disclaimer:** I'm not going deep down the rabbit hole (e.g.: Java Memory Model, happens-before, etc.) but I'm trying to explain the issues in a simple way. If you already know all the three different issues with the demo code below and you want to learn more, I suggest you check out the tests I wrote to demo/reproduce the issues and the [Java Concurrency in Practice book](https://jcip.net/).

# Data Race

Now that you are familiar with **Race Condition** and **Atomicity**, let's see the second issue.  
**Visibility** is guaranteed if a thread can see the changes that were made by another thread. Under the hood, you can imagine the violation of this as it is allowed to cache variables in CPU registers or caches where other threads can't see it, they can only see the stale value in memory (reordering the operations are also possible).

**Data Race** happens when (at least) two threads are accessing the same variable without a visibility guarantee and changes made by one thread are not visible to others.

## How to spot and fix Data Race

Let me put the [original implementation](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1) here as a reminder:

{{< highlight java >}}
public class UnsafeCounter implements Counter {
    private long value = 0;

    @Override
    public long get() {
        return value;
    }

    @Override
    public void set(long newValue) {
        value = newValue;
    }

    @Override
    public void increment() {
        value++;
    }
}
{{< /highlight >}}

Let's say we *"fix"* our `Counter` implementation: let's make the `increment` and the `set` methods `synchronized` since they can interfere but `get` is ok, right? :)

{{< highlight java >}}
public class StillUnsafeCounter implements Counter {
    private long value = 0;

    @Override
    public long get() {
        return value;
    }

    @Override
    public synchronized void set(long newValue) {
        value = newValue;
    }

    @Override
    public synchronized void increment() {
        value++;
    }
}
{{< /highlight >}}

Let's say we just created an instance of the `StillUnsafeCounter` and the constructor set the `value` variable to 0. Now Thread A calls `increment` and after that, Thread B calls `get`.  
In this case, there is no guarantee that Thread B will get the correct value (1), it can get the stale value (0).

Spotting the issue is very similar to spotting race conditions, you need to look for **shared mutability**: one or more threads can write the data and others can read.  
Since you need to ensure both **atomicity** and **visibility** to write thread-safe components, these issues go together.  
Fixing it is similar too: trying to avoid **shared mutability** and **trying to avoid writing code** (finding a component which solves the problem for you) should be the first steps.

If these are not possible there are two tools you can leverage.

The `volatile` keyword guarantees **visibility** without providing **atomicity**:
- [Atomic Access in Oracle Synchronization Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/atomic.html)
- [Guide to the Volatile Keyword in Java from Baeldung](https://www.baeldung.com/java-volatile)

The `synchronized` keyword provides both **atomicity** and **visibility** but you need to pay some extra cost in performance:
- [Guide to the Synchronized Keyword in Java from Baeldung](https://www.baeldung.com/java-synchronized)
- [Oracle Synchronization Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/sync.html)
- [Synchronized Methods from the same Oracle Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/syncmeth.html)

So in the `StillUnsafeCounter` class above we can either make the `get` method `synchronized` or the `value` variable `volatile`:

{{< highlight java >}}
public class UglyCounter implements Counter {
    private volatile long value = 0;

    @Override
    public long get() {
        return value;
    }

    @Override
    public synchronized void set(long newValue) {
        value = newValue;
    }

    @Override
    public synchronized void increment() {
        value++;
    }
}
{{< /highlight >}}

Again, this is a big topic, discussing it in details should be the subject of a book: [Java Concurrency in Practice](https://jcip.net/).

# Writing non-volatile `long` and `double` variables is not atomic

Believe it or not, there is a third issue with the `UnsafeCounter` class that we just secretly fixed in the previous section.  
Writing non-volatile `long` and `double` variables is not atomic it can be treated as two sequential write operations: one for the first 4 bytes and another one for the second 4 bytes (both of them need 8 bytes).
This is a **Race Condition**, if you are unlucky, a thread can see the first 4 bytes from one write, and the second 4 bytes from another write so you can end-up with made-up values.

Since writing `volatile` variables are atomic, you can either make the `value` variable `volatile` or make the `set` method `synchronized` (see: `UglyCounter`):

- [Java Language Specification (JLS)](https://docs.oracle.com/javase/specs/jls/se11/html/jls-17.html#jls-17.7)
- [Atomic Access in Oracle Synchronization Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/atomic.html)

# Tests

I created tests for the first two issues: [`CounterTest.java`](https://github.com/jonatan-ivanov/concurrency-basics/blob/main/src/test/java/org/example/concurrent/CounterTest.java).
Please feel free to clone/fork the repo and play with the code. You can modify the implementations (or add new ones) and watch if the tests are failing. Try to play with `synchronized`, `volatile`, and `Lock`s.
Understanding the tests could also be a fun exercise, I will write about them to in the next post. :)

**WARNING: Since the behavior is based on "luck", the tests are not consistent, they can give false positives.**

I'm not sure how to test the third issue since I need to ensure visibility but not atomicity for `set` and `get` which I'm not able to do since `volatile` will ensure both.  
Please let me know if you have any idea how can it be tested.

The `UnsafeCounter` and the `SafeCounter` classes in this post are also available in the GitHub repo: [concurrency-basics](https://github.com/jonatan-ivanov/concurrency-basics).

# Posts in this series

- [The Most Common Concurrency Issues and How to Fix Them: Part 1](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1)
- [The Most Common Concurrency Issues and How to Fix Them: Part 2](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-2)
- [The Most Common Concurrency Issues and How to Fix Them: Part 3](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-3)
- [The Most Common Concurrency Issues and How to Fix Them: Part 4](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-4)
