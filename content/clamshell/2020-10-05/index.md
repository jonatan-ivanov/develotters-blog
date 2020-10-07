---
title: "Clamshell: 2020-10-05"
lead: "Recent news in tech in a clamshell"
description: "Brief News: 2020-10-05"

date: 2020-10-05T09:00:00-07:00
author: "Jonatan Ivanov"
type: post

categories: ["clamshell"]
tags: ["hacktoberfest", "git", "github", "open source", "Microsoft", "Windows", "Java", "JDK", "GC", "quality", "lambda", "cheatsheet", "security"]
---

- Hacktoberfest 2020
- Oracle Developer Live Java 2020
- Java InfoQ Trends Report (September 2020)
- Awesome Cheatsheets
- A convenient list of essential Java 15 resources
- GitHub Code Scanning is now available
- A Picture of Java in 2020
- Microsoft Windows XP Source Code Reportedly Leaked Online
- The Garbage Collection Bibliography
- Is High Quality Software Worth the Cost?
- How do lambda expressions really work in Java?
- duf
- diagrams
<!--more-->

# Hacktoberfest 2020

It's [Hacktoberfest](https://hacktoberfest.digitalocean.com/) again but this year [maintainers drown in tsunami of pull-request spam](https://www.theregister.com/2020/10/01/digitalocean_hacktoberfest_pull_request_spam/), one could say it is [hurting Open Source](https://blog.domenic.me/hacktoberfest/). If you want a good laugh or cry (or both), check out the tweets of [@shitoberfest](https://twitter.com/shitoberfest).

If you want to participate (I ecourage you, it's fun), check out the [updated rules](https://hacktoberfest.digitalocean.com/hacktoberfest-update) since the organizers needed to change them because of the enormous amunt of spam.

# Oracle Developer Live Java 2020

- [ZGC: The Next Generation Low-Latency Garbage Collector](https://www.youtube.com/watch?v=88E86quLmQA)  
(also Per Liden's article: [ZGC | What's new in JDK 15](https://malloc.se/blog/zgc-jdk15))
- [Project Loom - Modern Scalable Concurrency for the Java Platform](https://www.youtube.com/watch?v=fOEPEXTpbJA)  
(this is the same talk I posted ~2 months ago)
- [Continuous Monitoring with JDK Flight Recorder](https://www.youtube.com/watch?v=plYESjZ12hM)
- [Collections Refueled](https://www.youtube.com/watch?v=lwp2RZ__0ko)

# Java InfoQ Trends Report (September 2020)

The article provides a summary of how the InfoQ editorial team currently sees the adoption of technologies and emerging trends within the Java space. They focus on Java the language, as well as related languages like Kotlin and Scala, Groovy, the Java Virtual Machine, and Java-based frameworks and utilities: [Java InfoQ Trends Report (September 2020)](https://www.infoq.com/articles/java-jvm-trends-2020/)

Thanks Gabor for the article. :)

# Awesome Cheatsheets

Cheatsheets for popular programming languages, frameworks and development tools: [LeCoupa/awesome-cheatsheets](https://github.com/LeCoupa/awesome-cheatsheets).

# A convenient list of essential Java 15 resources

Java 15 is here. On 2020-09-15, Oracle officially released the latest version of the JDK, consisting of 14 separate JDK Enhancement Proposals (JEPs), here some information from the Oracle Java Platform Group and from Java Magazine about it: [https://blogs.oracle.com/javamagazine/a-convenient-list-of-essential-java-15-resources](https://blogs.oracle.com/javamagazine/a-convenient-list-of-essential-java-15-resources).

# GitHub Code Scanning is now available

The general availability of [GitHub Code Scanning was announced](https://github.blog/2020-09-30-code-scanning-is-now-available/) last week. It is a tool to find security vulnerabilities; you can [enable it on your public repositories](https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/enabling-code-scanning-for-a-repository).


# A Picture of Java in 2020

With Java 15 released, JetBrains put together a report about the state of Java. This post was created based on data from several different sources and includes expert commentary from JetBrain's Developer Advocate Trisha Gee [A Picture of Java in 2020](https://blog.jetbrains.com/idea/2020/09/a-picture-of-java-in-2020/).

# Microsoft Windows XP Source Code Reportedly Leaked Online

The source code of Microsoft's 19-year-old operating system [has had leaked online](https://thehackernews.com/2020/09/windows-xp-source-code.html) as well as Windows Server 2003 and several Microsoft's older operating systems, including:

- Windows 2000
- Windows CE 3
- Windows CE 4
- Windows CE 5
- Windows Embedded 7
- Windows Embedded CE
- Windows NT 3.5
- Windows NT 4
- MS-DOS 3.30
- MS-DOS 6.0

# The Garbage Collection Bibliography

After 24 years, Richard Jones reworked the Garbage Collection Bibliography pages to make them more mobile-friendly. Now 2880+ entries, searchable: [The Garbage Collection Bibliography](https://www.cs.kent.ac.uk/people/staff/rej/gcbib/).

# Is High Quality Software Worth the Cost?

TL;DR: Of course, what did you think? :) Read the details in the article: [Is High Quality Software Worth the Cost?](https://martinfowler.com/articles/is-quality-worth-cost.html).

Sum-up:
>- Neglecting internal quality leads to rapid build up of cruft
>- This cruft slows down feature development
>- Even a great team produces cruft, but by keeping internal quality high, is able to keep it under control
>- High internal quality keeps cruft to a minimum, allowing a team to add features with less effort, time, and cost.
>
>Sadly, software developers usually don't do a good job of explaining this situation. Countless times I've talked to development teams who say "they (management) won't let us write good quality code because it takes too long". Developers often justify attention to quality by justifying through the need for proper professionalism. But this moralistic argument implies that this quality comes at a cost - dooming their argument. The annoying thing is that the resulting crufty code both makes developers' lives harder, and costs the customer money. When thinking about internal quality, I stress that we should only approach it as an economic argument. High internal quality reduces the cost of future features, meaning that putting the time into writing good code actually reduces cost.
>
>This is why the question that heads this article misses the point. The "cost" of high internal quality software is negative. The usual trade-off between cost and quality, one that we are used to for most decisions in our life, does not make sense >with the internal quality of software. (It does for external quality, such as a carefully crafted user-experience.) Because the relationship between cost and internal quality is an unusual and counter-intuitive relationship, it's usually hard to >absorb. But understanding it is critical to developing software at maximum efficiency.

# How do lambda expressions really work in Java?

Ben Evans looks into the bytecode to show how Java handles lambdas: [Behind the scenes: How do lambda expressions really work in Java?](https://blogs.oracle.com/javamagazine/behind-the-scenes-how-do-lambda-expressions-really-work-in-java)

# duf

[duf](https://github.com/muesli/duf) is a Disk Usage/Free Utility.

# diagrams

[diagrams](https://github.com/mingrammer/diagrams) is a Diagram as Code tool for prototyping cloud system architectures.
