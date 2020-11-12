Awesome WM Configuration
========================

Personal configuration for Awesome WM (Window Manager).

Installation
------------

To install, follow the steps:

1. Install dependencies. In Arch Linux, this would be:

   .. code:: bash

       sudo pacman --sync --refresh --noconfirm awesome vicious lain picom  \
           pa-applet network-manager-applet scrot blueman ttf-anonymous-pro \
           xfce4-power-manager xorg-xbacklight rofi-scripts

2. (Optional) Add LightDM and Slick-greeter. On Arch Linux:

   .. code:: bash

       sudo pacman --sync --refresh --noconfirm lightdm-slick-greeter
       sudo cp ~/.config/awesome/{background.png,slick-greeter.conf} /etc/lightdm
       sudo chmod 644 /etc/lightdm/{background.png,slick-greeter.conf}

3. (Optional) Install theme and theme configuration. On Arch Linux this means
   running the code:

   .. code:: bash

       sudo pacman --sync --refresh --noconfirm lxappearance materia-gtk-theme

   Set theme by running the ``lxappearance`` and select the theme
   ``Materia-dark-compact`` from the GUI.

   Note: for cursor theme, edit `~/.icons/default/index.theme` and
   `~/.config/gtk-3.0/settings.ini`, for the change to also show up in
   applications run as root, copy the 2 files over to their respective place in
   `/root`:

   .. code:: bash

       sudo mkdir -p /root/.icons/default /root/.config/gtk-3.0
       sudo cp ~/.icons/default/index.theme /root/.icons/default/
       sudo cp ~/.config/gtk-3.0/settings.ini /root/.config/gtk-3.0/
