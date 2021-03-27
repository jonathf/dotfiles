# Defined in - @ line 1
function _git --description 'alias git git' --wraps 'git --git-dir=~/.config/dotfiles --work-tree=~'
    ~/.local/bin/_git $argv
end
