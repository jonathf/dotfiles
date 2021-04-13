# Defined in - @ line 1
function config --description 'alias git git' --wraps 'git --git-dir=~/.config/dotfiles --work-tree=~'
    ~/.local/bin/config $argv
end
