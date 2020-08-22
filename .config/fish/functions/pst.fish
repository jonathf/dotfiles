# Defined in - @ line 1
function pst --description 'alias pst git push --tags' --wraps 'git push --tags'
    git push --tags $argv;
end
