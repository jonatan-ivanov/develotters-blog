---
title: "Clamshell: 2020-08-16"
lead: "Recent news in tech in a clamshell"
description: "brief news 2020-08-16"

date: 2020-08-16T20:20:28-07:00
author: "Jonatan Ivanov"
type: clamshell

categories: ["clamshell"]
tags: ["Java", "OpenJDK", "git", "GitHub", "records", "Project Loom", "RSocket", "Kafka"]
---

- OpenJDK is moving to GitHub
- A peek at the roadmap for pattern matching and more
- Serializable Records
- Java 14 Feature Spotlight: Records
- State of Loom
- Project Loom: Modern Scalable Concurrency for the Java
- The role of preview features in Java 14, Java 15, Java 16, and beyond
- The new features in Java 15
- The RSocket Revolution
- Kafka Summit


<!--more-->

# OpenJDK is moving to GitHub

[As I mentioned earlier](../2020-06-14/#javas-migration-to-github), OpenJDK is moving to GitHub, now the exact target date for the transition of the `jdk/jdk` repository is [set to Saturday September 5, 2020](https://mail.openjdk.java.net/pipermail/jdk-dev/2020-August/004588.html). Here you can find the repo on GitHub: [openjdk/jdk](https://github.com/openjdk/jdk) and here is the project page: [Skara](https://wiki.openjdk.java.net/display/SKARA/Skara).

# A peek at the roadmap for pattern matching and more

Brian Goetz sketched out a rough roadmap for pattern matching, [see it on the Amber Expert Group mailing list](https://mail.openjdk.java.net/pipermail/amber-spec-experts/2020-August/002318.html).

# Serializable Records

An article about Record serialization and how it differs from serialization of normal classes: [Serializable Records](https://inside.java/2020/07/20/serializablerecords/) fyi: this is about Java's object serialization (`ObjectInputStream` and `ObjectOutputStream`) not about xml, json, etc.

# Java 14 Feature Spotlight: Records

Connected to the previos one, an article from Brian Goetz about [Records](https://www.infoq.com/articles/java-14-feature-spotlight/).

# State of Loom

An article about the hisory, the current state and the future of project Loom:

- [State of Loom: Part 1](https://cr.openjdk.org/~rpressler/loom/loom/sol1_part1.html)
- [State of Loom: Part 2](https://cr.openjdk.org/~rpressler/loom/loom/sol1_part2.html)

# Project Loom: Modern Scalable Concurrency for the Java

{{< youtube 23HjZBOIshY >}}

# The role of preview features in Java 14, Java 15, Java 16, and beyond

How Oracle gathers feedback on new JDK functionality with preview, experimental, and incubating features: [The role of preview features in Java 14, Java 15, Java 16, and beyond](https://blogs.oracle.com/javamagazine/the-role-of-previews-in-java-14-java-15-java-16-and-beyond)

# The new features in Java 15

Forthcoming update to standard Java, now in the release candidate stage and targeted for GA release at 2020-09-15: text blocks, garbage collectors, hidden classes, and previews of pattern matching and records: [The new features in Java 15](https://www.infoworld.com/article/3534133/jdk-15-the-new-features-in-java-15.html)

# The RSocket Revolution

{{< youtube ipVfRdl5SP0 >}}
<br>

# Kafka Summit

Discover the world of event streaming on [Kafka Summit 2020](https://www.kafka-summit.org/2020/) (August 24 - 25)
