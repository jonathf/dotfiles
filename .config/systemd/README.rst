``systemd`` configuration
=========================

This folder contains user services for systemd to use. Each service can be
enabled/disabled/started/stopped using ``systemctl --user``.

Services
--------

To have services run independent of your login, the following command must be
run to allow that::

  loginctl enable-linger

Suspend, hibernate and lock screen
----------------------------------

Before configuring hibernation, first create and enable a ``/swapfile`` big enough
for memory.
This can be done automatically using `hibernator <https://github.com/Chrysostomus/hibernator>`_.
For example creating a 16 gigabyte swap file::

    sudo pacman -Syu hibernator
    hibernator 16G

Take a look at ``/etc/default/grub:GRUB_CMDLINE_LINUX_DEFAULT`` to ensure it
makes sense before rebooting.

To see and edit the system action when e.g. lid close, open the file
``/etc/systemd/logind.conf``.
For example edit relevant line so that you have::

    HandleLidSwitch=suspend-then-hibernate

will ensure that closing the lid on battery will trigger suspend first, and
hibernation after a while.

Finally, the file ``user/lock.service`` can be used to trigger code on
re-entry, typically lock-screen and screen refresh in ``awesome``.
This service needs to be used as system level process to work::

    sudo cp ~/.config/systemd/user/lock.service /etc/systemd/system/lock.service
    systemctl enable lock.service
