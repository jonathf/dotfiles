# Defined in - @ line 1
function psf --description 'alias psf git push -f --force-with-lease' --wraps 'git push -f --force-with-lease'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git push -f --force-with-lease $argv;
end
