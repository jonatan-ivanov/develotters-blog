---
title: "Should you use Java Agents to instrument your application?"
lead: "Trade-offs around Java agent-based instrumentation"
description: "Should you use Java Agents to instrument your application?"

date: 2023-02-25T16:00:00-08:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["java", "agent", "instrumentation", "observability", "micrometer", "spring", "spring-boot"]
---

If you have worked with any APMs (or other monitoring/observability products) under Java, you might have heard something like: `[paraphrased-marketing-text]` *to track everything from performance issues to errors within your application, just attach the Java Agent to your app and all of your problems are gone* `[/paraphrased-marketing-text]`.

You can read things like this in product docs, or blog posts or hear from sales, marketing, and even in conference talks. What I think you can hear less are the trade-offs, so let's dive a little bit into that.
<!--more-->

Let's start with the good news: agents are relatively simple to adopt. If you want to observe your application, attaching a Java Agent is usually not too complicated: you "just" need to copy the agent `.jar` to your environment (e.g.: prod) and let the JVM know about it in a runtime argument. So you need to deploy and manage your app *and* the Java Agent but that's pretty much it, it's simple. Unfortunately, that's the only advantage I can think of but let me know if you know others.

But what are the disadvantages? Well, let's look into the not-so-great parts of using Java Agents to instrument your application.

## Lack of GraalVM native-image support
SubstrateVM is the runtime used for GraalVM native-image. As of today (2023-02-25), Java Agents are not supported on SubstrateVM/GraalVM native-image. This means that if you want to compile and run your app natively, agent-based instrumentation will not work. I think a lot of people today don't care about this too much but using an agent today could mean that you need to choose between the agent and GraalVM native-image tomorrow.  
Please notice that non-agent-based instrumentation can be written in a way that doesn't work with GraalVM native-image but as of today it might have better chances.

## Performance
This is just theory, I have never measured it but theoretically, agent-based instrumentation that uses a lot of reflection might not be as performant as "hardcoded" instrumentation (the instrumentation is part of the codebase) because in general reflection is usually slower than doing the same thing in a "hardcoded" way.  
Please notice that this is a **possible issue** that might impact **some** agents. Not every agent use reflection and not for everything. Also, non-reflective code (i.e.: "hardcoded" instrumentation) can be written in a non-performant way too.

## Quality of data
Since agent-based instrumentation is not a first-class citizen of your components, it might not be able to get all the data (not even with reflection) that it could get if the instrumentation would be "hardcoded" (non-agent-based), e.g.: local variables. It can change the bytecode of the instrumented components but what if you update the given component and it changes (see next)?  
Please notice that this is also a **possible issue** that might impact **some** agents. Non-reflective code (i.e.: "hardcoded" instrumentation) can be written in a way that it does not include all the data it could.

## Changing your bytecode
I heard many times that agents do not need code changes to use them, you just attach them to the JVM. On one hand, this is true but I would say that you have much bigger issues if you are afraid of code changes/deployments. On the other hand, these Java Agents are in-fact modifying your bytecode as well as the behavior of your application from the outside. This means that you might not run the code in prod that you run in other environments. Also, you might not know how the agent changed your application. So if you are afraid of code changes that you control, you should be freaked out by something that you don't control and modifies the bytecode of your application.  
Tip: check if your company has a compliance policy that prevents you using components that modifies your bytecode from the outside of your app (rare but possible).

## Weird issues
This is the consequence of the above: agents using reflection and modifying the bytecode; because of this you can run into crazy, "this is impossible but I'm looking at it right now" type of issues that are very hard to debug and troubleshoot (the code you debug might not be the code you execute in prod since the agent modified it).

Here's one example from Spring Boot: [HTTP Method overridden with the 3 first letters of the first cookie (#33921)](https://github.com/spring-projects/spring-boot/issues/33921). I highly recommend reading this, you might find it funny but I doubt the person who needed to troubleshoot this did. In a nutshell, the agent somehow replaced the HTTP method in the request with the first 3 characters of the first cookie. In this case: `GET` -> `hDz`. 🤷

If you check the comments on the issue or other issues like [#33735](https://github.com/spring-projects/spring-boot/issues/33735), [#33974](https://github.com/spring-projects/spring-boot/issues/33974), or [#31528](https://github.com/spring-projects/spring-framework/issues/31528), you will see that lots of people have issues with agents like Datadog, Microsoft Azure Monitor/Application Insights, or OpenTelemetry (this list is probably much broader).

## What should I do then?
*Disclaimer: I'm a member of the Spring OSS Engineering team and I work on [Micrometer](https://micrometer.io/) and [Spring Cloud Sleuth](https://spring.io/projects/spring-cloud-sleuth).*

My opinion is that you should only use Java Agents for instrumentation as your last resort. I think instrumentation should be as close to the instrumented component as possible. It should be a first-class citizen of it ("hardcoded"). This means that these components should instrument themselves using an instrumentation tool so whenever you upgrade even a patch version of the component you use, the instrumentation will always be in sync with any changes even if that change happened internally. The drawback of this "hardcoded" style of instrumentation is that you might need to set things up by adding a new dependency, enabling instrumentation in properties, or even writing some code that signals that your component needs to be `.instrumeted()`. As an advantage, it should (famous last sentences) solve all the issues above.

In practice, this means that if you use Spring Boot 2.x, you can add Spring Boot Actuator, Micrometer, and Spring Cloud Sleuth to your app since Spring projects are using these to instrument themselves. If you use Spring Boot 3.x, it's Actuator, Micrometer, and Micrometer Tracing. If you are not a Sprig user but let's say Quarkus or Micronaut, both of them have support for Micrometer; hopefully they will add Micrometer Tracing support soon.
