# Defined in - @ line 1
function co --description 'alias co git checkout' --wraps 'git checkout'
    git checkout $argv;
end
