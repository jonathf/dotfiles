# Defined in - @ line 1
function co --description 'alias co git checkout' --wraps 'git checkout'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git checkout $argv;
    else
        config checkout $argv;
    end
end
