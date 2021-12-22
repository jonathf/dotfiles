from IPython import get_ipython

ipython = get_ipython()

try:
    ipython.magic("load_ext pyflyby")
except ModuleNotFoundError:
    print("pyflyby is missing!")
try:
    ipython.magic("load_ext rich")
except ModuleNotFoundError:
    print("rich is missing!")
