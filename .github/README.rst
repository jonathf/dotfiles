My personal configuration files
===============================

This repository is meant to be used using git bare, as described here:
https://www.atlassian.com/git/tutorials/dotfiles

To install, clone anywhere and copy the ``.git`` to ``~/.config/dotfiles``:

.. code:: bash

   git clone --bare https://github.com/jonathf/dotfiles ~/.config/dotfiles

Interaction with the git repository folder requires extra flags, so to start
configuring, start by add a temporary alias for your session:

.. code:: bash

   alias config="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"

With it in place, check which files are in conflict with:

.. code:: bash

   config status

Delete or move the files that are in the way. Then do the following to copy
files from the git folder to your home:

.. code:: bash

   config reset --hard master

The script ``config`` should now be present in ``~/.local/bin`` making it
persistently available.

Lastly, remove untracked file locally to make the interface more bareable::

   config config --local status.showUntrackedFiles no

Sub-categories
--------------

Some topics requires extra installs and/or configuration.
These topics are covered here:

* Awesome WM: `.config/awesome <../.config/awesome/>`_
* FiSH: `.config/fish <../.config/fish/>`_
* GnuPG/Pass: `.gnupg <../.gnupg/README.rst>`_
* Neovim: `.config/neovim <../.config/nvim/>`_
* Systemd: `.config/systemd <../.config/systemd>`_
