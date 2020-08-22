# Defined in - @ line 1
function rbc --description 'alias rbc git rebase --continue' --wraps 'git rebase --continue'
    git rebase --continue $argv;
end
