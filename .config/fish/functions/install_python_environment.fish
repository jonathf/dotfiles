function install_python_environment --description 'create python virtual environment and install some base dependencies'
  python$argv[1].$argv[2] -m venv .$argv[1]$argv[2]
  source .$argv[1]$argv[2]/bin/activate.fish
  mv ~/.config/pip/pip.conf{,.lock}
  pip install -Ur ~/.config/requirements.txt
  mv ~/.config/pip/pip.conf{.lock,}
end
