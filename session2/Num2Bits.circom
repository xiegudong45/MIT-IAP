pragma circom 2.1.2;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template Num2Bits(nBits) {
    signal input in;
    
    signal output b[nBits];
    
    var accum = 0;
    for (var i = 0; i < nBits; i++) {
        b[i] <-- (in >> i) & 1;
        b[i] * (b[i] - 1) === 0;
        accum += (2 ** i) * b[i];
    }
    
    in === accum;
    
}

component main = Num2Bits(5);

/* INPUT = {
    "in": "5"
    
} */