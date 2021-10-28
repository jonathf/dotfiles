function fish_user_key_bindings --description "key mapping"
  bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
  bind -M insert ! bind_bang
  bind -M insert '/' bind_slash
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
      commandline -t $_path"/"
      commandline -f repaint
    case "*"
      commandline -i "/"
  end
end
