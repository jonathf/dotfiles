# Defined in - @ line 1
function psf --description 'alias psf git push -f --force-with-lease' --wraps 'git push -f --force-with-lease'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git push --force-with-lease --force $argv;
    else
        config push --force-with-lease --force $argv;
    end
end
