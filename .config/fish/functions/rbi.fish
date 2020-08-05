# Defined in - @ line 1
function rbi --description 'alias rbi git rebase -i' --wraps 'git rebase -i'
	git rebase -i $argv;
end
