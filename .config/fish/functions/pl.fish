# Defined in - @ line 1
function pl --description 'alias pl git pull --rebase' --wraps 'git pull --rebase'
    git pull --rebase $argv;
end
