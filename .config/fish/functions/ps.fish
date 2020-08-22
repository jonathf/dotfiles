# Defined in - @ line 1
function ps --description 'alias ps git push' --wraps 'git push'
    git push $argv;
end
