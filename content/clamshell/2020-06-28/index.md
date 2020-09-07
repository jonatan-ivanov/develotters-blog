---
title: "Clamshell: 2020-06-28"
lead: "Recent news in tech in a clamshell"
description: "brief news 2020-06-28"

date: 2020-06-28T21:24:13-07:00
author: "Jonatan Ivanov"
type: post

categories: ["clamshell"]
tags: ["java", "jetbrains", "intellij idea", "generics", "OracleJDK", "OpenJDK", "Zulu", "Corretto", "AdoptOpenJDK", "micronaut", "linter", "kubernetes", "security", "owasp"]
---

- Guide to Java 15
- IntelliJ IDEA 2020.2 EAP 5: Java 15
- Background: how we got the generics we have
- OracleJDK? OpenJDK?, Zulu? Corretto?
- Introduction to Micronaut - Ultra Lightweight Java Microservices
- Super-Linter
- htmx
- Validating Kubernetes YAML for best practice and policies
- Dependency-Check

<!--more-->

# Guide to Java 15

Java 15 marks an important feature release in the build-up to Java 17, and offers some exciting new features, preview features, and incubator features for the JDK. In this article, JRebel looks at the details surrounding Java 15, including release dates, features, and adoption projections: [Guide to Java 15: Release Dates, EOL, JEPs and More](https://www.jrebel.com/blog/guide-java-15)

# IntelliJ IDEA 2020.2 EAP 5: Java 15

JetBrains showed lots of new features for you to try in the new IntelliJ IDEA 2020.2 EAP build.
Here are the main highlights:

- Java 15 support
- Related problems
- Intentions preview
- Java intention actions improvements
- Structural Search and Replace inspections
- Improvements to completion and navigation in the build.gradle file

Check out the article: [IntelliJ IDEA 2020.2 EAP 5: Java 15, Related Problems, Intentions Preview, and More](https://blog.jetbrains.com/idea/2020/06/intellij-idea-2020-2-eap-5-java-15-related-problems-intentions-preview-and-more/)


# Background: how we got the generics we have
Or, how Brian Goetz learned to stop worrying and love erasure: [How we got the generics we have by Brian Goetz](https://cr.openjdk.java.net/~briangoetz/valhalla/erasure.html)

# OracleJDK? OpenJDK?, Zulu? Corretto?

Java Pub House covers the history of OpenJDK, and uncovers the reason of why there are many JDKs out there. They dive in some of the licensing terms (hint: if you are using Oracle JDK 8, make sure you are getting security updates on with a support plan).

{{< youtube 0VmDFwi1Sto >}}
<br>

You can also listen them here: [Episode 91. OracleJDK? OpenJDK?, Zulu? Corretto? So many!](https://javapubhouse.libsyn.com/episode-91-oraclejdk-openjdk-zulu-corretto-so-many)

# Introduction to Micronaut - Ultra Lightweight Java Microservices

Graeme Rocher, the creator of Micronaut and Grails, visits the NYJavaSIG and gives an introduction to Micronaut.

{{< youtube Gkt8h4LWFCw >}}
<br>

# Super-Linter

It is a simple combination of various linters, written in bash, to help validate your source code: [Super-Linter](https://github.com/github/super-linter)

The end goal of the tool:

- Prevent broken code from being uploaded to the default branch
- Help establish coding best practices across multiple languages
- Build guidelines for code layout and format
- Automate the process to help streamline code reviews

# htmx

[htmx](https://htmx.org/) is a library that allows you to access modern browser features directly from HTML, rather than using javascript. It allows you to access AJAX, WebSockets and Server Sent Events directly in HTML, using attributes, so you can build modern user interfaces with the simplicity and power of hypertext.

# Validating Kubernetes YAML for best practice and policies

The article compares six static tools to validate and score Kubernetes YAML files for best practices and compliance: [Validating Kubernetes YAML for best practice and policies](https://learnk8s.io/validating-kubernetes-yaml)

# Dependency-Check

[Dependency-Check](https://github.com/jeremylong/DependencyCheck) is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies. It does this by determining if there is a Common Platform Enumeration (CPE) identifier for a given dependency. If found, it will generate a report linking to the associated CVE entries.
