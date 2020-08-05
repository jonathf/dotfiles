# Defined in - @ line 1
function co --description 'alias co git checkout' --wraps 'git checkout'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git checkout $argv;
end
