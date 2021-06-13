---
title: "How Not to Measure Elapsed Time"
lead: ""
description: "How Not to Measure Elapsed Time"

date: 2021-06-12T00:00:14-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["latency", "performance", "metrics", "UTC", "time", "Java"]
---

The rabbit hole goes infinitely deep if you want to do latency measurements, benchmarking, and performance testing/tuning/analysis. They are very hard to do right and it is very easy to mess them up. In this post, I would like to show you a very common mistake (that is just 0.000001‰ of the tip of the iceberg) and an extremely simple solution to fix it.
<!--more-->

Let's say you want to record the duration of a method call. I guess most people will be able to mention at least one thing about what is wrong with this. I usually expect to hear error handling and "misusing" the `Date` class but there is a lot more (see below).
```java
Response handleRequest(Request request) {
    Date start = new Date();
    Response response = doSomething(request);
    record(new Date().getTime() - start.getTime());

    return response;
}
```
Believe it or not, I saw this in the wild but this is not the very common mistake I referred to previously and want to talk about. The very common mistake I would like to talk about is this:
```java
Response handleRequest(Request request) {
    long start = System.currentTimeMillis();
    try {
        return doSomething(request);
    }
    finally {
        record(System.currentTimeMillis() - start);
    }
}
```

Unfortunately, you can see latency measurement code similar to this all the time and if this snippet seems reasonable to you, you are not alone: the duration is measured without using the `Date` class, exceptional cases are handled, what could go wrong?

I'm glad you asked. :)

[`System.currentTimeMillis()`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/System.html#currentTimeMillis()) returns:
>the difference, measured in milliseconds, between the current time and midnight, January 1, 1970 UTC.

This is a so-called "wall-clock", it just tells you what is the current system time. And the usage of it can lead to lots of problems.

# Problems

## Granularity
`System.currentTimeMillis()` returns the current time in milliseconds but the granularity of the value depends on the underlying operating system and might be larger than the base unit. For example, many operating systems measure time in units of tens of milliseconds.

Let's say your OS measures time in chunks of 100ms. In this scenario, there is no way to measure anything that needs to be more precise than this. So if an operation takes somewhere between 20 and 80ms, your measurements are either 0 or 100ms (this precision can be worse, e.g.: 1s), not even mentioning measuring sub-millisecond operations (microbenchmarks, nanobenchmarks).  
If you look into the [javadoc of `System.currentTimeMillis()`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/System.html#currentTimeMillis()), you can read about this problem.

## Time Uniformity
You might have heard that there are irregularities in Earth's rotation (it slows down and speeds up in complex ways). Also, there is a long-term slowdown in Earth's rotation. There is a standard, called [UT1](https://en.wikipedia.org/wiki/Universal_Time#Versions) (a version of Universal Time), that is based on astronomical observations and Earth's rotation. Because of this, UT1 does not always flow uniformly. So if your time source is based on this, you have a non-uniform source of time which can speed up and slow down leading you to measurement errors (see: [javadoc of `Date`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Date.html)).
`System.currentTimeMillis()` uses UTC instead of UT1 so it does not have this exact problem.

## Leap Second
[UTC](https://en.wikipedia.org/wiki/Coordinated_Universal_Time) is measured by precise atomic clocks while [UT1](https://en.wikipedia.org/wiki/Universal_Time#Versions) is based on astronomical observations (see the previous section). To keep the two somewhat close to each other (<0.9s), UTC is occasionally adjusted by one second. This adjustment is called the [leap second](https://en.wikipedia.org/wiki/Leap_second). Since climatic and geological events affect Earth's rotation, UTC leap seconds are irregular and unpredictable. These adjustments can lead you measurement errors since the clock can change during your measurements (see: [javadoc of `Date`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Date.html)).

## Synchronizing the System Clock 
When clocks do not run at the same rate, [clock drifting](https://en.wikipedia.org/wiki/Clock_drift) can happen (they get out-of-sync). To keep them somewhat close to each other, [clock synchronization](https://en.wikipedia.org/wiki/Clock_synchronization) is necessary (see: [NTP](https://en.wikipedia.org/wiki/Network_Time_Protocol)). Since your system clock precision is far from the precision of atomic clocks, it needs to be adjusted regularly to be within a few milliseconds of UTC. This can mean jumps in time or making the clock go faster or slower so that it will drift towards UTC. These adjustments can also lead to measurement errors.

## Daylight Saving Time
Something needs to be really messed up if [Daylight Saving Time](https://en.wikipedia.org/wiki/Daylight_saving_time) causes a problem in such measurements but it is a quite frequent issue if you need to deal with time. I have seen a service once that crashed twice per year, can you guess why?

# Solution
The solution is pretty simple: do not use the "wall-clock". In Java (but other platforms has a solution for this too), [`System.nanoTime()`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/System.html#nanoTime()) gives you access to a high-resolution time source (nanoseconds) that is designed for measuring elapsed time and it is not related to the system clock or any "wall-clock", see the [javadoc of `System.nanoTime()`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/System.html#nanoTime()).
So you can do this:
```java
Response handleRequest(Request request) {
    long start = System.nanoTime();
    try {
        return doSomething(request);
    }
    finally {
        record(System.nanoTime() - start);
    }
}
```
Doing this can be ok but this is the point where that rabbit hole goes infinitely deep so I do not recommend doing this if you want to measure latency. There are lots of other problems you can run into (see later) so what I recommend instead is using the right tool for the job:

- If you are doing (nano/micro/milli/macro) benchmarking: [JMH](https://openjdk.java.net/projects/code-tools/jmh/)
- If you want to collect metrics for your application: [Micrometer](https://micrometer.io/)
- If you want to perf-test your web service: [Gatling](https://gatling.io/open-source/)

Here's an example for collecting metrics with [Micrometer](https://micrometer.io/):
```java
@Timed
Response handleRequest(Request request) {
    return doSomething(request);
}
```
or
```java
Response handleRequest(Request request) {
    return timer.record(() -> doSomething(request));
}
```
or, if you want better control:
```java
Response handleRequest(Request request) {
    Timer.Sample sample = Timer.start();
    try {
        return doSomething(request);
    }
    finally {
        sample.stop(timer);
    }
}
```
But there is so much more you can do, please check the [docs](https://micrometer.io/docs/concepts).

# What else can go wrong?
Everything. :) Here are a few things I recommend watching and reading to dig deeper:
- [How NOT to Measure Latency by Gil Tene](https://www.youtube.com/watch?v=lJ8ydIuPFeU)
  - [HDR Histogram](https://github.com/HdrHistogram/HdrHistogram)
  - [LatencyUtils](https://github.com/LatencyUtils/LatencyUtils)
- [Java Microbenchmark Harness: The Lesser of Two Evils by Aleksey Shipilëv](https://www.youtube.com/watch?v=VaWgOCDBxYw)
- [Falsehoods programmers believe about time](https://infiniteundo.com/post/25326999628/falsehoods-programmers-believe-about-time)
- [More falsehoods programmers believe about time; "wisdom of the crowd" edition](https://infiniteundo.com/post/25509354022/more-falsehoods-programmers-believe-about-time)
- [The Problem with Time & Timezones by Computerphile](https://www.youtube.com/watch?v=-5wpm-gesOY)
