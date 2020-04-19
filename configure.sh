#!/bin/bash

CFG_ROOT=$(dirname $(readlink -f $0))

rm -rfv ~/.ipython
ln -sv $CFG_ROOT/ipython ~/.ipython

rm -rfv ~/.git_template
ln -sv $CFG_ROOT/git_template ~/.git_template

rm -rfv ~/.config/matplotlib
mkdir -p ~/.config/matplotlib
ln -svf $CFG_ROOT/matplotlibrc ~/.config/matplotlib/matplotlibrc

rm -v ~/.gitconfig
ln -svf $CFG_ROOT/gitconfig ~/.gitconfig

rm -v ~/.gitignore
ln -svf $CFG_ROOT/gitignore ~/.gitignore

rm -v ~/.Xresources
ln -svf $CFG_ROOT/Xresources ~/.Xresources

rm -rfv ~/.urxvt
ln -sv $CFG_ROOT/urxvt ~/.urxvt

rm -v ~/.config/user-dirs.dirs
ln -svf $CFG_ROOT/user-dirs.dirs ~/.config/user-dirs.dirs

mkdir -p ~/.local/bin
ln -svf $CFG_ROOT/git-blame-pr ~/.local/bin
ln -svf $CFG_ROOT/git-fancy-diff ~/.local/bin
