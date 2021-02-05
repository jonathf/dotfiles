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
      sudo apt update
      sudo apt install fish

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

On Arch::

    sudo pacman -Syu git exa ripgrep yay neovim python-pip python-pipx
    yay -Syu direnv starship
    git clone git@github.com:pyenv/pyenv .pyenv
    pipx install pipenv
    pipx install poetry
    pipx install pdm

On Debian/Ubuntu::

    sudo apt install direnv git ripgrep python3-pip python3-virtualenv
    git clone git@github.com:pyenv/pyenv .pyenv
    pip3 install pipx
    pipx install poetry
    pipx install pipenv
    pipx install pdm
