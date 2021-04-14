# Defined in - @ line 1
function rbs --description 'alias rbs git rebase --skip' --wraps 'git rebase --skip'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git rebase --skip $argv;
    else
        config rebase --skip $argv;
    end
end
