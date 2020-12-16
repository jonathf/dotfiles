try:
    # python >=3.4
    import importlib
    is_module = importlib.util.find_spec
except ImportError:
    # python <3.4
    import pkgutil
    is_module = pkgutil.find_loader

import os
import sys

if is_module("numpy") is not None:
    import numpy
    np = numpy
    t = numpy.linspace(0, 1, 100)
    a = numpy.arange(12).reshape(3, 4)

if is_module("matplotlib") is not None:
    import matplotlib.pyplot
    plt = pyplot = matplotlib.pyplot

if is_module("scipy") is not None:
    import scipy
    sp = scipy

if is_module("pandas") is not None:
    import pandas
    pd = pandas
    frame = pandas.DataFrame({
        "st": ["b", "c", "d"],
        "fl": [0.1, 0.2, 0.3],
        "nu": [1, 2, 3],
        "da": pd.date_range("2020-01-01", "2020-01-03"),
    })

if is_module("h5py") is not None:
    import h5py
    h5 = h5py

if is_module("chaospy") is not None:
    import chaospy
    cp = chaospy

if is_module("numpoly") is not None:
    import numpoly
    nu = numpoly
    q0, q1 = numpoly.variable(2)
    poly = numpoly.polynomial([1, q0, q1, q0**2-1, q0*q1, q1**2-1])

if is_module("pymc3") is not None:
    import pymc3
    pm = pymc3
