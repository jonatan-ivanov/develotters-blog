---
title: "Clamshell: 2021-05-08"
lead: "Recent news in tech in a clamshell"
description: "Brief News: 2021-05-08"

date: 2021-05-08T12:50:54-07:00
author: "Jonatan Ivanov"
type: post

categories: ["clamshell"]
tags: ["Java", "Oracle", "Java 8", "Linux", "Open Source", "Terminal", "Security", "CodeCov", "Docker", "README", "crypto"]
---

- Java Support Roadmap
- Java Pub House - Episode 96. Micrometer
- University duo thought it would be cool to sneak bad code into Linux as an experiment
- Write a Good Dockerfile in 19 'Easy' Steps
- CodeCov Security Breach
- Crypto miners are killing free CI
- WebAssembly Summit
- Fig
- Starship
- skopeo
- readme.so

<!--more-->

# Java Support Roadmap
This is a very sad announcement to me: Oracle plans to extend Java 8 support and give "Extended Support" until 2030 December (practically till 2031), see: [Java Support Roadmap](https://www.oracle.com/java/technologies/java-se-support-roadmap.html). I have never really understood why can't we just leave Java 8 alone and let it enjoy its retirement. Just for the comparison: Java 11 is supported till 2026 September while Java 17 should retire in 2029 September.

# Java Pub House - Episode 96. Micrometer
As you might know, I'm a [Micrometer](https://micrometer.io/) maintainer, the Java Pub House folks talked about Micrometer this month:

{{< youtube HGcChkJzdFs >}}
<br>

# University duo thought it would be cool to sneak bad code into Linux as an experiment
Computer scientists at the University of Minnesota theorized they could sneak vulnerabilities into open-source software – but when they tried subverting the Linux kernel, it [backfired spectacularly](https://www.theregister.com/2021/04/21/minnesota_linux_kernel_flaws_update/).

[See the research paper](https://github.com/QiushiWu/QiushiWu.github.io/blob/main/papers/OpenSourceInsecurity.pdf)

{{< tweet 1384785747874656257 >}}

# Write a Good Dockerfile in 19 'Easy' Steps
If you write your own Dockerfile(s), please read this article: [Write a Good Dockerfile in 19 'Easy' Steps](https://jkutner.github.io/2021/04/26/write-good-dockerfile.html), this: [Write a Good Dockerfile in 0 Steps](https://jkutner.github.io/2021/04/28/write-good-dockerfile-zero-steps.html), watch this:

{{< youtube pnOLWFBpb2A >}}
<br>
and please do not write Dockerfiles anymore. :)

# CodeCov Security Breach
On Thursday, April 1st, CodeCov found out that someone had gained unauthorized access to their Bash Uploader script and modified it. The actor gained access because of an error in Codecov’s Docker image creation process that allowed the actor to extract the credential required to modify the Bash Uploader script.
See the [announcement](https://about.codecov.io/security-update/) for the details.

# Crypto miners are killing free CI
As the market capitalization of crypto currencies grows, it's becoming profitable for bad actors to make a full time job of attacking the free tiers of PaaS providers, read more [Crypto miners are killing free CI](https://layerci.com/blog/crypto-miners-are-killing-free-ci).

# WebAssembly Summit
{{< youtube qsbPLbSJ_RY >}}
<br>

See the whole [YouTube playlist](https://www.youtube.com/playlist?list=PL6ed-L7Ni0yRnaN8-l2wfA0u3ILmyJMkz).

# Fig
[Fig](https://withfig.com/) adds VSCode-style autocomplete to your existing Terminal.

# Starship
[Starship](https://starship.rs/) minimal, fast, and customizable cross-shell prompt.

# skopeo
[skopeo](https://github.com/containers/skopeo) is a command line utility that can perform various operations on container images and image repositories. It can work with OCI images as well as Docker images.

# readme.so
[readme.so](https://readme.so/) is a simple editor allows you to quickly add and customize the sections you need for your project's readme.
