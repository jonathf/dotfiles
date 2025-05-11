function fish_user_key_bindings --description "key mapping"
  fish_default_key_bindings -M insert
  if test -z "$NVIM"
    fish_vi_key_bindings --no-erase insert
  end
  bind -M insert ! bind_bang
  bind -M insert '/' bind_slash
  bind -M insert . bind_dot
  bind -M insert \e\x7F 'backward-kill-path-component' # m-bs

  bind -M insert › 'backward-bigword' # m-b
  bind -M insert Ω 'forward-bigword' # m-w
  bind -M insert ç 'beginning-of-line' # m-c
  bind -M insert ¸ 'end-of-line' # m-g
  bind -M insert … 'history-token-search-backward' # m-.
  bind -M insert \cC 'commandline ""' # c-c
  bind -M insert \cZ 'fg 2>/dev/null; commandline -f repaint' # c-z
  # bind -M insert ﬁ  'ls' # m-l
  bind -M insert ﬁ  'history-pager' # m-l
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
    case "\\/"
      commandline -t //
      commandline -f repaint
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
  else if test "$current_token" = "\\."
    commandline -t ..
    commandline -f repaint
  else
    commandline -i "."
  end
end
