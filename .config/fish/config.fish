# support for vi-behavior
# fish_vi_key_bindings

# auto-exec code on folder entry
[ -n "(command -v direnv)" ] && eval (direnv hook fish)

# for managing python environments
not contains $PYENV_ROOT/shims $PATH && pyenv init --path | source

# connect login, keyring and gnupg
set --export GPG_TTY (tty)
set --export SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
[ -n "$DESKTOP_SESSION" ] && set (gnome-keyring-daemon --start 2>/dev/null | string split "=") && gpg-connect-agent updatestartuptty /bye >/dev/null

source ~/.config/fish/abbreviation.fish

fish_vi_key_bindings
bind -M insert \e\x7F 'backward-kill-path-component'

# fancy prompt with starship
starship init fish | source
function transient_prompt_func
  starship module character
end
function transient_rprompt_func
end
if type -q enable_transience
  enable_transience
end
