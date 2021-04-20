# Defined in - @ line 1
function am --description 'alias am git commit --amend' --wraps 'git commit --amend'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git commit --amend $argv;
    else
        config commit --amend $argv;
    end
end
