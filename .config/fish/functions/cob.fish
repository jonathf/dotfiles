# Defined in - @ line 1
function cob --description 'alias cob git checkout -b' --wraps 'git checkout -b'
    git checkout -b $argv;
end
