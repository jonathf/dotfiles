# Defined in - @ line 1
function psf --description 'alias psf git push -f --force-with-lease' --wraps 'git push -f --force-with-lease'
    set --local gitpath (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$gitpath"
        echo -e "\e[90m$gitpath\e[m"
        git push --force-with-lease --force $argv;
    else
        config push --force-with-lease --force $argv;
    end
end
