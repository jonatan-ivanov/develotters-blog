---
title: "Clamshell: 2021-04-17"
lead: "Recent news in tech in a clamshell"
description: "Brief News: 2021-04-17"

date: 2021-04-17T17:49:57-07:00
author: "Jonatan Ivanov"
type: clamshell

categories: ["clamshell"]
tags: ["Java", "JDK", "Gradle", "Git", "security", "GraalVM", "cognitive biases", "XOR", "fuzzing", "testing"]
---

- Proposed schedule for JDK 17
- Gradle 7.0
- Announcing Spring Native Beta
- Gradle Test Logger Plugin
- Git clone vulnerability
- security.txt
- Ubiquitous Speakers 2019
- Episode 95. Ludicruos speed! Practical GraalVM
- OffHeap 60. JDK 16, Spring Native, Micronaut, Microprofile and GraalVM have new releases!
- The Backfire Effect
- XOR Tricks
- OSS-Fuzz: Continuous Fuzzing for Open Source Software

<!--more-->

# Proposed schedule for JDK 17
Mark Reinhold proposed the [release schedule](https://mail.openjdk.java.net/pipermail/jdk-dev/2021-March/005266.html) for JDK 17.

# Gradle 7.0
[Gradle 7.0](https://docs.gradle.org/7.0/release-notes.html) was released with a ton of new features/improvements/fixes and maybe most importantly: Java 16 support.

# Announcing Spring Native Beta
[Spring Native](https://github.com/spring-projects-experimental/spring-native) beta release was [announced](https://spring.io/blog/2021/03/11/announcing-spring-native-beta) and it's available on [start.spring.io](https://start.spring.io/).

# Gradle Test Logger Plugin
[gradle-test-logger-plugin](https://github.com/radarsh/gradle-test-logger-plugin) is for printing beautiful logs on the console while running tests.

# Git clone vulnerability
[Git clone vulnerability announced](https://github.blog/2021-03-09-git-clone-vulnerability-announced/).

The Git project [released](https://lore.kernel.org/git/xmqqim6019yd.fsf@gitster.c.googlers.com/) new versions to address CVE-2021-21300: a [security vulnerability](https://github.com/git/git/security/advisories/GHSA-8prw-h3cq-mghm) where a specially crafted repository can execute code during a git clone on case-insensitive file systems which support symbolic links by abusing certain types of clean/smudge filters, like those configured by Git LFS.

# security.txt
[security.txt](https://securitytxt.org/) is a proposed standard which allows websites to define security policies.

# Ubiquitous Speakers 2019
[Ubiquitous Speakers 2019](https://www.javaspecialists.eu/talks/ubiquitous/2019/) lists speakers seeming to be everywhere or in several places at the same time. :)

# Episode 95. Ludicruos speed! Practical GraalVM
{{< youtube kgJXvvxhPxg >}}
<br>

# OffHeap 60. JDK 16, Spring Native, Micronaut, Microprofile and GraalVM have new releases!
{{< youtube viCHh-j69X4 >}}
<br>

# The Backfire Effect
The Backfire Effect is a famous [cognitive bias](https://yourbias.is/) that can be really useful to know about in certain situations. 
[Regular version (contains profanity)](https://theoatmeal.com/comics/believe)
[Classroom-friendly version (no foul language)](https://theoatmeal.com/comics/believe_clean)

# XOR Tricks
`XOR` is a powerful logical operator. In Computer Science, it is a bitwise operator that can be used for [interesting tricks](https://florian.github.io/xor-trick/) but please think twice if you want to use them because others or you after a few weeks might not be able to read it.

# OSS-Fuzz: Continuous Fuzzing for Open Source Software
[OSS-Fuzz](https://github.com/google/oss-fuzz) is a continuous fuzz testing tool for open source software.
