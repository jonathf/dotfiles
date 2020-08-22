# Defined in - @ line 1
function a --description 'alias a git add' --wraps 'git add'
    git add $argv;
end
