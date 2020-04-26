#!/bin/bash

CFG_ROOT=$(dirname $(readlink -f $0))

# Git
if [[ ! -h ~/.git_template ]]; then
  [[ -d ~/.git_template ]] && rm -rfv ~/.git_template
  ln -sv $CFG_ROOT/git/git_template ~/.git_template
fi

if [[ ! -h ~/.gitconfig ]]; then
  [[ -f ~/.gitconfig ]] && rm -v ~/.gitconfig
  ln -svf $CFG_ROOT/git/gitconfig ~/.gitconfig
fi

if [[ ! -h ~/.gitignore ]]; then
  [[ -f ~/.gitignore ]] && rm -v ~/.gitignore
  ln -svf $CFG_ROOT/git/gitignore ~/.gitignore
fi

[[ ! -d ~/.local/bin ]] && mkdir -vp ~/.local/bin
[[ ! -f ~/.local/bin/git-blame-pr ]] && ln -svf $CFG_ROOT/git/git-blame-pr ~/.local/bin
[[ ! -f ~/.local/bin/git-fancy-diff ]] && ln -svf $CFG_ROOT/git/git-fancy-diff ~/.local/bin

if [[ ! -h ~/.ipython ]]; then
  [[ -d ~/.ipython ]] && rm -rfv ~/.ipython
  ln -sv $CFG_ROOT/ipython ~/.ipython
fi

if [[ ! -h ~/.config/matplotlib ]]; then
  [[ -d ~/.config/matplotlib ]] && rm -rfv ~/.config/matplotlib
  ln -sv $CFG_ROOT/matplotlib ~/.config/matplotlib
fi

if [[ ! -h ~/.Xresources ]]; then
  [[ -f ~/.Xresources ]] && rm -v ~/.Xresources
  ln -svf $CFG_ROOT/Xresources ~/.Xresources
fi

if [[ ! -h ~/.urxvt ]]; then
  [[ -d ~/.urxvt ]] && rm -rfv ~/.urxvt
  ln -sv $CFG_ROOT/urxvt ~/.urxvt
fi

if [[ ! -h ~/.config/alacritty ]]; then
  [[ -d ~/.config/alacritty ]] && rm -rfv ~/.config/alacritty
  ln -sv $CFG_ROOT/alacritty ~/.config/alacritty
fi

if [[ ! -h ~/.config/user-dirs.dirs ]]; then
  [[ -f ~/.config/user-dirs.dirs ]] && rm -v ~/.config/user-dirs.dirs
  ln -svf $CFG_ROOT/user-dirs.dirs ~/.config/user-dirs.dirs
fi

if [[ ! -h ~/.config/tridactyl ]]; then
  [[ -d ~/.config/tridactyl ]] && rm -rfv ~/.config/tridactyl
  ln -sv $CFG_ROOT/tridactyl ~/.config/tridactyl
fi

if [[ ! -h ~/.config/rofi ]]; then
  [[ -d ~/.config/rofi ]] && rm -rfv ~/.config/rofi
  ln -sv $CFG_ROOT/rofi ~/.config/rofi
fi

if [[ ! -h ~/.config/zathura ]]; then
  [[ -d ~/.config/zathura ]] && rm -rfv ~/.config/zathura
  ln -sv $CFG_ROOT/zathura ~/.config/zathura
fi

if [[ ! -h ~/.bashrc ]]; then
  [[ -f ~/.bashrc ]] && rm -v ~/.bashrc
  ln -svf $CFG_ROOT/bash/bashrc ~/.bashrc
fi
if [[ ! -h ~/.bash_aliases ]]; then
  [[ -f ~/.bash_aliases ]] && rm -v ~/.bash_aliases
  ln -svf $CFG_ROOT/bash/bash_aliases ~/.bash_aliases
fi
if [[ ! -h ~/.bash_prompt ]]; then
  [[ -f ~/.bash_prompt ]] && rm -v ~/.bash_prompt
  ln -svf $CFG_ROOT/bash/bash_prompt ~/.bash_prompt
fi
