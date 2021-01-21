GnuPG Mini-Tutorials
====================

Here are some mini-recipes for maneuvering GnuPG.

Install
-------

To install on Arch::

    $ sudo pacman -Syyu pass

or on Debian::

    $ sudo apt install pass

(The executable ``gpg`` should be pre-installed on all major linux systems.)

Starting from scratch
---------------------

Generate private/public key pair::

    $ gpg --full-gen-key

Use the default answers through.

Public and private keys can be found at ``~/.gnupg/``.

Start up pass from scratch with::

    $ pass init jonathf@gmail.com

Replace e-mail address with address entered when generating the key at the
beginning.

Migrating to a New Machine
--------------------------

When migrating later, use the following two commands to export and import your
private key::

    $ gpg --export-secret-keys > private_keys.gpg
    $ gpg --import private_keys.gpg
    $ gpg -K  # read $KEY
    $ gpg --edit-key $KEY
    >   trust -> 5 (trust ultimately) -> quit

Remember to delete the file after migrating.

Also add the key to the pass store::

    $ mkdir -p ~/.password-store
    $ echo $KEY > ~/.password-store/.gpg-id

Generate Public Key
-------------------

It is also possible to generate public keys with::

    $ gpg --armor --export jonathf@gmail.com > public_key.asc

The public key is safe to distribute.

Signing of git commit messages
------------------------------

The content of the public key file can e.g. be used at `<https://github.com/>`_
to allow for signing of git commit messages. To do so, add to you global
``.gitconfig`` file. For example::

    $ gpg --list-keys
    /home/jonathf/.gnupg/pubring.kbx
    --------------------------------
    pub   rsa4096 2020-05-17 [SC]
        558C5F4DBB8597A140DA91C53673F898D24A40A7
    uid           [ultimate] Jonathan Feinberg <jonathf@gmail.com>
    sub   rsa4096 2020-05-17 [E]
    $ git config --global user.signingkey 558C5F4DBB8597A140DA91C53673F898D24A40A7

GNOME keyring
-------------

If you are tired of being prompted for password, it is possible to let GNOME
keyring link PAM (login password) to GnuPG passfrase:
`<https://wiki.archlinux.org/index.php/GNOME/Keyring>`_

The idea is that if your machine password is identical to your GPG passphrase,
PAM will dispatch the password and unlock GPG for you on login.

Downloading Passwords
---------------------

My personal password archive can be installed from::

    $ git clone git@github.com:jonathf/passwords ~/.password-store

Connect ``pass`` to the GnuPG like this::

    $ pass init 558C5F4DBB8597A140DA91C53673F898D24A40A7
