---
title: "Clamshell: 2020-10-19"
lead: "Recent news in tech in a clamshell"
description: "Brief News: 2020-10-19"

date: 2020-10-19T12:00:00-07:00
author: "Jonatan Ivanov"
type: clamshell

categories: ["clamshell"]
tags: ["FSF", "git", "Distributed Tracing", "Java", "JDK", "Collections", "security", "Exceptions", "GC", "CLI"]
---

- FSF is 35
- Git 2.29
- Building Netflix's Distributed Tracing Infrastructure
- Immutable Collections in Java using Sealed Types
- JDK 15 Release: 64 New Features and APIs
- Cloudflare API Shield
- Java Exception Handling Examples in Open Source Projects
- What is Garbage collection log, Thread dump, Heap dump?
- Java Magazine: Quiz yourself
- bit
- nb
<!--more-->

# FSF is 35

The Free Software Foundation is celebrating its 35th birthday: [FSF at 35 -- join us in celebrating the incredible community](https://www.fsf.org/blogs/community/fsf-at-35-join-us-in-celebrating-the-incredible-community)

# Git 2.29

[Highlights from Git 2.29](https://github.blog/2020-10-19-git-2-29-released/)

# Building Netflix's Distributed Tracing Infrastructure

If you are not familiar with Distributed Tracing, watch Adrian Cole's short talk about it first: [Observability 3 ways: Logging, Metrics & Tracing](https://www.youtube.com/watch?v=juP9VApKy_I) Then Netflix's Engineers will tell you how are they [Building Netflix’s Distributed Tracing Infrastructure](https://netflixtechblog.com/building-netflixs-distributed-tracing-infrastructure-bb856c319304).

# Immutable Collections in Java using Sealed Types

How to define contractual, structural, and verifiable immutable Java collections by Don Raab: [Immutable Collections in Java using Sealed Types](https://medium.com/javarevisited/immutable-collections-in-java-using-sealed-types-ae8eb580fc1e)

# JDK 15 Release: 64 New Features and APIs

I was waiting for this article to come out but somehow I've missed it. Azul has great articles about the major Java releases where they explain what is new: [JDK 15 Release: 64 New Features and APIs](https://www.azul.com/jdk-15-release-64-new-features-and-apis/)

# Cloudflare API Shield

Cloudflare has recently introduced [API Shield](https://blog.cloudflare.com/introducing-api-shield/), a free security tool that protects API traffic using mTLS authentication.

# Java Exception Handling Examples in Open Source Projects

In "Effective Java", Joshua Bloch wrote 9 tips about how to handle exceptions in Java. These tips have become the de facto standard for Java exception handling. This post lists some examples of Java exception handling in some open source projects and comments the usage by following the 9 tips of exception handling: [Java Exception Handling Examples in Open Source Projects](https://www.programcreek.com/2020/10/java-exception-handling-in-open-source-projects/).

# What is Garbage collection log, Thread dump, Heap dump?
The JVM generates 3 critical artifacts that are useful for optimizing the performance and troubleshooting production problems. Those artifacts are:

- Garbage collection (GC) log
- Thread Dump
- Heap Dump

The article explains where to use them, how to capture them, how to analyze them and their differences: [What is Garbage collection log, Thread dump, Heap dump?](https://blog.gceasy.io/2020/10/15/what-is-garbage-collection-log-thread-dump-heap-dump/).

# Java Magazine: Quiz yourself
- [Use the Files class to copy or move files and directories](https://blogs.oracle.com/javamagazine/quiz-yourself-use-the-files-class-to-copy-or-move-files-and-directories)
- [Create worker threads using Runnable and Callable](https://blogs.oracle.com/javamagazine/quiz-yourself-create-worker-threads-using-runnable-and-callable-advanced)

# bit
[Bit](https://github.com/chriswalz/bit) is a modern Git CLI.

# nb

CLI plain-text note-taking, bookmarking, and archiving with encryption, filtering and search, Git-backed versioning and syncing, Pandoc-backed conversion, and more in a single portable script: [nb](https://github.com/xwmx/nb).
