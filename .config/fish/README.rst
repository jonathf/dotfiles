Fish Configuration
==================

Personal configuration for Fish (Friendly interactive shell).

Installation
------------

To install, follow the steps:

2. If Fish isn't already installed, install it:

   On Arch Linux:

   .. code:: bash

       sudo pacman --sync --refresh --noconfirm fish

   On Ubuntu Linux:

   .. code:: bash

      sudo apt-add-repository ppa:fish-shell/release-3
      sudo apt-get update
      sudo apt-get install fish

3. Verify that the Fish version is at least version 3.1:

   .. code:: bash

      fish --version

4. Change the default shell to Fish. In case Fish is installed
   globally, this can be done using the command:

   .. code:: bash

       chsh --shell /usr/bin/fish

   If installed locally, run the following command instead:

   .. code:: bash

       chsh --shell $HOME/.local/bin/fish

Optional Installs
-----------------

::

    sudo pacman -Syu git exa ripgrep yay neovim python-pip python-pipx
    yay -Syu direnv starship delta-bin
    git clone git@github.com:pyenv/pyenv .pyenv
    pipx install poetry pipenv
