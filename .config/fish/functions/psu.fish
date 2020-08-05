# Defined in - @ line 1
function psu --description 'alias psu git push -u' --wraps 'git push -u'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git push -u $argv;
end
