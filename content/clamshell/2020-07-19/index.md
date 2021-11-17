---
title: "Clamshell: 2020-07-19"
lead: "Recent news in tech in a clamshell"
description: "brief news 2020-07-19"

date: 2020-07-19T11:20:00-07:00
author: "Jonatan Ivanov"
type: clamshell

categories: ["clamshell"]
tags: ["twitter", "hack", "security", "stack overflow", "terminal", "CLI", "Java", "JDK", "Open Source", "GitHub", "Micronaut", "ZGC"]
---

- The Story of the Twitter Attack
- Signs Your Software is Rotting
- StackOverflow cli
- Best of the JDK Feature Face-Off Results
- The journey of the world’s open source code to the Arctic
- GitHub Availability Report
- Introduction to Micronaut - Ultra Lightweight Java Microservices
- Launching docs.github.com
- ZGC: Using -XX:SoftMaxHeapSize
- Bottlerocket OS

<!--more-->

# The Story of the Twitter Attack

Several people involved in the events that took down Twitter this week spoke with The Times, giving the first account of what happened as a pursuit of Bitcoin spun out of control: [Hackers Tell the Story of the Twitter Attack From the Inside](https://www.nytimes.com/2020/07/17/technology/twitter-hackers-interview.html)

# Signs Your Software is Rotting

In this article, Matt Belcher explores why software rot is an issue, outlines some tell-tale signs that your software is in decline, and some ways you can address it: [Signs Your Software is Rotting](https://codurance.com/2020/06/09/signs-your-software-is-rotting/)

# StackOverflow cli

[`so`](https://github.com/samtay/so) is a terminal interface for StackOverflow written in Rust.

![so-demo](https://raw.githubusercontent.com/samtay/so/9478b5b382e9b4531613996441e33f4d31894ac1/assets/demo.gif)

# Best of the JDK Feature Face-Off Results

{{< tweet user="java" id="1281595323685703683">}}

# The journey of the world’s open source code to the Arctic

>Over the last several months, our archive partners [Piql](https://www.piql.com/), wrote 21TB of repository data to 186 reels of piqlFilm (digital photosensitive archival film).

Wait, what!? Photosensitive archival film??? Actually, it's an awesome idea. :o
[GitHub Archive Program: the journey of the world’s open source code to the Arctic](https://github.blog/2020-07-16-github-archive-program-the-journey-of-the-worlds-open-source-code-to-the-arctic/)

# GitHub Availability Report

On the first Wednesday of each month, GitHub will publish a report describing their availability, including a description of any incidents that may have occurred and update you on how they are evolving our engineering systems and practices in response: [GitHub Availability Report](https://github.blog/2020-07-08-introducing-the-github-availability-report/)

# Introduction to Micronaut - Ultra Lightweight Java Microservices

Graeme Rocher, the creator of Micronaut and Grails, visits the NYJavaSIG and gives an introduction to Micronaut.

{{< youtube Gkt8h4LWFCw >}}
<br>

# Launching docs.github.com

A single place where you can find the information to learn about GitHub on [docs.github.com](https://docs.github.com/).
Read the announcement: [Launching docs.github.com](https://github.blog/2020-07-01-launching-docs-github-com/)

# ZGC: Using -XX:SoftMaxHeapSize

In JDK 13 a new JVM option called `-XX:SoftMaxHeapSize=<size>` was introduced. ZGC is so far the only garbage collector in HotSpot that supports this options, but work to also support it in G1 is ongoing. This option is relatively new, and perhaps not yet widely known, this article explains when and how to use it: [ZGC | Using -XX:SoftMaxHeapSize](https://malloc.se/blog/zgc-softmaxheapsize)

# Bottlerocket OS

[Bottlerocket](https://github.com/bottlerocket-os/bottlerocket) is a free and open-source Linux-based operating system meant for hosting containers. Bottlerocket is currently in a developer preview phase.
