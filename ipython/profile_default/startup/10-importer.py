try:
    # python >=3.4
    import importlib
    is_module = importlib.util.find_spec
except:
    # python 2
    import pkgutil
    is_module = pkgutil.find_loader

import os
import sys

if is_module("numpy") is not None:
    import numpy
    import numpy as np
    t = np.linspace(0, 1, 100)
    a = np.arange(12).reshape(3, 4)

# if is_module("matplotlib") is not None:
#     import matplotlib.pyplot as plt

if is_module("scipy") is not None:
    import scipy
    import scipy as sp

if is_module("pandas") is not None:
    import pandas
    import pandas as pd
    frame = pd.DataFrame({"a": ["b", "c", "d"], "b": [0.1, 0.2, 0.3]})

if is_module("h5py") is not None:
    import h5py
    import h5py as h5

if is_module("chaospy") is not None:
    import chaospy
    import chaospy as cp

if is_module("numpoly") is not None:
    import numpoly
    import numpoly as nu