---
title: "Clamshell: 2021-04-17"
lead: "Recent news in tech in a clamshell"
description: "Brief News: 2021-04-17"

date: 2021-04-17T17:49:57-07:00
author: "Jonatan Ivanov"
type: post

categories: ["clamshell"]
tags: ["Gradle", "Git", "security"]
draft: true
---

Including
<!--more-->

# Gradle 7.0
[Gradle 7.0](https://docs.gradle.org/7.0/release-notes.html) was released with a ton of new features/improvements/fixes and maybe most importantly: Java 16 support.

# Git clone vulnerability
[Git clone vulnerability announced](https://github.blog/2021-03-09-git-clone-vulnerability-announced/).

The Git project [released](https://lore.kernel.org/git/xmqqim6019yd.fsf@gitster.c.googlers.com/) new versions to address CVE-2021-21300: a [security vulnerability](https://github.com/git/git/security/advisories/GHSA-8prw-h3cq-mghm) where a specially crafted repository can execute code during a git clone on case-insensitive file systems which support symbolic links by abusing certain types of clean/smudge filters, like those configured by Git LFS.

# security.txt
[security.txt](https://securitytxt.org/) is a proposed standard which allows websites to define security policies.
