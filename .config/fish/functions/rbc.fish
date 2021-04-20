# Defined in - @ line 1
function rbc --description 'alias rbc git rebase --continue' --wraps 'git rebase --continue'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git rebase --continue $argv;
    else
        config rebase --continue $argv;
    end
end
