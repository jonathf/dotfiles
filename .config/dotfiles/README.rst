Various Dot-Configuration Files
===============================

This repository is meant to be used using git bare, as described here:
https://www.atlassian.com/git/tutorials/dotfiles

To install, clone anywhere and copy the ``.git`` to ``~/.config/dotfiles``:

.. code:: bash

   clone https://github.com/jonathf/dotfiles ~/dotfiles
   mv ~/dotfiles/.git ~/.config/dotfiles
   rm -rf ~/dotfiles

Interaction with the git repository folder requires extra flags, so to start
configuring, start by add a temporary alias for your session:

.. code:: bash

   alias .git="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"

With it in place, check which files are in conflict with:

.. code:: bash

   .git status

Delete or move the files that are in the way. Then do the following to copy
files from the git folder to your home:

.. code:: bash

   .git checkout ~

If using ``bash``, the ``.git`` command should now be available permanently
through ``.bash_aliases``.

To get a more sane ``.git`` behavior, you can also add the following two
configurations values:

.. code:: bash

   .git config --local advice.addIgnoredFiles false
   .git config --local status.showUntrackedFiles no
