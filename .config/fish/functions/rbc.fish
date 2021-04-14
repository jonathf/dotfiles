# Defined in - @ line 1
function rbc --description 'alias rbc git rebase --continue' --wraps 'git rebase --continue'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git rebase --continue $argv;
    else
        config rebase --continue $argv;
    end
end
