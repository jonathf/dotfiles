# Defined in - @ line 1
function psu --description 'alias psu git push -u' --wraps 'git push -u'
    git push -u $argv;
end
