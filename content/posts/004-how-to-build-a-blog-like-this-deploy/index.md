---
title: "How to Build a Blog Like This: Deploy"
lead: ""
description: "How to Build a Blog Like This: Deploy"
slug: "how-to-build-a-blog-deploy"

date: 2020-05-20T23:45:02-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]

tags: ["hugo", "blog", "howto", "jam-stack", "git", "github", "github-pages", "github-actions", "cdn", "https", "letsencrypt"]
---

This is the third post of a series, you might want to check the previous articles: ([Intro](/posts/how-to-build-a-blog-intro/) and [Content](/posts/how-to-build-a-blog-content/)) before reading this.

Since we only have static files, we only need a simple web server to serve the site. It can be self-hosted or hosted on a cheap Webhosting solution and there are other cool options, like:

- [GitHub Pages](https://pages.github.com/)
- [GitLab Pages](https://about.gitlab.com/stages-devops-lifecycle/pages/)
- [Amazon S3](https://aws.amazon.com/s3/)
- [Azure Storage](https://azure.microsoft.com/)
- [Google Cloud Storage](https://cloud.google.com/storage/)
- [Netlify](https://www.netlify.com/)
- [Firebase](https://firebase.google.com/docs/hosting)
<!--more-->

# Hosting

I choose [GitHub Pages](https://pages.github.com/) because it is

- Free
- Easy to use
- I'm using GitHub to manage the source and I can serve the site from the same repo
- Supports automation via [GitHub Actions](https://github.com/features/actions)
- Supports [custom domains with HTTPS](https://github.blog/2018-05-01-github-pages-custom-domains-https/) using [Let's Encrypt](https://letsencrypt.org/)
- Places the site behind a [CDN](https://en.wikipedia.org/wiki/Content_delivery_network) which has [DoS](https://en.wikipedia.org/wiki/Denial-of-service_attack) protection

If you haven't heard about CDN, CloudFlare has a good and not too long [article](https://www.cloudflare.com/learning/cdn/what-is-a-cdn/) about it.

# Putting it together

There are two things you need to set-up:
- `CNAME` file (GitHub creates it for you) 
- A few DNS records

Check out the documentation for the details:
- [Managing a custom domain for your GitHub Pages site](https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site)
- [Securing your GitHub Pages site with HTTPS](https://help.github.com/en/github/working-with-github-pages/securing-your-github-pages-site-with-https)

GitHub can also create a certificate using [Let's Encrypt](https://letsencrypt.org/).

# A few things to check after your site is up

- Valid cert
- [`sitemap.xml`](/sitemap.xml) (see [sitemaps.org](https://www.sitemaps.org/))
- [`robots.txt`](/robots.txt) (see [robotstxt.org](https://www.robotstxt.org/))
- RSS: [`index.xml`](/index.xml) (see [wiki](https://en.wikipedia.org/wiki/RSS))
- Google Analytics?
- Disqus?
- favicon

# Posts in this series

- [Intro](/posts/how-to-build-a-blog-intro/)
- [Content](/posts/how-to-build-a-blog-content/)
- [Deploy](/posts/how-to-build-a-blog-deploy/)
