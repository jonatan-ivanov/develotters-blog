---
title: "Clamshell: 2021-03-03"
lead: "Recent news in tech in a clamshell"
description: "Brief News: 2021-03-03"

date: 2021-03-03T00:14:44-08:00
author: "Jonatan Ivanov"
type: clamshell

categories: ["clamshell"]
tags: ["Java", "JDK", "Devnexus", "CTO", "security"]
---

- Devnexus 2021
- Schedule for Foojay Virtual JUG Tour
- 2021 State of Chaos Engineering
- JDK 17 Early-Access Builds
- JEP draft: Frozen Arrays
- Deciphering the stack trace in JVM crash logs
- Awesome CTO
- URH
- Microsoft Azure Attestation
- git-notify
<!--more-->

# Devnexus 2021
[Devnexus 2021 talks are online](https://www.youtube.com/c/devnexus-conference/videos)

# Schedule for Foojay Virtual JUG Tour
[Virtual Foojay JUG Tour to be held throughout March and April](https://foojay.io/today/schedule-for-foojay-virtual-jug-tour/)

# 2021 State of Chaos Engineering
[Gremlin's report about the state of Chaos Engineering](https://www.gremlin.com/state-of-chaos-engineering/2021/)  
They ask for contact details but they will not verify if your email address is fake or not.

# JDK 17 Early-Access Builds
[Latest Build](https://jdk.java.net/17/), [Release Notes](https://jdk.java.net/17/release-notes).

# JEP draft: Frozen Arrays
[JEP draft: Frozen Arrays](https://openjdk.java.net/jeps/8261007) introduces a new variation within the built-in Java array types, which is unmodifiable (shallowly immutable).  
Frozen arrays can be safely shared without coordination or risk of unexpected modification. Freezing is a more efficient alternative to defensive copying, in that the copy can frequently be optimized away by the runtime.

# Deciphering the stack trace in JVM crash logs
The post [Deciphering the stack trace](https://inside.java/2021/02/12/deciphering-the-stacktrace/) looks at crash logs, the `hs_err` file, that is generated when the Java Virtual Machine crashes. It tries to find out what is going wrong, and which component to blame.

# Awesome CTO
[Awesome CTO](https://github.com/kuchin/awesome-cto) is a curated and opinionated list of resources for Chief Technology Officers and VP R&D, with the emphasis on startups and hyper-growth companies.

# URH
[The Universal Radio Hacker (URH)](https://github.com/jopohl/urh) is a complete suite for wireless protocol investigation with native support for many common Software Defined Radios.

# Microsoft Azure Attestation
[Microsoft Azure Attestation](https://azure.microsoft.com/en-us/services/azure-attestation/) is a A unified solution for remotely verifying the trustworthiness of a platform and integrity of the binaries running inside it.

# git-notify
[git-notify]() helps to communicate important updates to your team via git commit messages. Sometimes you need to communicate changes to other developers on your project. In a small team, a Slack message works okay, but in larger teams and distributed organizations (such as open source projects), reaching everyone can be a pain.
