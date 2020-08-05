# Defined in - @ line 1
function pst --description 'alias pst git push --tags' --wraps 'git push --tags'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git push --tags $argv;
end
