Neovim Configuration
====================

Personal configuration for Neovim.

To install, follow the steps:

1. Install Neovim and dependencies. On Arch Linux, this includes:

   .. code:: bash

       sudo pacman -Syyu --noconfirm neovim ctags xsel

   If installation is an issue, Neovim can be installed as an universal Linux
   AppImage:

   .. code:: bash

       curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
       chmod u+x nvim.appimage
       mv nvim.appimage ~/.local/bin/nvim

2. Use the python remote server, install a python virtual
   environment with a python instance version 3.6.1+:

   .. code:: bash

       pip install -U pip pynvim jedi neovim-remote

3. Install plugging using `Vim-Plug <https://github.com/junegunn/vim-plug>`_
   from inside neovim:

   .. code:: vim

      :PlugInstall
      :UpdateRemotePlugins
