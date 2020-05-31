---
title: "Terminal Fun: Basic Utils"
lead: ""
description: "Terminal Fun: Basic Utils"

date: 2020-05-30T16:38:53-07:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["terminal", "cli", "linux", "mac os", "unix", "bash", "zsh", "bat", "cat", "exa", "ls", "multitail", "tail", "diff-so-fancy", "diff", "git", "prettyping", "ping", "htop", "top"]
---

This is the first post of a series where I want to give tips and trick for the Terminal/CLI, have fun:

- `bat` and `cat`
- `exa` and `ls`
- `multitail` and `tail`
- `diff-so-fancy` and `git diff`
- `prettyping` and `ping`
- `htop`/`gtop`/`vtop` and `top`
<!--more-->

# bat instead of cat

[`bat`](https://github.com/sharkdp/bat) is a `cat` replacement with some nice features:

- Syntax highlighting (the language can be specified)
- Git integration (shows additions, deletions, modifications)
- Automatic paging (can pipe its own output to less)
- File concatenation (in a non-interactive terminal, bat acts as a drop-in replacement for cat)
- Line numbering
- Ability to show non-printable characters like space, tab or newline
- Line highlighting (highlight the specified line ranges with a different background color)
- Text wrapping
- Themes

If you want to use the original cat command: `command cat whatever.txt`  
Check out the [readme](https://github.com/sharkdp/bat) and the man page, you can install it via `homebrew`.

**Setup tip:**  
{{< highlight shell >}}
export BAT_STYLE='full'
alias cat='bat'
{{< /highlight >}}

# exa instead of ls

[`exa`](https://github.com/ogham/exa) is a replacement for ls with:

- Colored output
- Git status
- Tree view

If you want to use the original ls command: `command ls`  
Check out the [readme](https://github.com/ogham/exa), the man page and the [official website](https://the.exa.website/), you can install it via `homebrew`.

**Setup tip:**  
{{< highlight shell >}}
alias la='ls -alh --git'
alias ls='exa'
{{< /highlight >}}

# MultiTail

[MultiTail](https://vanheusden.com/multitail/) is like tail but it allows you to print multiple files in multiple windows (with ncurses). It can colorize, filter and merge, check out the [list of features](https://vanheusden.com/multitail/features.php), you can install it via `homebrew`.


# diff-so-fancy

[diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) makes git diffs human readable.

{{< tweet 1263079575002796039 >}}

**Setup tip (`.gitconfig`):**  
{{< highlight shell >}}
[pager]
    diff = diff-so-fancy | less --tabs=4 -RFX
    show = diff-so-fancy | less --tabs=4 -RFX
{{< /highlight >}}

Check out the [readme](https://github.com/so-fancy/diff-so-fancy), and the [pro tips](https://github.com/so-fancy/diff-so-fancy/blob/master/pro-tips.md), you can install it via `homebrew`.

# prettyping instead of ping

[prettyping](https://github.com/denilsonsa/prettyping) wraps ping and makes its output prettier: colorful, compact, easier to read and it shows live stats nicely.

{{< youtube ziEMY1BcikM >}}
<br>

**Setup tip:**  
{{< highlight shell >}}
alias ping='prettyping'
{{< /highlight >}}

Check out the [readme](https://github.com/denilsonsa/prettyping) and the [official page](https://denilson.sa.nom.br/prettyping/), you can install it via `homebrew`.

# htop instead of top

Hope you know [htop](https://hisham.hm/htop/), it's an interactive process viewer, you can install it via `homebrew`.

**Setup tip:**  
{{< highlight shell >}}
alias top='sudo htop'
{{< /highlight >}}

Have you heard about [gtop](https://www.npmjs.com/package/gtop) or [vtop](https://www.npmjs.com/package/vtop)?

{{< figure src="https://raw.githubusercontent.com/aksakalli/gtop/master/img/demo.gif" title="gtop" >}}

{{< figure src="https://raw.githubusercontent.com/MrRio/vtop/master/docs/example.gif" title="vtop" >}}