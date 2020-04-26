Various Dot-Configuration Files
===============================

Personal configurations for the following programs:

* Git
* IPython
* Matplotlib
* URxvt/Alacritty

Installation
------------

Note that installation is done by deleting the old configurations, then create
new symbolic link to various files and folders.
If there are something important you want to keep there, save the
relevant configurations first.

To install, follow the steps:

1. Clone the repository to your system. It doesn't matter where, though it is
   expected that the folder is not removed, so perhaps:

   .. code:: bash

       git clone https://github.com/jonathf/dotfiles ~/.config/dotfiles

2. Run the configuration script:

    .. code:: bash

       bash ~/.config/configure.sh

3. (Optional) Install ``direnv`` for some extra features.

   On Arch Linux:

   .. code:: bash

       fish -c "aurbuild direnv/direnv-archlinux"

   On Ubuntu Linux:

   .. code:: bash

       sudo apt install direnv

   On systems without root access, run the following command instead:

   .. code:: bash

       bash ~/.config/fish/direnv_install.sh

4. (Optional) Install ``pyenv`` by cloning the repository:

   .. code:: bash

       git clone https://github.com/pyenv/pyenv ~/.pyenv

Features
--------

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
