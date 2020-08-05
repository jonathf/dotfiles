# support for vi-behavior
fish_vi_key_bindings

# auto-exec code on folder entry
[ -n "(command -v direnv)" ] && eval (direnv hook fish)

# for managing python environments
not contains $PYENV_ROOT/shims $PATH && pyenv init - | source

# fancy prompt with starship
starship init fish | source

# pass login passwords to keyring
[ -n "$DESKTOP_SESSION" ] && set (gnome-keyring-daemon --start | string split "=")
