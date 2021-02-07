# Defined in - @ line 1
function l --description 'alias l git graph -20' --wraps 'git graph -20'
    git --no-pager graph -20 $argv;
end
