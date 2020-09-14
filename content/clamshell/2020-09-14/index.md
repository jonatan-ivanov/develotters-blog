---
title: "Clamshell: 2020-09-14"
lead: "Recent news in tech in a clamshell"
description: "Brief News: 2020-09-14"

date: 2020-09-13T09:00:00-07:00
author: "Jonatan Ivanov"
type: post

categories: ["clamshell"]
tags: ["Java", "JDK", "OpenJDK", "lazy", "Functional Programming", "OOP", "JetBrains", "IntelliJ IDEA", "Micronaut", "Kubernetes", "Metaspace", "GC", "Testing", "Spring", "Spring Boot"]
---

- Java 15 GA Release
- NYJavaSIG 25th Anniversary Event
- foojay — a place for friends of OpenJDK
- Let's Get Lazy by Venkat Subramaniam
- Vector API is proposed to target JDK 16
- Developing Micronaut Applications With IntelliJ IDEA
- Bootiful Testing by Josh Long
- 21 Books Java Developers Should Read in 2020
- Kubernetes YAML Generator
- Design Bonos
- Elastic Metaspace proposed to target JDK 16
- JDK 15 G1/Parallel GC changes
- Cognitive Biases in Software Development
- Changelog CI?
- K9s - Kubernetes CLI To Manage Your Clusters In Style

<!--more-->

# Java 15 GA Release

Java 15 General Availability Release will go out in 2020-09-15: [JDK 15](https://openjdk.java.net/projects/jdk/15/).  
[Check out the new features in Java 15](https://www.infoworld.com/article/3534133/jdk-15-the-new-features-in-java-15.html).

# NYJavaSIG 25th Anniversary Event

NYJavaSIG announced that they are hosting their 25th Anniversary with the help of:

- [Sharat Chander](https://www.linkedin.com/in/sharatchander/) - Leader of Java developer outreach program
- [Brian Goetz](https://www.linkedin.com/in/briangoetz/) - Java language architect
- [James Gosling](https://www.linkedin.com/in/jamesgosling/) - Father of Java
- [Venkat Subramaniam](https://www.linkedin.com/in/vsubramaniam/) - Mentor/instructor for software devs

**WHAT:** NYJavaSIG 25th Anniversary Epic Event!
**WHEN:** WED Sept 23, 2020 6:30-8:30pm EDT
**WHERE:** Youtube Live ([REGISTER](https://www.eventbrite.com/e/119193108797))

They are also hosting a panel discussion:

>Please join us and have an opportunity to ask this elite panel your burning Java questions. We'll select the most frequently asked, most thoughtful, most controversial, and of course the funniest ones.
>
>Submit your questions to our elite panel (mention which panelist):
>
>In the Eventbrite registration (you'll see it)  
>Via Twitter [@NYJavaSIG](https://twitter.com/nyjavasig)  
>Email the NYJavaSIG mailing list: nyjavasig@groups.io  
>Email: questions25@javasig.com

# foojay — a place for friends of OpenJDK

[foojay](https://foojay.io/) is a place for **f**riends **o**f **O**pen**J**DK.
foojay’s key features:

- Java Version Almanac
- OpenJDK Update Release Details
- OpenJDK Command Line Arguments
- Foojay Today (news about foojay)
- Comprehensive Search

# Let's Get Lazy by Venkat Subramaniam

{{< youtube PICHx2at46s >}}
<br>

# Vector API is proposed to target JDK 16

The goal of the [Vector API](https://openjdk.java.net/jeps/338) is expressing vector computations that reliably compile at runtime to optimal vector hardware instructions on supported CPU architectures and thus achieve superior performance to equivalent scalar computations. This API is [targeted to JDK 16](https://mail.openjdk.java.net/pipermail/jdk-dev/2020-August/004646.html).

# Developing Micronaut Applications With IntelliJ IDEA

Join JetBrains on September 18 for their new webinar on [Developing Micronaut applications with IntelliJ IDEA](https://blog.jetbrains.com/idea/2020/08/live-webinar-developing-micronaut-applications-with-intellij-idea/).

# Bootiful Testing by Josh Long

{{< youtube RrgL7_AW6S4 >}}
<br>

# 21 Books Java Developers Should Read in 2020

If you are Java developer and wondering what to read in the remaining of 2020, [javinpaul](https://twitter.com/javinpaul) collected quite a few of them: [21 Books Java Developers Should Read in 2020](https://medium.com/javarevisited/10-books-java-developers-should-read-in-2020-e6222f25cc72).

# Kubernetes YAML Generator

Just click through what you need (Deployment, StatefulSet, DaemonSet) and the [Octopus Kubernetes YAML Generator](https://k8syaml.com/) generates the config for you.

# Design Bonos

Directory of free resources for creatives: [designbonos.com](https://designbonos.com/)

# Elastic Metaspace proposed to target JDK 16

[JEP 387: Elastic Metaspace proposed to target JDK 16](https://mail.openjdk.java.net/pipermail/jdk-dev/2020-September/004726.html)

# JDK 15 G1/Parallel GC changes

JDK 15 just moved into the release candidate phase, this post recaps the significant changes in the G1 and Parallel GCs: [JDK 15 G1/Parallel GC changes](https://tschatzl.github.io/2020/09/01/jdk15-g1-parallel-gc-changes.html)

# Cognitive Biases in Software Development

This article presents [8 Cognitive Biases in Software Development](https://thevaluable.dev/cognitive-bias-software-development/), I also recommend checking out the [yourbias.is](https://yourbias.is/) collection.

# Changelog CI?
[Changelog CI](https://github.com/marketplace/actions/changelog-ci) is a GitHub Action that generates changelog. Then the changelog is prepended to CHANGELOG.md file and committed and/or commented to the release Pull request.


# K9s - Kubernetes CLI To Manage Your Clusters In Style

[K9s](https://github.com/derailed/k9s) provides a terminal UI to interact with your Kubernetes clusters. The aim of the project is to make it easier to navigate, observe and manage your applications in the wild. K9s continually watches Kubernetes for changes and offers subsequent commands to interact with your observed resources.
