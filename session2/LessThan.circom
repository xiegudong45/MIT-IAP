pragma circom 2.1.2;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template LessThan () {
    signal input in[2];
    signal output out;
    
    var front = in[0];
    var rear = in[1];
    var stop = 0;
    // signal res;
    for (var i = 251; i >= 0; i--) {
        var frontBit = (front >> i) & 1;
        var rearBit = (rear >> i) & 1;
        if (frontBit != rearBit && stop == 0) {
            
            stop = frontBit < rearBit ? 1 : -1;
        }
    }
    signal res;
    res <-- stop == -1 ? 0 : stop; 
    out <== res;
}

component main = LessThan();

/* INPUT = {
    "in": ["7", "7"]
} */