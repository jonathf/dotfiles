# Defined in - @ line 1
function a --description 'alias l git ll -20' --wraps 'git ll -20'
    git ll --no-pager -20 $argv;
end
