---
title: "Clamshell: 2020-06-21"
lead: "Recent things in a clamshell"
description: "brief news 2020-06-21"

date: 2020-06-21T10:26:07-07:00
author: "Jonatan Ivanov"
type: post

categories: ["clamshell"]
tags: ["spring", "spring-boot", "java", "openjdk", "adoptopenjdk", "eclipse", "mozilla", "firefox", "VPN", "java", "groovy", "security", "gc", "graalvm", "tornadovm", "chrome", "performance", "feature flags", "piranha", "AWS", "cloud", "cloud formation"]
---

Including:

- Whats New in Spring Boot 2.3
- AdoptOpenJDK joins to the Eclipse Foundation
- Mozilla VPN
- JDK 15 is now in Rampdown Phase One
- A history of the Groovy programming language
- Simple & effective G1 GC tuning tips
- TornadoVM
- 2020 Chrome Extension Performance Report
- Piranha
- AWS CloudFormation Guard
- Spotify Backstage

<!--more-->

# Whats New in Spring Boot 2.3

{{< youtube WL7U-yGfUXA >}}
<br>

# AdoptOpenJDK joins to the Eclipse Foundation

Here's the official announcement: [AdoptOpenJDK to join the Eclipse Foundation](https://blog.adoptopenjdk.net/2020/06/adoptopenjdk-to-join-the-eclipse-foundation/)

# Mozilla VPN

[Introducing Firefox Private Network VPN’s Official Product – the Mozilla VPN](https://blog.mozilla.org/futurereleases/2020/06/18/introducing-firefox-private-network-vpns-official-product-the-mozilla-vpn/)

# JDK 15 is now in Rampdown Phase One

JDK 15 has been forked from the main line and is now [it is in Rampdown Phase One](https://mail.openjdk.java.net/pipermail/jdk-dev/2020-June/004401.html)

# A history of the Groovy programming language

>Groovy was created as a complementary language to Java—its dynamic counterpart. It would look and feel like Java but focus on extensibility and rapid innovation. Groovy would borrow ideas from dynamic languages like Ruby, Python and Smalltalk where needed to provide compelling JVM solutions for some of Java’s shortcomings.

See the original post: [A history of the Groovy programming language](https://dl.acm.org/doi/abs/10.1145/3386326)

# Simple & effective G1 GC tuning tips

G1 GC is an adaptive garbage collection algorithm that has become the default GC algorithm since Java 9. The article shares a few tips to tune G1 Garbage collector to obtain optimal performance: [Simple & effective G1 GC tuning tips](https://blog.gceasy.io/2020/06/02/simple-effective-g1-gc-tuning-tips/).

# TornadoVM

[TornadoVM](https://github.com/beehive-lab/TornadoVM) is a plug-in to OpenJDK and GraalVM that allows programmers to automatically run Java programs on heterogeneous hardware. TornadoVM currently targets OpenCL-compatible devices and it runs on multi-core CPUs, dedicated GPUs (NVIDIA, AMD), integrated GPUs (Intel HD Graphics and ARM Mali), and FPGAs (Intel and Xilinx).

# 2020 Chrome Extension Performance Report

[debugbear](https://www.debugbear.com/) tested how the 1000 most popular Chrome extensions affect browser performance. The main metrics they consider are CPU consumption, memory consumption, and whether the extension makes pages render more slowly, here's the full reeport: [2020 Chrome Extension Performance Report](https://www.debugbear.com/blog/2020-chrome-extension-performance-report)

# Piranha

[Piranha](https://github.com/uber/piranha) is a tool to automatically refactor code related to stale feature flags. At a higher level, the input to the tool is the name of the flag and the expected behavior, after specifying a list of APIs related to flags in a properties file. Piranha will use these inputs to automatically refactor the code according to the expected behavior.

The supported languages are: Objective-C, Swift, and Java.

# AWS CloudFormation Guard

[CloudFormation Guard](https://github.com/aws-cloudformation/cloudformation-guard) is a CLI tool that checks AWS CloudFormation templates for policy compliance using a simple, policy-as-code, declarative syntax. There is also an AWS Lambda version of it. And there is CloudFormation Guard Rulegen that automatically generates CloudFormation Guard rules from existing CloudFormation templates.

# Spotify Backstage

[Backstage](https://backstage.io/) is an open-source developer portal with a unified frontend for infrastructure tooling, services, and documentation. It gives developers a uniform overview of all their resources, regardless of how and where they are running, as well as an easy way to onboard and start using those tools. It also allows the creation of new resources, such as backend services running in Kubernetes.
Check out the announcement: [What the Heck is Backstage Anyway?](https://engineering.atspotify.com/2020/03/17/what-the-heck-is-backstage-anyway/) and their [GitHub Repo](https://github.com/spotify/backstage).
