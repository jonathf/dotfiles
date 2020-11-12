Fish Configuration
==================

Personal configuration for Fish (Friendly interactive shell).

Installation
------------

To install, follow the steps:

1. Clone the repository into the fish configuration folder:

   .. code:: bash

       git clone https://github.com/jonathf/fish ~/.config/fish

2. It is assumed that Fish is installed on the system.

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

    sudo pacman -Syu exa ripgrep yay neovim
    yay -Syu direnv

    git clone git@github.com:pyenv/pyenv .pyenv
