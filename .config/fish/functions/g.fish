# Defined in - @ line 1
function g --description 'alias g cd (git rev-parse --show-toplevel)/' --wraps 'cd'
	if test -z "$PROJECT_ROOT"
		set PROJECT_ROOT (git rev-parse --show-toplevel 2> /dev/null)
	end
	if test -z "$PROJECT_ROOT" -o "$PROJECT_ROOT" = "(pwd)"
		cd $dirprev[-1]
	else if count $argv > /dev/null
		cd "$PROJECT_ROOT/$argv[1]"
	else
		cd "$PROJECT_ROOT"
	end
end
