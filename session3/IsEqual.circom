pragma circom 2.1.2;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template IsEqual () {
    signal input in[2];
    signal output out;
    
    signal isEqual;
    isEqual <-- in[0] == in[1];

    out <== isEqual;
}

component main = IsEqual();

/* INPUT = {
    "in": ["3", "5"]
} */