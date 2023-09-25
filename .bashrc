[[ $- != *i* ]] && return
source ~/.profile
if [ -z "$BASH_EXECUTION_STRING" ]; then
  exec fish
fi

set -o vi
set editing-mode vi
set keymap vi

export PROMPT_COMMAND=""
shopt -s checkjobs
shopt -s expand_aliases
shopt -s globstar
shopt -s histappend
shopt -s cmdhist
shopt -s no_empty_cmd_completion
shopt -s nocaseglob

[ -n "$(command -v direnv)" ] && eval "$(direnv hook bash)" &
command -v pyenv 2>&1 >/dev/null && eval "$(pyenv init -)" &
eval "$(starship init bash)"

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_bindings ] && source ~/.bash_bindings

greetings
wait

. "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
