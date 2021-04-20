# Defined in - @ line 1
function psu --description 'alias psu git push -u' --wraps 'git push -u'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git push -u $argv;
    else
        config push -u $argv;
    end
end
