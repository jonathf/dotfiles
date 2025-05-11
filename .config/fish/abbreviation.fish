abbr a git add
abbr aa git add -u
abbr am git commit --amend
abbr amf "git commit --amend -a --no-edit --allow-empty && git push --force-with-lease"
abbr cm git commit
abbr cma git commit -a
abbr co git checkout
abbr com git checkout main
abbr cob git checkout -b
abbr d direnv
abbr de direnv edit
abbr da direnv allow
abbr dl "docker aws ecr get-login-password --profile dev --region eu-west-1 | docker login --username AWS --password-stdin 822152007605.dkr.ecr.eu-west-1.amazonaws.com"
abbr en xmodmap ~/.Xmodmap
abbr h helm
abbr i ipython --nosep
abbr j jira issue
abbr p python
abbr k kubectl
abbr kgc kubectl config get-contexts
abbr kdp kubectl describe pod
abbr kg kubectl get
abbr kgd kubectl get deployments
abbr kgi kubectl get ingress
abbr kgp kubectl get pods
abbr kgs kubectl get services
abbr kl kubectl logs
abbr ksc kubectl config use-context
# abbr kls kcat -b confluent-gp.test.transhub.io:9092 -L \| grep -e \'^ \*topic \\\"\' \| sed \'s/^ \*topic \\\"\\\(.\*\\\)\\\" with \[0-9\]\* partitions:/\\1/\' \| sort
# abbr kcd kcat -b confluent-gp.dev.transhub.io:9092
# abbr kct kcat -b confluent-gp.test.transhub.io:9092
abbr l git --no-pager graph -20
abbr la ls --all
abbr ll ls --long
abbr n nvim
abbr no xmodmap ~/.Xmodmap-no
abbr o open
abbr pl git pull
abbr ps git push
abbr psf git push --force-with-lease
abbr pst git push --force-with-lease --tags
abbr psu git push --set-upstream
abbr rb git rebase --autostash
abbr rba git rebase --abort
abbr rbc git rebase --continue
abbr rbs git rebase --skip
abbr rbi git rebase --autostash --interactive
abbr s git status --short --branch
abbr sf source ~/.config/fish/config.fish
abbr t pytest -vv --doctest-modules
abbr vi nvim
abbr vim nvim
abbr z zathura
abbr mypy-pip /home/jonathf/.local/share/nvim/mason/packages/mypy/venv/bin/pip
abbr arm 'env PATH=(string join ":" /opt/homebrew/bin $PATH) arch -arm64'
abbr - cd -

abbr terraform --function _tf
abbr tf --function _tf
function _tf
  set --local cmd "terraform"
  if test -n "$TERRAFORM_ROOT"
    set --local _arg (git rev-parse --show-toplevel 2>/dev/null)
    if test $_arg/$TERRAFORM_ROOT = (pwd)
      set _arg ""
    end
    if test -n "$_arg"
      set cmd "$cmd -chdir=$_arg"
      set cmd "$cmd/$TERRAFORM_ROOT"
    end
  end
  echo "$cmd"
end
abbr ti --function _tfi
function _tfi
  echo (_tf)" init -reconfigure"
end
abbr tp --function _tfp
function _tfp
  echo (_tf)" plan"
end
abbr ta --function _tfa
function _tfa
  echo (_tf)" apply"
end
abbr tws --function _tws
function _tws
  echo (_tf)" workspace select"
end
abbr twn --function _twn
function _twn
  echo (_tf)" workspace new"
end

abbr 27 install_python_environment 2 7
abbr 37 install_python_environment 3 7
abbr 38 install_python_environment 3 8
abbr 39 install_python_environment 3 9
abbr 310 install_python_environment 3 10
abbr 311 install_python_environment 3 11
abbr 312 install_python_environment 3 12
