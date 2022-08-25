My personal configuration files
===============================

This repository is meant to be used using git bare, as described in the
`Atlassian tutorials <https://www.atlassian.com/git/tutorials/dotfiles>`_.
I personally use `YADM <https://yadm.io/#>`_, but the either works.

Start by copying over Github SSH keys to the new system, and clone the repo:

  yadm clone git@github.com:jonathf/dotfiles

Kickstart the bootstrap script when prompted to install accompanied software
dependencies.

Sub-categories
--------------

Some topics requires extra installs and/or configuration.
These topics are covered here:

* Awesome WM: `.config/awesome <../.config/awesome/>`_
* FiSH: `.config/fish <../.config/fish/>`_
* GnuPG/Pass: `.gnupg <../.gnupg/>`_
* Neovim: `.config/neovim <../.config/nvim/>`_
* Systemd: `.config/systemd <../.config/systemd>`_
