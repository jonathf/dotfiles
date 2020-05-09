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

Features
--------

Personal configurations for the following programs:

``git diff``
    An updated fancy ``git diff`` with nice colors and stuff.
``git edit``
    Use your default ``$EDITOR`` to edit all "dirty" files in your
    repository. This can be used both to "resume" editing where you left off,
    and to go straight to conflict files during merge/rebase.
``git gblame``/``git gcheckout``/``git gmerge``
    Same as ``git {blame,checkout,merge}``, but uses Github pull-request as reference.
``git git git``
    Multiple repeating git is interpreted as one.
``git ll``
    Git log with single line commits, graph tree and pretty colors.
``git prune``
    Remove all branches flagged as merged that (usually) only exist as
    artifacts after completed pull-requests.
``<alt-z>``
    Detach from the prompt using the ``urxvt`` extension
    ``vim-scrollback``. great for scrolling backwards in a (bastardized)
    vi-mode, and select content from what is visually present on the
    screen. Great for getting server content over to the clipboard.
``<ctrl--><ctrl-+><ctrl-0>``
    Zooming out, in and back to default using the ``urxvt`` extension
    ``reactivity`` and natively in ``alactritty``.
