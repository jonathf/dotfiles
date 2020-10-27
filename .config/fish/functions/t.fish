# Defined in - @ line 1
function t --description 'pytest alias' --wraps 'pytest'
	set --local nbval
	if pip freeze 2>/dev/null | grep 'nbval' >/dev/null
		set --local nbval '--nbval'
	end
	pytest -vv --doctest-modules --maxfail=5 $nbval $argv
end
