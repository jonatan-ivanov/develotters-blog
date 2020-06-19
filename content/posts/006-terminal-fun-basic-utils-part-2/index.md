---
title: "Terminal Fun: Basic Utils Part 2"
lead: ""
description: "Terminal Fun: Basic Utils Part 2"

date: 2020-06-17T23:28:50-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["terminal", "cli", "linux", "mac os", "unix", "bash", "zsh", "fd", "ack", "broot", "peco", "nnn", "ranger", "vimv", "ncdu", "duc", "vi", "vim", "nvim", "neovim", "json", "jq", "fx"]
---

This is the second post of a series where I want to give some tips and tricks for the Terminal/CLI.  
In the [first post](/posts/terminal-fun-basic-utils/), I showed a few very handy tools like `bat`, `exa`, `multitail`, `diff-so-fancy`, `delta`, `prettyping` and `htop`/`gtop`/`vtop`.  
This post is going to be a little longer so buckle-up, put your helmet on, grab a ... frying pan and have fun.
<!--more-->

# What You Already Have

I think I should have started the [previous post](/posts/terminal-fun-basic-utils/) with these, there are pretty good guides about basic Unix tools, let me show you a couple I ran into recently: [Unix ToolBox](http://cb.vu/unixtoolbox.xhtml) is a collection of commands for advanced users, also available in a nice booklet form. Additionally, I like these tweets about the basics:

{{< tweet 1268091886826213377 >}}

{{< tweet 1270020178986893315 >}}

# Search Tools

## fd

`fd` is a simple and convenient alternative to `find` with some opinionated defaults, check out its [readme](https://github.com/sharkdp/fd).

![fd-demo](https://raw.githubusercontent.com/sharkdp/fd/6d83eea32bfe3b052ff20f5cc36f3aacf8067ce0/doc/screencast.svg)

## ack

`ack` is a code-searching tool, similar to grep but optimized for programmers searching large trees of source code. It is highly portable and runs on any platform that runs Perl. [Why should you use it?](https://beyondgrep.com/why-ack/) Check out the [official site](https://beyondgrep.com/) and the [readme](https://github.com/beyondgrep/ack3).

{{< youtube sKmyl5D8Da8 >}}
<br>

## broot

`broot` is a simple navigator for your files/directories with search capabilities, check out the [readme](https://github.com/Canop/broot) for more examples.

![broot-demo](https://raw.githubusercontent.com/Canop/broot/bbdec766bedcfd5bad614b720fc965487b0c32a2/img/20191112-mycnf.png)

## peco

`peco` is a simple interactive filtering tool, check out its [readme](https://github.com/peco/peco).

![peco-demo](https://camo.githubusercontent.com/1523226c8977248f270ab4c4feff9f943c283bd5/687474703a2f2f7065636f2e6769746875622e696f2f696d616765732f7065636f2d64656d6f2d66696c656e616d652e676966)

If you were missing FZF from this list, there will be a separate post for it. :)

# Files

You might be familiar with `mc` ([Midnight Commander](https://www.midnight-commander.org/)) but there is more.

## nnn

`nnn` is a terminal file manager; it's small, simple and offers great performance, check out the features in the [readme](https://github.com/jarun/nnn)

![nnn-demo](https://camo.githubusercontent.com/d7abd98b23e90b9b4c295e2b15b7150b53cdd5a0/68747470733a2f2f692e696d6775722e636f6d2f4d5057706d6f732e706e67)

{{< youtube U2n5aGqou9E >}}
<br>

## ranger

`ranger` is a terminal file manager with `vi` key bindings. It has a nice curses interface with a view on the directory hierarchy and it also supports multi-pane view mode, check out the [readme](https://github.com/ranger/ranger).


![ranger-demo](https://raw.githubusercontent.com/ranger/ranger-assets/2b94efd90d2fb668799daf0de087b9bb3e734942/screenshots/twopane.png)

{{< youtube L6Vu7WPkoJo >}}
<br>

## vimv

`vimv` is a terminal-based file rename utility that lets you easily mass-rename files using Vim, here's the [readme](https://github.com/thameera/vimv)

![vimv-demo](https://raw.githubusercontent.com/thameera/vimv/2baff801977807a2c8e9bc7100a37db0615bb479/screencast.gif)

## Ncdu

Ncdu stands for NCurses Disk Usage, it is a disk usage analyzer with an ncurses interface. It is designed to find space hogs.
Check out the official [Ncdu site](https://dev.yorhel.nl/ncdu) and also the [screenshots](https://dev.yorhel.nl/ncdu/scr).

**Pro Tip:** You can set-up coloring and exclusion patterns, check out the manual.  
`alias ncdu='ncdu --color dark -rr -x --exclude .git --exclude node_modules'`

[![ncdu-demo](https://asciinema.org/a/340665.svg)](https://asciinema.org/a/340665)

### Duc

You might also want to check [Duc](https://duc.zevv.nl/). It is a collection of tools for indexing, inspecting and visualizing disk usage. Duc maintains a database of accumulated sizes of directories of the file system, and allows you to query this database with some tools, or create fancy graphs showing you where your bytes are.

## neovim

`neovim` is Vim-based text editor which that seeks to aggressively refactor Vim source code to make it better and make it easier to maintain. Check out the [project page](https://neovim.io/).

If you want to use `nvim` when you type `vi` or `vim`:

{{< highlight shell >}}
alias vim='nvim'
alias vi='nvim'
{{< /highlight >}}

If you want to open the current directory in your favorite editor:

{{< highlight shell >}}
alias a='atom .'
alias c='code .'
alias v='vi .'
{{< /highlight >}}

If you want to use a GUI instead of a terminal editor:

{{< highlight shell >}}
export EDITOR='code --wait'
{{< /highlight >}}

# JSON

You might have already known [`jq`](https://stedolan.github.io/jq/) but I think it's worth to check [`fx`](https://github.com/antonmedv/fx) too.

![fx-demo](https://camo.githubusercontent.com/b5df8c57792e443a18a56cd9a292b1a101ba2391/68747470733a2f2f6d6564762e696f2f6173736574732f66782e676966)

# Posts in this series

- [Terminal Fun: Basic Utils](/posts/terminal-fun-basic-utils/)
- [Terminal Fun: Basic Utils Part 2](/posts/terminal-fun-basic-utils-part-2/)

Thanks for [Peter](https://github.com/gwelican), who let me know about some of these tools.
