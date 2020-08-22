# Defined in - @ line 1
function rba --description 'alias rba git rebase --abort' --wraps 'git rebase --abort'
    git rebase --abort $argv;
end
