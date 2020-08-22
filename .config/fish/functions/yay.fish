# Defined in - @ line 1
function yay --wraps='sudo yay -Syu' --description 'alias yay sudo yay -Syu'
    command yay -Syu --noconfirm $argv;
end
