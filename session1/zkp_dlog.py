import math
from random import random
import numpy as np

validate_times = 100
prime = 273389558745553615023177755634264971227
gen = 191981998178538467192271372964660528157

def dlogProof(x, g, p):
    """
    y = g^x(mod p)
    """
    # (1) a residue y, evaluated as g^x (mod p) 
    y = math.pow(g, x, p)
    # (2) a proof of knowledge pf that you know x that is the discrete log of y
    # test 100 times
    # r_array stores r in each verification, and 0 <= r < p - 1
    r_array = np.array([])
    for i in range(validate_times):
        r_array.append(random() * (p - 1))
    print("r_array: {}".format(r_array))
    # h_array stores h in each verification, and h = g^r(mod p)
    h_array = np.array([])
    for r in r_array:
        h_array.append(math.pow(g, r, p))

    print("h_array: {}".format(h_array))
    b_array = pseudoRandomBits(r_array, validate_times)

    s_array = (r_array + b_array * x) % (p - 1)
    

    pf = (h_array, s_array)
    return (y, pf)

def verify(y, g, p, pf):
    """
    returns true if pf is a valid proof of knowledge and false otherwise.
    """
    s_array = pf[1]
    h_array = pf[0]
    b_array = pseudoRandomBits(h_array, validate_times)
    for i in range(validate_times):
        s = s_array[i]
        h = h_array[i]
        b = b_array[i]
        
        if (math.pow(g, s, p)) == ((h * math.pow(y, b)) % p):
            return False
        
    return True


def pseudoRandomBits(h_array, validate_times):
    """
    which stands for the H(g, y, h).  
    y = g^x mod p, h = g^r mod p.
    """
    b_arr = np.array([])
    for i in range(validate_times):
        H = math.pow(gen, h_array[i], prime)
        b_arr.append(0 if H & i == 0 else 1)
    return b_arr


if __name__ == '__main__':
    dlogProof(1, 2, 3)