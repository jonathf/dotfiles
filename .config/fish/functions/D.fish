# Defined in - @ line 1
function D --description 'alias D exit'
    if test -n "$NVIM_LISTEN_ADDRESS"
        ~/.config/nvim/venv/bin/python -I -c "
import neovim
with neovim.attach('socket', path='$NVIM_LISTEN_ADDRESS') as session:
    session.command('setlocal bufhidden=hide')
    session.command('close')"
    end
    exit
end
