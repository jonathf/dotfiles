#!/bin/bash

CFG_ROOT=$(dirname $(readlink -f $0))

# Git

[[ -d ~/.git_template ]] && rm -rfv ~/.git_template
ln -sv $CFG_ROOT/git_template ~/.git_template

[[ -f ~/.gitconfig ]] && rm -v ~/.gitconfig
ln -svf $CFG_ROOT/gitconfig ~/.gitconfig

[[ -f ~/.gitignore ]] && rm -v ~/.gitignore
ln -svf $CFG_ROOT/gitignore ~/.gitignore

[[ ! -d ~/.local/bin ]] && mkdir -vp ~/.local/bin
ln -svf $CFG_ROOT/git-blame-pr ~/.local/bin
ln -svf $CFG_ROOT/git-fancy-diff ~/.local/bin

# Python
[[ -d ~/.ipython ]] && rm -rfv ~/.ipython
ln -sv $CFG_ROOT/ipython ~/.ipython

[[ ! -d ~/.config/matplotlib ]] && mkdir -vp ~/.config/matplotlib
ln -svf $CFG_ROOT/matplotlibrc ~/.config/matplotlib/matplotlibrc

# Terminal emulator
[[ -f ~/.Xresources ]] && rm -v ~/.Xresources
ln -svf $CFG_ROOT/Xresources ~/.Xresources

[[ -d ~/.urxvt ]] && rm -rfv ~/.urxvt
ln -sv $CFG_ROOT/urxvt ~/.urxvt

[[ -f ~/.config/user-dirs.dirs ]] && rm -v ~/.config/user-dirs.dirs
ln -svf $CFG_ROOT/user-dirs.dirs ~/.config/user-dirs.dirs
