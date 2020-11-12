Various Dot-Configuration Files
===============================

This repository is meant to be used using git bare, as described here:
https://www.atlassian.com/git/tutorials/dotfiles

To install, clone anywhere and copy the ``.git`` to ``~/.config/dotfiles``:

.. code:: bash

   git clone --bare https://github.com/jonathf/dotfiles ~/.config/dotfiles

Interaction with the git repository folder requires extra flags, so to start
configuring, start by add a temporary alias for your session:

.. code:: bash

   alias git="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"

With it in place, check which files are in conflict with:

.. code:: bash

   git status

Delete or move the files that are in the way. Then do the following to copy
files from the git folder to your home:

.. code:: bash

   git checkout ~

If using ``bash`` or ``fish``, the ``git`` command will now get a permanent
function wrapper such that it works with dot files, but will be smart enough to
turn it off when you are in a git folder.

Optional installs
-----------------

On Arch::

   sudo pacman -Syyu neovim git-lfs alacritty
   sudo pacman -Syu chromium firefox firefox-ublock-origin firefox-dark-reader \
            firefox-i18n-nb-no firefox-i18n-en-us firefox-tree-style-tab firefox-umatrix
   sudo pacman -Syyu yay
   sudo yay -Syu starship delta-bin

On Termux::

   pkg install git openssh starship exa python ripgrep


Overview
--------

* Awesome WM: ``~/.config/awesome/README.rst``
* FiSH: ``~/.config/fish/README.rst``
* GnuPG/Pass: ``~/.gnupg/README.rst``
* Neovim: ``~/.config/nvim/README.rst``

Python install
~~~~~~~~~~~~~~

::
   sudo pacman -Syu python-pip python-pipx
   pipx install poetry pipenv
   git clone git@github.com:pyenv/pyenv ~/.pyenv
