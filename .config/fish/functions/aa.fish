# Defined in - @ line 1
function aa --wraps='git add-all' --wraps='git add -a' --description 'alias aa git add -a'
    git add -a $argv;
end
