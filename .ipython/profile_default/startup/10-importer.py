from IPython import get_ipython, embed

ipython = get_ipython()

try:
    ipython.run_line_magic("load_ext", "pyflyby")
except ModuleNotFoundError:
    print("pyflyby is missing!")
try:
    ipython.run_line_magic("load_ext", "rich")
except ModuleNotFoundError:
    print("rich is missing!")
try:
    ipython.run_line_magic("autoreload", "2")
except ModuleNotFoundError:
    print("autoreload is missing!")
