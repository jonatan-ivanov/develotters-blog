---
title: "The Most Common Concurrency Issues and How to Fix Them: Part 1"
lead: ""
description: "The Most Common Concurrency Issues and How to Fix Them"

date: 2020-08-20T17:00:00-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["concurrency", "java"]
---

The goal of this example-driven series of articles is explaining, demonstrating, and testing (the fun part) the two most frequent (in my opinion) concurrency mistakes in Java (plus an interesting third one), also giving you a few suggestions to fix them.

By the end of the series, you will understand their basic mechanism, you will be able to identify them and I will give you a couple of advice on how to fix them.
<!--more-->

**Disclaimer:** I'm not going deep down the rabbit hole (e.g.: Java Memory Model, happens-before, etc.) but I'm trying to explain the issues in a simple way. If you already know all the three different issues with the demo code below and you want to learn more, I suggest you check out the tests I wrote (coming in the next post) to demo/reproduce the issues and the [Java Concurrency in Practice book](https://jcip.net/).

# The Demo Code

Let's have a simple interface that can be used for `get-set-increment` a `long` value.
(This is only for demo purposes, if you need something like this, please use a metrics library or one of the classes for this purpose in the JDK).

{{< highlight java >}}
public interface Counter {
    long get();
    void set(long newValue);
    void increment();
}
{{< /highlight >}}

Let's implement this interface in a simple way:

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

Believe it, or not, these few lines demonstrate all the three issues. Can you spot all of them?
I'm going to post the description of the first issue soon. :)

# Posts in this series

- [The Most Common Concurrency Issues and How to Fix Them: Part 1](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1)
- [The Most Common Concurrency Issues and How to Fix Them: Part 2](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-2)
- [The Most Common Concurrency Issues and How to Fix Them: Part 3](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-3)
