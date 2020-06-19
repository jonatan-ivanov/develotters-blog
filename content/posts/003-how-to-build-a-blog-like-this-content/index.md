---
title: "How to Build a Blog Like This: Content"
lead: ""
description: "How to Build a Hugo Blog Content"
slug: "how-to-build-a-blog-content"

date: 2020-05-20T20:03:16-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["hugo", "blog", "howto", "jam-stack", "archetype", "taxonomy", "front-matter", "permalink"]
---

This is the second post of a series, you might want to check the first article ([Intro](/posts/how-to-build-a-blog-intro/)) before reading this.

Hugo is very flexible in terms of configuration and organizing the content, you have a lot of options and you can do things in various ways. This might sound great but if you ask me, I rather like opinionated things where I don't need to put a bunch of effort in figuring out best practices but the framework gives those to me (Convention over Configuration™). Unfortunately, this is not the case for Hugo.
<!--more-->

# Directory Structure

Hugo has a convention for its high-level directory structure, I highly recommend reading the [documentation](https://gohugo.io/getting-started/directory-structure/) about it and get familiar with most of them:

- archetypes
- config
- content
- data
- layouts
- static
- themes

# Archetypes

Archetypes are *"content templates"*. When you create a new content file using `hugo new`, Hugo tries to find an archetype for your content in the `archetypes` folder, e.g.:

- `hugo new posts/first.md` -> *"posts"* archetype (`archetypes/posts.md`)
- `hugo new articles/first.md` -> *"articles"* archetype (`archetypes/articles.md`)
- `archetypes/default.md` is the fallback

This is very handy if you want to create multiple types of content but even if you have just the default archetype, it saves time and produces consistent content across documents.

I highly recommend to check out the [documentation](https://gohugo.io/content-management/archetypes/), also feel free to check out my [archetypes](https://github.com/jonatan-ivanov/develotters-blog/tree/2bb357105a9d8d667df5f5f210f3d31c9d538691/archetypes).

**WARNING:**
>The posts archetype generates invalid content because of the categories (I always keep one and delete the rest).

# Config

The config files can be TOML, YAML or JSON placed as `config.toml`, `config.yaml`, or `config.json` in the root folder but you can also use the config folder which gives you better structure and control. This means that different config objects can be placed in different files (e.g.: `menus.toml`, `params.toml`), also you can have environment-specific configuration (e.g.: `development`, `production`).

>Default environments are development with `hugo serve` and production with `hugo`.

**WARNING:**
>The *Ananke* theme, which is used by the Quick Start guide, needs `env = "production"` to generate the `robots.txt` file correctly. To do this correctly, you need to use the `config` folder and hade different config for `development` and `production` environments.

I highly recommend to check out the [documentation](https://gohugo.io/getting-started/configuration/), also feel free to check out [my config](https://github.com/jonatan-ivanov/develotters-blog/tree/234310ca7029ab0445fcb3f9c06fe040a8f165bd/config).

# Content

This is where things can go wild. Since Hugo assumes that the structure that is used to organize the source files is used to organize the rendered site, you can almost do anything you want and I don't know any official best practice here but the documentation gives you some pointers and revels the possibilities:

- [Content Organization](https://gohugo.io/content-management/organization/)
- [Page Bundles](https://gohugo.io/content-management/page-bundles/)
- [Front Matter](https://gohugo.io/content-management/front-matter/)
- [Taxonomies](https://gohugo.io/content-management/taxonomies/)
- [URL Management](https://gohugo.io/content-management/urls/)

This is very important: read these pages of the documentation and try to understand the concepts as well as your possibilities, this is the key to organize your content.

What I'm doing (and why):
- I have a page bundle for the "normal" posts and another one for (hopefully) weekly news ("clamshell")
- I put every "normal" post into its folder which is prefixed by the number of the post  
(e.g.: `001-hello-world`)
- I put every "clamshell" post into its folder which contains only the date  
(e.g.: `2020-05-20`)
- I put every page (e.g.: About) into its section
- This way I can do a few things:
  - "normal" and "clamshell" posts are organized differently, they are ordered and separated
  - Since every post is in its folder, I can put other resources next to the post (e.g.: images)
  - I have different archetypes with different defaults for them
  - I have different permalinks and organizer pages [`/posts/`](/posts/) and [`/clamshell/`](/clamshell/)
  - Pages are separated and I can put resources into the page folders

# Posts in this series

- [Intro](/posts/how-to-build-a-blog-intro/)
- [Content](/posts/how-to-build-a-blog-content/)
- [Deploy](/posts/how-to-build-a-blog-deploy/)
