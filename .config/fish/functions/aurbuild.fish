function aurbuild --description 'download and install AUR' --wraps 'makepkg'
    $HOME/.local/bin/aurbuild $argv;
end
