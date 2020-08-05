Neomutt
=======

The go-to guide for configuring Mutt is in the
`Arch Wiki <https://wiki.archlinux.org/index.php/Mutt>`_

the main configuration is placed in the file ``~/.config/neomutt/neomuttrc``.

However, the mail agent uses a lot of components, these include:

* `notmuch <https://wiki.archlinux.org/index.php/Notmuch>`_ -- ``~/.notmuch-config``
* `isync <https://wiki.archlinux.org/index.php/isync>`_ -- ``~/.config/neomutt/mbsyncrc``
* `msmtp <https://wiki.archlinux.org/index.php/Msmtp>`_ -- ``~/.msmtprc``
* ``mailcap`` -- ``

Installation
------------

On Arch-based distributions, you will need few components::

    sudo pacman -Syyu neomutt msmtp isync notmuch notmuch-mutt pass
    pip install goobook

Google configuration
--------------------

Please see
`configuration page <https://developers.google.com/gmail/imap/imap-smtp>`_ for
the Google specific options for setting up IMAP and SMTP.

Note that Google blocks direct IMAP/SMTP by default. So you need to enable
`less secure apps <https://myaccount.google.com/lesssecureapps>`_.

(Or perhaps two-factor authentication.)

Sending e-mails using MSMTP
---------------------------

`<https://wiki.archlinux.org/index.php/Msmtp>`_

Fetching and Indexing through NotMuch and ISync
-----------------------------------------------

Indexing mails can be done through the
`Notmuch plugin <https://wiki.archlinux.org/index.php/Notmuch>`_.

Syncing of IMAP folders is done using the ``mbsync`` executable which have its
configuration in the file ``~/.config/neomutt/mbsyncrc``.

To synchronize the mail periodically, for example set up a job using
``systemd``: `<https://wiki.archlinux.org/index.php/isync>`_

Extra Extensions
----------------

* ``w3m`` to view HTML content in the command line. (Hooks added to ``mailcap``.)
* ``urlview`` to extract links and mail-addresses to clipboard.
* ``goobook`` to allow for tab completion of Google contacts.
* ``notmuch-mutt`` interface to simplify creating of virtual folders.
* ``ripmime`` script for downloading all non-text attachments.

Note:
    `Google developer configuration <https://gitlab.com/goobook/goobook/-/issues/83>`_

PAM-GnuPG
---------

The mail-handler requires password to your mail account to operate. This can be
handled in multiple ways, but encrypting sensitive information like an e-mail
password seems like a good idea.

See ``~/.gnupg/README.rst`` for how to setup GnuPG and ``pass``.
