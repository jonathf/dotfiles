# Defined in - @ line 1
function ll --description 'alias ll exa -l -g --git' --wraps 'exa -l'
	exa --long --git $argv;
end
