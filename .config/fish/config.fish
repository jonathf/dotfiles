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
xmodmap $HOME/.Xmodmap

# function bind_jk
#   if commandline -P
#     commandline -f cancel
#   else
#     set fish_bind_mode default
#     commandline -f backward-char force-repaint
#   end
# end
# bind -M insert jk bind_jk

# function bind_bang
#   switch (commandline -t)
#   case "!"
#     commandline -t $history[1]
#     commandline -f repaint
#   case "*"
#     commandline -i !
#   end
# end
# bind -M insert ! bind_bang

function bind_slash
  # Make // an abbrevated shortcut to git root, when in workdir.
  switch (commandline -t)
    case "/"
      set _path (git rev-parse --show-toplevel 2>/dev/null)
      [ "$_path" = "" ] && set _path "/"
      set _path (string replace $HOME \~ $_path)
      commandline -t $_path"/"
      commandline -f repaint
    case "*"
      commandline -i "/"
  end
end
bind -M insert '/' bind_slash

function bind_dot
  # Make <folder>/.. an abbrevated shortcut to <parent folder>
  set current_token (commandline -t)
  set current_token (string replace \~ $HOME $current_token)
  if test -d "$current_token." && test ! -d "$current_token.."
    set current_token (realpath $current_token.)
    set current_token (string replace $HOME \~ $current_token)
    if [ "$current_token" != "/" ]
      set current_token $current_token/
    end
    commandline -t $current_token
    commandline -f repaint
  else
    commandline -i "."
  end
end
bind -M insert . bind_dot

fish_vi_key_bindings
bind -M insert \e\x7F 'backward-kill-path-component'

# fancy prompt with starship
starship init fish | source

function transient_prompt_func
  starship module character
end
function transient_rprompt_func
end
enable_transience
