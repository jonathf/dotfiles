# Defined in - @ line 1
function rbs --description 'alias rbs git rebase --skip' --wraps 'git rebase --skip'
	git rebase --skip $argv;
end
