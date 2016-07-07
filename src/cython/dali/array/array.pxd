from libcpp.string                     cimport string
from third_party.libcpp11.memory       cimport shared_ptr
from third_party.libcpp11.stringstream cimport stringstream
from third_party.libcpp11.vector       cimport vector

from .dtype                      cimport *
from .memory.device               import *
from .memory.device              cimport *
from .memory.synchronized_memory cimport *

cdef extern from "dali/array/array.h":
    cdef cppclass CArray "Array":
        CArray()
        CArray(vector[int], DType dtype, CDevice device) except +
        vector[int]& shape() except +
        int ndim() except +

        CArray reshape(vector[int] new_shape) except +
        void print_me "print" (stringstream& stream) const;
        DType dtype() except +
        CDevice preferred_device() except +
        shared_ptr[CSynchronizedMemory] memory() except +
        vector[int] normalized_strides() except +

cdef class Array:
    """Multidimensional array of numbers.

    Parameters
    ----------
    shape: [int]
        a list representing sizes of subsequent dimensions
    dtype: np.dtype
        datatype used for representing numbers
    preferred_device: dali.Device
        preferred device for data storage. If it is equal to None,
        a dali.default_device() is used.
    """

    cdef CArray o

    @staticmethod
    cdef Array wrapc(CArray o)
