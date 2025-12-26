---
title: "High Cardinality"
lead: "Friend or Foe?"
description: "High Cardinality - Friend or Foe?"

date: 2022-10-23T17:40:00-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["metrics", "observability", "distributed tracing", "performance"]
---

In mathematics, [cardinality](https://en.wikipedia.org/wiki/Cardinality) is the measure of the number of elements (distinct values) of a set. For example, the set `{200,404,503}` contains 3 elements so the cardinality of it is 3. But what does "High Cardinality" have to do with (time series) metrics?
Glad you asked, the answer is *everything*. :)
<!--more-->

## HTTP Example

Let's say you want to count the incoming HTTP requests to your web service so that you are aware of the traffic patterns/throughput. If you create a `Counter` and increment it when your service receives an incoming request, that would look something like this ([Micrometer](https://docs.micrometer.io/micrometer/reference/concepts.html) example):
```java
Counter.builder("http.requests")
    .register(registry)
    .increment();
```

This will result in one time series (Prometheus output):
```
http_requests_total 10.0
```

With this, you can see the number of incoming HTTP requests (10). The cardinality of this metric is 1 since you have one time series.

## Increasing Cardinality

This is great but you might want more, for example tracking the traffic patterns/throughput for the different HTTP [methods](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods) (e.g.: `GET` vs. `POST`). This is what dimensions (or tags) are for. Dimensions let you slice your metrics and drill down along them. This means that if you add an HTTP method dimension (tag) you can track the individual methods or any combinations of them, e.g.:
- How many `GET` requests did the service receive?
- How many `POST` requests did the service receive?
- How many `POST` + `DELETE` requests did the service receive?
- How many requests did the service receive?

Doing this would look something like this ([Micrometer](https://docs.micrometer.io/micrometer/reference/concepts.html) example):
```java
Counter.builder("http.requests")
    .tag("method", method)
    .register(registry)
    .increment();
```

Let's say `GET`, `POST`, `PUT`, and `DELETE` are supported and everything else will be mapped to `UNSUPPORTED` by your service. With this behavior, doing the above will result in 5 time series (Prometheus output):
```
http_requests_total{method="GET",} 3.0
http_requests_total{method="POST",} 2.0
http_requests_total{method="PUT",} 1.0
http_requests_total{method="DELETE",} 1.0
http_requests_total{method="UNSUPPORTED",} 3.0
```

Now you can track the number of incoming HTTP requests by HTTP methods. The cardinality of this metric is 5 since you have 5 time series (5 different possible HTTP methods).

## Further Increasing Cardinality

What if you also want to track the [status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)?
```java
Counter.builder("http.requests")
    .tag("method", method)
    .tag("status", status)
    .register(registry)
    .increment();
```

Since there are quite a few status codes, you can have much more time series:

```
http_requests_total{method="GET",status="200",} 1.0
http_requests_total{method="GET",status="404",} 1.0
http_requests_total{method="GET",status="500",} 1.0
http_requests_total{method="POST",status="201",} 1.0
http_requests_total{method="POST",status="403",} 1.0
http_requests_total{method="PUT",status="503",} 1.0
http_requests_total{method="DELETE",status="204",} 1.0
http_requests_total{method="UNSUPPORTED",status="501",} 3.0
```

Not every combination is valid but let's say any `GET`, `POST`, `PUT`, and `DELETE` call can result in one of 50 status codes and `UNSUPPORTED` is always `501`. So you can have `50 * 4 + 1 = 201` time series.

## Exploding Cardinality

Let's also add the name of the endpoints that this service can handle and let's say there are 10 of them (`users`, `cars`, etc.); doing this will bring cardinality up to `201 * 10 = 2010`.

Is this a problem? That's a good question and you might know the answer is... It depends.

Your time series DB (metrics backend) and your metrics library can handle way more time series than you might think (except if you are very low on memory and/or disk). But high cardinality can be a problem if you have a practically unbounded dimension. Let's see an example of that. Let's say instead of the name of the endpoint you add the URI: `/users/123`, `/cars/456`, etc. If you have a million users and 1000 cars doing this will mean a one-billion multiplier in your time series on top of the cardinality that you already have.

## High Cardinality

But the situation is somewhat worse than this. Since the URI is user input, this practically means infinite instead of the one-billion multiplier since users can generate HTTP requests with a random number generator until your service runs out of memory. This is usually what we mean by high cardinality: a lot of data is ok but infinite data will cause problems since you cannot store an endless amount of data in non-infinite space, either your service or your metrics backend will suffer.

**Please always normalize user data and be aware of the cardinality of non-user data!**

I'm one of the maintainers of [Micrometer](https://micrometer.io/), we are getting issues every once in a while from users complaining about memory leaks. By now you might have figured out what is the issue they are facing in these cases: they added a tag that has high cardinality (often user input) and they ran out of heap because of that. Unfortunately, we can't do anything with this, you need to normalize the data and eliminate high cardinality dimensions.

## But what if I need high cardinality data?

This is a very common use case and in fact, high-cardinality data is a vital part of Observability, there is a high chance that you will need it at some point. Instead of trying to attach this data to your metrics, try to use a different output that was designed to contain high cardinality data, e.g.: logging, distributed tracing, event store, etc.

You can correlate this data (logs, traces, etc.) using Exemplars but that will be a topic for another post.
