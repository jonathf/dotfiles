# Defined in - @ line 1
function cob --description 'alias cob git checkout -b' --wraps 'git checkout -b'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git checkout -b $argv;
end
