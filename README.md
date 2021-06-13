# Nordokai
A Vim/Neovim colorscheme based on the syntax highlighting from [Monokai Pro](https://monokai.pro/vscode) and the [Nord](https://www.nordtheme.com/) color palette.

# Table of contents
* [Introduction](#introduction)
* [Images](#images)
* [Features](#features)
* [Installation](#installation)

# Introduction
One of my favorites colorschemes for every text editor is the [nord colorscheme](https://www.nordtheme.com/ports) which is available on almost every platform.

However, I find some troubles trying to accept the lack of color variety, since it always uses the same bueish color tone.

My main text editor of choice is Neovim, and the Treesitter plugin is one of the greatest out there, featuring a very powerful syntax parser to get a very colorful syntax highlighting (if your colorscheme supports it).

The main problem is that the Nord team, at least for this time, is not planning to bring Treesitter support for the Vim/Neovim colorscheme, leaving the platform users with a very plain and, sometimes, kind of boring syntax highlighting.

Trying some new colorschemes for Vim/Neovim I found the [Sonokai project](https://github.com/sainnhe/sonokai), which is a Monokai Pro based colorscheme with Treesitter support and a very friendly syntax highlighting. However I found the used color palette very vivid, which is nice, but coming from a very opaque colorscheme like the Nord one ends being kind of disturbing.

This is when I came in the idea of creating my own colorscheme, with nice Treesitter support using as template the [Sonokai project](https://github.com/sainnhe/sonokai), and using my favourite color palette of choice from the [Nord project](https://www.nordtheme.com/).

# Images
Images coming soon!!

# Features
* Nord based colors
* Monokai Pro based syntax highlighting
* Transparent background (optional)
* Bold
* Treesitter support (optional - needs [Treesitter plugin](https://github.com/nvim-treesitter/nvim-treesitter) installed and configured with the appropiate parsers)

# Installation
Using [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'stonefeld/nordokai'
```
