---
title: "Terminal Fun: Basic Utils Part 3"
lead: ""
description: "Terminal Fun: Basic Utils Part 3"

date: 2020-06-24T12:13:11-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["terminal", "cli", "linux", "mac os", "unix", "bash", "zsh", "httpie", "curl", "httpstat", "sslscan", "ssl", "tls", "mitmproxy", "mtr", "traceroute", "ping", "tldr", "navi", "up", "hhighlighter", "mainframer", "ssh", "rsync", "asciinema", "ascii"]
---

This is the third post of a series where I want to give some tips and tricks for the Terminal/CLI.  
You might want to check out the [first](/posts/terminal-fun-basic-utils/) and the [second](/posts/terminal-fun-basic-utils-part-2/) posts.
As previously, buckle-up, put your helmet on, grab a ... frying pan and have fun.
<!--more-->

# Network Tools

## httpie

`httpie` is a command-line HTTP client (like `curl` or `wget`) for the API era. It comes with JSON support, syntax highlighting, persistent sessions, wget-like downloads, plugins, and more. See the features on the [Official Site](https://httpie.org/) or the [readme](https://github.com/jakubroztocil/httpie).

![httpie-demo](https://raw.githubusercontent.com/jakubroztocil/httpie/b7c8bf08002b48b5c82df61f5aec09a556f91b74/httpie.gif)

## httpstat

`httpstat` visualizes `curl` statistics. It tells you where did your request spend time.

![httpstat-demo](https://raw.githubusercontent.com/reorx/httpstat/f95b2e9da3b2e8448541871dd173e50ea18600a0/screenshot.png)

## sslscan

`sslscan` is a test utility that tells you information about SSL/TLS enabled services and discovers supported cipher suites. Check the [readme](https://github.com/rbsec/sslscan).

[![sslscan-demo](https://asciinema.org/a/341018.svg)](https://asciinema.org/a/341018)

## mitmproxy

[`mitmproxy`](https://mitmproxy.org/) is your swiss-army knife for debugging, testing, privacy measurements, and penetration testing. It can be used to intercept, inspect, modify, and replay web traffic such as HTTP/1, HTTP/2, WebSockets, or any other SSL/TLS-protected protocols.

![mitmproxy-demo](https://raw.githubusercontent.com/mitmproxy/mitmproxy/982508d30f887b4fe8b2a855792ae1e33f378222/docs/src/static/screenshots/mitmproxy.png)

## mtr

[`mtr`](https://www.bitwizard.nl/mtr/) combines the functionality of the `traceroute` and `ping` programs in a single network diagnostic tool.

As `mtr` starts, it investigates the network connection between the host mtr runs on and a user-specified destination host. After it determines the address of each network hop between the machines, it sends a sequence ICMP ECHO requests to each one to determine the quality of the link to each machine. As it does this, it prints running statistics about each machine.

{{< youtube FaGIrOiwQNQ >}}
<br>

# Others

## tldr

[`tldr`](https://github.com/tldr-pages/tldr) shows you help pages:

![tldr-demo](https://raw.githubusercontent.com/tldr-pages/tldr/b7c5aefbf8d2886ccb5718e8483c72884b12ec75/images/screenshot.png)

## navi

[`navi`](https://github.com/denisidoro/navi) is like an  interactive cheatsheet:

![navi-demo](https://user-images.githubusercontent.com/3226564/76437136-ddc35900-6397-11ea-823c-d2da7615fe60.gif)

## up

[`up`](https://github.com/akavel/up) stands for Ultimate Plumber, it's a tool for writing Linux pipes interactively, with a live preview of command results.

It helps interactively and incrementally explore textual data by making it easier to quickly build complex pipelines, thanks to a fast feedback loop. This is achieved by boosting any typical text-processing utils such as grep, sort, cut, paste, awk, wc, perl, etc. by providing a quick, interactive, scrollable preview of their results.

![up-demo](https://raw.githubusercontent.com/akavel/up/0a2293dc0bf3012dc0566e9e8c58986f7372d95c/up.gif)
You can watch the same as an [asciicast](https://asciinema.org/a/208538).

## hhighlighter

(hhighlighter](https://github.com/paoloantinori/hhighlighter) (`h`) is a tiny utility to highlight multiple keywords with different colors, it's pretty nice for logs.

**Pro Tip**: `alias hl='h ERROR INFO WARN DEBUG'` (`hl` as highlight logs)  
and you can do: `cat logs/service.log | hl`

[![asciicast](https://asciinema.org/a/341034.svg)](https://asciinema.org/a/341034)

## mainframer

[`mainframer`](https://github.com/buildfoundation/mainframer) was created to allow you to move your build process from a local machine to a remote one. Since it is a nice combo of `ssh` + `rsync`, it supports anything you can execute as a command. It will sync files to a remote machine, execute a command, and sync files back.

I found it very handy for performance testing, where the test suite is on your local box which will be copied (`rsync`) to a remote machine, then the tests will be executed (`ssh`) and the report will be synced back (`rsync`). It's very simple solutions to run heavy operations on remote machines.

Please notice that `3.x` is a complete rewrite of the project and it is not ready yet, the current version that you can use is [`2.x`](https://github.com/buildfoundation/mainframer/tree/2.x).

[![mainframer-demo](https://asciinema.org/a/101327.svg)](https://asciinema.org/a/101327)

## asciinema

You might have noticed that some of your demos above were recorded in a seemingly weird but pretty nice way. With [`asciinema`](https://asciinema.org/) you can record and share your terminal sessions, the right way. :) You can forget screen recording apps and blurry videos. It's a lightweight, purely text-based approach to terminal recording.

[![asciicast](https://asciinema.org/a/335480.svg)](https://asciinema.org/a/335480)

# Posts in this series

- [Terminal Fun: Basic Utils Part 1](/posts/terminal-fun-basic-utils/)
- [Terminal Fun: Basic Utils Part 2](/posts/terminal-fun-basic-utils-part-2/)
- [Terminal Fun: Basic Utils Part 3](/posts/terminal-fun-basic-utils-part-3/)

Thanks to [Peter](https://github.com/gwelican), who let me know about some of these tools.
