# Defined in - @ line 1
function rba --description 'alias rba git rebase --abort' --wraps 'git rebase --abort'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git rebase --abort $argv;
    else
        config rebase --abort $argv;
    end
end
