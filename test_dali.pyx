from libcpp.string cimport string
from libcpp.vector cimport vector
from libcpp11.memory cimport shared_ptr

ctypedef float dtype

cdef string normalize_s(s):
    if type(s) is str:
        return s.encode("utf-8")
    elif type(s) is bytes:
        return s
    else:
        raise TypeError("Must pass a str or bytes object.")

# File IO, save / load, etc...
include "dali/utils/core_utils.pyx"

# Matrix class
include "dali/tensor/Mat.pyx"

# Layer, RNN, StackedInputLayer, etc...
include "dali/layers/Layers.pyx"

# SGD, Adagrad, Adadelta, etc...
include "dali/tensor/Solver.pyx"

# SGD, Adagrad, Adadelta, etc...
include "dali/tensor/Tape.pyx"

