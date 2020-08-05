# Defined in - @ line 1
function p --description 'python alias' --wraps 'python'
	if count $argv > /dev/null
		python $argv
	else
		ipython
	end
end
