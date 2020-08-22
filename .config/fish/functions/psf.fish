# Defined in - @ line 1
function psf --description 'alias psf git push -f --force-with-lease' --wraps 'git push -f --force-with-lease'
    git push -f --force-with-lease $argv;
end
