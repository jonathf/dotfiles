alias sba="source ~/.bash_aliases"

# Make 'D' exit, except in Neovim terminal, then it is close split
alias D="_D"
function _D(){
    exit
}

function p(){
    if [ "$#" -ne 0 ]; then
        python -B "$@"
    else
        ipython --nosep
    fi
}

function t(){
    root=$(git rev-parse --show-toplevel)
    pytest --doctest-modules --maxfail=5 $(realpath "$1")
}
alias i="ipython --nosep"


alias l="git ll -20"
alias pl="git pull --rebase"
alias ps="git push"
alias a="git add"
alias aa="git add-all"
alias psf="git push -f --force-with-lease"
alias psu="git push -u"
alias cm="git commit"
alias cma="git commit -a"
alias am="git commit --amend"
alias ama="git commit --amend -a"
alias co="git checkout"
alias cob="git checkout -b"
alias rb="git rebase"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"
alias rbs="git rebase --skip"
alias rbi="git rebase -i"
alias gd="git diff --color-words"
alias s="git status -sb"

function clone(){
    git clone --recurse-submodules git@github.com:$1
}

function g(){
    cd $(git rev-parse --show-toplevel)/"$@"
}

alias z="zathura"

alias lls="command ls"
alias ls="exa"
alias ll='exa -l -g --git'
alias la='exa -a'

alias vi="nvim"
alias vim="nvim"

# stuff that only trigger inside Neovim terminal:
if [[ "$NVIM_LISTEN_ADDRESS" != "" ]]; then

    export incd="0"
    function cd(){
        if [[ "$incd" == "1" ]]; then
            return 0
        fi
        export incd="1"
        builtin cd "$@"
        ~/.config/nvim/venv/bin/python -c "import neovim
with neovim.attach('socket', path='$NVIM_LISTEN_ADDRESS') as session:
    session.vars['__autocd_cwd'] = '$argv'
    session.command('execute \"lcd \" . fnameescape(g:__autocd_cwd)')"
        export incd="0"
    }

    function _D(){
        ~/.config/nvim/venv/bin/python -c "import neovim
with neovim.attach('socket', path='$NVIM_LISTEN_ADDRESS') as session:
    session.command('setlocal bufhidden=hide')
    session.command('close')"
    }

    function vi(){
        ~/.config/nvim/venv/bin/nvr "$@"
    }
    function vim(){
        ~/.config/nvim/venv/bin/nvr "$@"
    }
    function nvim(){
        ~/.config/nvim/venv/bin/nvr "$@"
    }
fi