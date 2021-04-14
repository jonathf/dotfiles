# Defined in - @ line 1
function pl --description 'alias pl git pull --rebase' --wraps 'git pull --rebase'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git pull --rebase $argv;
    else
        config pull --rebase $argv;
    end
end
