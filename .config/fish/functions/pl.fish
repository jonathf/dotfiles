# Defined in - @ line 1
function pl --description 'alias pl git pull --rebase' --wraps 'git pull --rebase'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git pull --rebase $argv;
end
