# Defined in - @ line 1
function rb --description 'alias rb git rebase' --wraps 'git rebase'
    git rebase $argv;
end
