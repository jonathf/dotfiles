# Defined in - @ line 1
function ls --description 'alias ls exa' --wraps 'exa'
    eza $argv;
end
