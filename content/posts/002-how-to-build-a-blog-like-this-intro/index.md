---
title: "How to Build a Blog Like This: Intro"
lead: ""
description: "How to Build a Hugo Blog introduction"
slug: "how-to-build-a-blog-intro"

date: 2020-05-18T20:52:42-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["hugo", "blog", "make", "editorconfig", "howto", "jam-stack", "git", "github", "github-pages"]
---

The whole thing started with: *"I think I want to create a blog"*. I had a few ones before, those were either all-in-one hosted solutions or self-installed [WordPress](https://wordpress.org/) sites. WordPress was a tempting pick this time (as always) but I've played a little with [Jekyll](https://jekyllrb.com/) and [Hugo](https://gohugo.io/) recently and I liked them. So I negligently threw the red button with the text *"Deploy WordPress"* back to the shelf and I brought up a little toolbox that has the text [JAM Stack](https://jamstack.org/) on it from my shed (not [*bikeshed*](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/mailing-list-faq/bikeshed.html)), also I liked the idea of hosting the blog on [GitHub Pages](https://pages.github.com/).
<!--more-->

# What is the JAM Stack?

The [JAM Stack](https://jamstack.org/) stands for **J**avaScript **A**PIs, and **M**arkup or a slightly longer definition:

>Fast and secure sites and apps delivered by pre-rendering files and serving them directly from a CDN, removing the requirement to manage or run web servers.

Or in plain English: *generate a static site using [markdown](https://daringfireball.net/projects/markdown/)* (or other markups). Yepp, the whole thing is static (HTML+CSS+JS), no PHP, no server-side JS, you just need something that can host static files. And a Static Site Generator. :)

It has a couple of [advantages](https://jamstack.org/) ([maybe these too](https://jamstack.org/best-practices/)), I wanted to build this blog using it because:

- It's simple
- It's fun
- I can keep the *"code"* in `git`
- I can host it on [GitHub Pages](https://pages.github.com/)

# The Static Site Generator

Maybe this is the hardest part, you need to pick a [Static Site Generator](https://www.staticgen.com/) which is a bigger challenge than it sounds, just follow the link and see. :)
Right now the most popular Static Site Generators are:
- [Gatsby](https://www.gatsbyjs.org/) (JavaScript + React)
- [Hexo](https://hexo.io/) (JavaScript + various templates)
- [Hugo](https://gohugo.io/) (Go)
- [Jekyll](https://jekyllrb.com/) (Ruby + Liquid)
- [Next.js](https://nextjs.org/) (JavaScript + React)
- [Nuxt](https://nuxtjs.org/) (JavaScript + Vue)

The first really popular player in this league was [Jekyll](https://jekyllrb.com/). [GitHub Pages](https://pages.github.com/) supports it out-of-the-box which means that you don't need to generate the site and push it, GH will do it for you which makes [Jekyll](https://jekyllrb.com/) a pretty good go-to choice. Also, its community is big and you will find a lot of help online.
On the other hand, it's is not very fast, and managing Ruby dependencies is something I don't want to deal with.

I picked [Hugo](https://gohugo.io/) because it is blazing fast, very simple, also seemed fun. :)

# Getting Started

[Hugo](https://gohugo.io/) has great documentation, just check it's [Quick Start](https://gohugo.io/getting-started/quick-start/) guide and nothing will save you from having a static site in a few minutes from ground zero.
Adding themes as git submodules is a pretty convenient way to download and update them later.

Right after I generated the site, I created an [`.editorconfig`](https://github.com/jonatan-ivanov/develotters-blog/blob/85a55fae2d24a9b7819fe2829c8eb3d395c9af49/.editorconfig) file because ([EditorConfig](https://editorconfig.org/) is awesome) I like to keep things tidy even if they are just a few config files and some [markdown](https://daringfireball.net/projects/markdown/). Also, I immediately added a [`Makefile`](https://github.com/jonatan-ivanov/develotters-blog/blob/5cb856df20cea406008be8e68fa955dd0f246ba9/Makefile) so that I can automate a few things and have a simple *"build system"* (check out [GNU Make](https://www.gnu.org/software/make/)).

## EditorConfig

Other than setting the basics, there are two important parts in my [`.editorconfig`](https://github.com/jonatan-ivanov/develotters-blog/blob/85a55fae2d24a9b7819fe2829c8eb3d395c9af49/.editorconfig) file:

`Makefile` is indented with `tab`:
```
[Makefile]
indent_style = tab
```

while two spaces at the end of the line means a line break in *Markdown*:
```
[*.md]
trim_trailing_whitespace = false
```

## Makefile

I wrote a few [targets](https://github.com/jonatan-ivanov/develotters-blog/blob/5cb856df20cea406008be8e68fa955dd0f246ba9/Makefile) so that I can:

- Start the dev server: `make server`
- Produce the static files: `make build`
- Clean the build output: `make clean`
- Clean and build: `make all` or just `make`
- Update the theme: `make update`
- Deploy the site: `make deploy`

After these, nothing prevents you to work on your site efficiently, in the next post I'm going to explain how to proceed.

# Posts in this series

- [Intro](/posts/how-to-build-a-blog-intro/)
- [Content](/posts/how-to-build-a-blog-content/)
- [Deploy](/posts/how-to-build-a-blog-deploy/)
