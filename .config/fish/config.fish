# auto-exec code on folder entry
[ -n "(command -v direnv)" ] && eval (direnv hook fish)

# connect login, keyring and gnupg
set --export GPG_TTY (tty)
set --export SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set --export SHELL (which fish)
gpgconf --launch gpg-agent
[ -n "$DESKTOP_SESSION" ] && set (gnome-keyring-daemon --start 2>/dev/null | string split "=") >/dev/null && gpg-connect-agent updatestartuptty /bye >/dev/null

source ~/.config/fish/abbreviation.fish

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

fish_user_key_bindings

# pnpm
set -gx PNPM_HOME "/Users/jonathf/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
