# Defined in - @ line 1
function psu --description 'alias psu git push -u' --wraps 'git push -u'
    if git rev-parse --is-inside-work-tree 2>/dev/null
        git push -u $argv;
    else
        config push -u $argv;
    end
end
