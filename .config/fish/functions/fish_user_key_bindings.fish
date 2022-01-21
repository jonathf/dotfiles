function fish_user_key_bindings --description "key mapping"
  bind -M insert jk bind_jk
  bind -M insert ! bind_bang
  bind -M insert '/' bind_slash
  bind -M insert . bind_dot
end

function bind_jk
  if commandline -P
    commandline -f cancel
  else
    set fish_bind_mode default
    commandline -f backward-char force-repaint
  end
end

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]
    commandline -f repaint
  case "*"
    commandline -i !
  end
end

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
