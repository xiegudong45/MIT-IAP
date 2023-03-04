pragma circom 2.1.2;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template Selector (nChoices) {
    signal input in[nChoices];
    signal input index;
    signal output out;
    
    signal res;
    var outOfBound;
    if (index >= nChoices || index < 0) {
        outOfBound = 0;
    } else {
        outOfBound = 1;
    }
    res <-- outOfBound == 0 ? 0 : in[index];
    out <== res;
}

component main = Selector(4);

/* INPUT = {
    "in": ["1", "2", "3", "4"],
    "index": "4"
} */