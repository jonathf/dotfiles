# Defined in - @ line 1
function ps --description 'alias ps git push' --wraps 'git push'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git push $argv;
end
