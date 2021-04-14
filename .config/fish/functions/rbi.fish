# Defined in - @ line 1
function rbi --description 'alias rbi git rebase -i' --wraps 'git rebase -i'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git rebase -i $argv;
    else
        config rebase -i $argv;
    end
end
