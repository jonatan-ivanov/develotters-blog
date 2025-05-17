---
title: "The Most Common Concurrency Issues and How to Fix Them: Part 4"
lead: ""
description: "The Most Common Concurrency Issues and How to Fix Them"

date: 2020-08-27T09:00:00-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["concurrency", "java"]
---

In the previous parts ([one](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1), [two](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-2), [three](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-3)) of the series, I showed you a simple class that has three concurrency issues and I also explained these issues. In this final post, I would like to explain the tests I wrote to show the issues in action. Please let me know if you have any ideas for improving the tests.
<!--more-->

You can find the test cases in [`CounterTest.java`](https://github.com/jonatan-ivanov/concurrency-basics/blob/main/src/test/java/org/example/concurrent/CounterTest.java). Please feel free to clone/fork the repo and play with the code. You can modify the implementations (or add new ones) and watch if the tests are failing. Try to play with `synchronized`, `volatile`, and `Lock`s.

**WARNING: Since the behavior is based on "luck", the tests are not consistent, they can give false positives.**

# Testing Atomicity

Please see the [second post](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-2) of the series to make sure you understand the issue. The test which tries to reveal the issue called `shouldReturnTheIncrementedResultIfExecutedConcurrently` in [`CounterTest.java`](https://github.com/jonatan-ivanov/concurrency-basics/blob/main/src/test/java/org/example/concurrent/CounterTest.java).

This test case is using an `ExecutorService` with a huge thread-pool (see `TASK_COUNT`) to do its job. It will `submit` as many tasks into the `ExecutorService` as the size of the pool. Then `ExecutorService` will execute all of the tasks. To maximize the concurrency, the tasks start waiting for a signal before they call `increment` which is implemented utilizing a `CountDownLatch`:

{{< highlight java >}}
countDownLatch.await();
counter.increment();
{{< /highlight >}}

So a lot of tasks will be submitted into `ExecutorService` and after the last one is submitted, the `CountDownLatch` will release all of the tasks that are waiting for the signal. This means that there is a good chance that a lot of threads will try to call `increment` concurrently which is exactly what we want: if the `increment` operation is not atomic, there is a chance that two threads will read the same value, increment it and write back which means that the value at the end will be less than it should. Then the test waits for all the tasks to finish their job and checks if the value was incremented as many times as we wanted. If not, it means we detected the atomicity issue.

Please note two important things for this test:

1. Nothing guarantees that all of the tasks are waiting when `countDown` is called on the latch. We could ensure it but that would make the test more complicated. Though, it is quite likely that in this sub-optimal way, more threads are waiting than the number of cores your CPU has.
2. The number of effectively concurrent threads depends on the core count of your CPU, most of the people don't have 4000 cores in 2020. :) The test starts 4000 tasks not because it wants 4000 concurrent threads but because it wants to maximize concurrency for a while and it hopes that at least one of them will be unlucky.

# Testing Visibility

Please see the [third post](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-3) of the series to make sure you understand the issue. The test which tries to reveal the issue called `aThreadShouldSeeTheResultOfTheChangeThatAnotherThreadMade` in [`CounterTest.java`](https://github.com/jonatan-ivanov/concurrency-basics/blob/main/src/test/java/org/example/concurrent/CounterTest.java).

This test case is utilizing `CompletableFuture` to start a single background thread that tries to detect changes in the `Counter` in a `while` loop. If there was no change or if there was a change but is not visible for that thread, this will be an infinite loop. This is exactly the issue we want to test: we want to make a change and see if the background thread gets in an infinite loop.  
After submitting the task, the test gives some time to `CompletableFuture` to start it (in an ugly way) then it calls `increment` and checks if the background thread was able to see the change or it got into an infinite loop using a `CountDownLatch`. If it was not able to detect the change, it means we detected the visibility issue.

Please note that in the `while` loop we should check whether the current thread has been `interrupted` and stop the execution (e.g.: `return;`) if so. But putting things into the body of the loop (e.g.: an innocent `log.debug(...)`) could break the test: it will always report false positive (feel free to try). :) We also should cancel the `CompletableFuture` in a `try-finally` block but if the thread will not handle the interrupted flag and it won't stop: `¯\_(ツ)_/¯`.

# The Though Third

I'm not sure how to test that writing non-volatile `long` and `double` variables is not atomic (see the third post). To test this, I need to ensure visibility but not atomicity for `set` and `get` which I'm not able to do since `volatile` will ensure both for writing and reading `long` and `double` variables. Please let me know if you have any idea how can it be tested.

# Outcome

- Concurrency can be tricky
- Not writing code is usually a good idea to solve problems
- Java gives you a lot of useful tools to deal with concurrency issues
- [Java Concurrency in Practice](https://jcip.net/)
- Testing concurrency is hard

# Posts in this series

- [The Most Common Concurrency Issues and How to Fix Them: Part 1](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-1)
- [The Most Common Concurrency Issues and How to Fix Them: Part 2](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-2)
- [The Most Common Concurrency Issues and How to Fix Them: Part 3](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-3)
- [The Most Common Concurrency Issues and How to Fix Them: Part 4](/posts/the-most-common-concurrency-issues-and-how-to-fix-them-part-4)
