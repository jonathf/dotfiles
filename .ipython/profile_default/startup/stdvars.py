from contextlib import suppress
from IPython import embed

__all__ = ["embed", "d", "s", "l"]

d = {"a": 1, "b": 2, "c": 3}
s = {"a", "b", "c"}
l = [1, 2, 3, 4]

with suppress(ModuleNotFoundError):
    import boto3

    boto3.setup_default_session(region_name="eu-west-1")

with suppress(ModuleNotFoundError):
    import numpy

    t = numpy.linspace(0, 1, 100)
    a = numpy.arange(12).reshape(3, 4)
    __all__.extend(["t", "a"])

with suppress(ModuleNotFoundError):
    import pandas

    df = pandas.DataFrame(
        {
            "s": ["b", "c", "d"],
            "f": [0.1, 0.2, 0.3],
            "i": [1, 2, 3],
            "d": pandas.date_range("2020-01-01", "2020-01-03"),
        }
    )
    __all__.append("df")
