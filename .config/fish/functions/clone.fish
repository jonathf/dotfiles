# Defined in - @ line 1
function clone --description 'alias clone git clone --recurse-submodules git@github.com:' --wraps 'git clone'
    $HOME/.local/bin/clone $argv;
end
