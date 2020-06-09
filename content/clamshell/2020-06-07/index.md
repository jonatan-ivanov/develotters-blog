---
title: "Clamshell: 2020-06-07"
lead: "Recent things in a clamshell"
description: "brief news 2020-06-07"

date: 2020-06-07T12:22:18-07:00
author: "Jonatan Ivanov"
type: post

categories: ["clamshell"]
tags: ["git", "github", "jvm", "java", "sql injection", "pwned", "JetBrains", "spring", "spring boot", "gradle", "nmap", "security", "testing", "JavaScript", "Mob Programming", "microservices"]
---

Including:
- GitHub Design Updates
- How to write a (toy) JVM
- Love it or Hate it, Java Continues to Evolve
- Architecting Low-Latency Java Systems at Massive Scale
- Java at Speed 
- Haveibeenpwned.com pwned our helpdesk: GLPI 9.4.5 SQL Injection
- JetBrains Technology Day for Java
- 97 Things Every Java Programmer Should Know
- Migrating Spring Boot's Build to Gradle
- scan.nmap.me
- TIL: break, const, goto in Java
- asserted.io
- Mob Programming
- Don't Do Microservices If You Can

<!--more-->

# GitHub Design Updates

GitHub updated the repository pages and made some layout changes to the Code tab. They added a sidebar to elevate project information and given more space to features that support the development workflow.

Check out the [preview](https://gist.github.com/broccolini/2245234ac3a4936049e8ffc13f376986) which also tells you how to enable it.

# How to write a (toy) JVM

A toy (and incomplete) JVM in Go to show the core principles behind it: [How to write a (toy) JVM](https://zserge.com/posts/jvm/)

Thanks [Spencer](https://github.com/srt4) for the article

# Love it or Hate it, Java Continues to Evolve

A nice [article by Simon Ritter](https://www.azul.com/love-it-or-hate-it-java-continues-to-evolve/)

# Architecting Low-Latency Java Systems at Massive Scale

Simon Ritter strikes again by his talk on NY Java SIG (the Java User Group of New York): [Architecting Low-Latency Java Systems at Massive Scale](https://www.youtube.com/watch?v=8MgEG7gztjw)

By the way, I aslo highly recommend this connecting talk: [Java at Speed by Gil Tene](https://www.youtube.com/watch?v=ot3PESmNXhE)

# Haveibeenpwned.com pwned our helpdesk: GLPI 9.4.5 SQL Injection

It's 2020 and SQL injection is still a huge problem, here is a recap about an accidental one, when [Haveibeenpwned.com accidentally pwned a company's ticketing system](https://fyr.io/2020/05/30/haveibeenpwned-com-pwned-our-helpdesk-glpi-9-4-5-sql-injection/)

# JetBrains Technology Day for Java

It's a free virtual event wher industry leaders will present on a range of topics to help you boost your skills and creativity. The agenda includes talks on Modern Java, Frameworks, Testing, Concurrent Garbage Collectors, Contributing to OSS, and much more. [Join on July 10, 2020](https://pages.jetbrains.com/technology-day-java-2020)

# 97 Things Every Java Programmer Should Know

Edited by [Kevlin Henney](https://twitter.com/KevlinHenney) and [Trisha Gee](https://twitter.com/trisha_gee), the book: [97 Things Every Java Programmer Should Know](https://www.oreilly.com/library/view/97-things-every/9781491952689/) reflects lifetimes of experience writing Java software and living with the process of software development. Great programmers share their collected wisdom to help you rethink Java practices, whether working with legacy code or incorporating changes since Java 8.

# Migrating Spring Boot's Build to Gradle

Yepp, Spring Boot is moving its build system to gradle, [check out why and how](https://spring.io/blog/2020/06/08/migrating-spring-boot-s-build-to-gradle)

# scan.nmap.me

A vulnerability scanner to check out what ports are open: [scan.nmap.me](http://scan.nmap.me/)

# TIL: break, const, goto in Java

{{< tweet 1270017413984030720 >}}

# asserted.io

>I Don't Always Test My Code But When I Do I Production

[asserted.io](https://asserted.io/) hepls you writing uptime tests in Mocha (JavaScript)

# Mob Programming

[`mob`](https://github.com/remotemobprogramming/mob) is an open source command line tool written in go which supports remote [Mob Programming](https://en.wikipedia.org/wiki/Mob_programming), check out the [readme](https://github.com/remotemobprogramming/mob)

[![asciicast](https://asciinema.org/a/321885.svg)](https://asciinema.org/a/321885)

# Don't Do Microservices If You Can

>In the last few years, there has been a wave of hype that crosses IT-dedicated media back and forth, growing bigger and bigger. And this wave is about microservices.
>
>Countless articles, blog posts, videos, and slideshows dedicated to microservices, how to design them, or how to apply them to existing applications.
>
>There are also some rare publications with a more sober look at microservices. This article is my attempt to amplify this voice of wisdom.

[Don't Do Microservices If You Can on DZone](https://dzone.com/articles/dont-do-microservices-if-you-can)
