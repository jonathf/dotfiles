# Defined in - @ line 1
function rb --description 'alias rb git rebase' --wraps 'git rebase'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git rebase $argv;
    else
        config rebase $argv;
    end
end
