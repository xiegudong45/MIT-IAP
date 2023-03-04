pragma circom 2.1.2;

include "compconstant.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template IsNegative () {
    signal input in[254];
    
    signal output out;
    
    component comp = CompConstant(21888242871839275222246405745257275088548364400416034343698204186575808495617 \ 2);
    for (var i = 0; i < 254; i++) {
        comp.in[i] <== in[i];
    }
    out <== comp.out;
}

component main = IsNegative();