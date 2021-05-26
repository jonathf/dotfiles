Awesome WM Configuration
========================

Personal configuration for Awesome WM (Window Manager).

Installation
------------

To install, follow the steps:

1. Install dependencies. In Arch Linux, this would be:

   .. code:: bash

       sudo pacman -Syu awesome vicious lain xcompmgr \
           network-manager-applet scrot blueman powerline-fonts \
           xfce4-power-manager xorg-xbacklight alacritty \
           ttf-ubuntu-font-family xtrlock
       yay -Syu dmenu-distrotube-git

On Ubuntu:

   .. code:: bash

       sudo add-apt-repository ppa:mmstick76/alacritty
       sudo apt update
       sudo apt install awesome awesome-extras scrot blueman \
           xfce4-power-manager xbacklight alacritty xcompmgr
       cd ~/.config/awesome
       git clone https://github.com/copycat-killer/lain


2. (Optional) Add LightDM and Slick-greeter. On Arch Linux:

   .. code:: bash

       sudo pacman --sync --refresh --noconfirm lightdm-slick-greeter
       sudo cp ~/.config/awesome/{background.jpg,slick-greeter.conf} /etc/lightdm
       sudo chmod 644 /etc/lightdm/{background.jpg,slick-greeter.conf}

On Ubuntu this is redundant

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

Mapping CapsLock to both Esc and Ctrl
-------------------------------------

See `interception <https://gitlab.com/interception/linux/tools>`_ for details.

.. code:: bash

   sudo pacman -Syu interception-dual-function-keys

Add the following to the file /etc/interception/udevmon.yaml:

.. code:: yaml

   - JOB: "intercept -g $DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys.yaml | uinput -d $DEVNODE"
     DEVICE:
       EVENTS:
         EV_KEY: [KEY_CAPSLOCK, KEY_ESC, KEY_RIGHTCTRL, KEY_INSERT]

Also create the file /etc/interception/dual-function-keys.yaml to define the mappings. E.g.

.. code:: yaml

   TIMING:
     TAP_MILISEC: 200
     DOUBLE_TAP_MILISEC: 150

   MAPPINGS:

   - KEY: KEY_CAPSLOCK
      TAP: KEY_ESC
      HOLD: KEY_RIGHTCTRL
      HOLD_START: BEFORE_CONSUME

   - KEY: KEY_RIGHTCTRL
      TAP: KEY_INSERT
      HOLD: KEY_RIGHTCTRL
      HOLD_START: BEFORE_CONSUME


Start the process with ``systemd``:

.. code:: bash

   sudo systemctl enable udevmon
   sudo systemctl start udevmon
