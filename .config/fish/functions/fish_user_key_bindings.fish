function fish_user_key_bindings --description "key mapping"
  bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
  bind -M insert ! bind_bang
  bind -M insert '$' bind_dollar
end

