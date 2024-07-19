pragma circom 2.0.0;

include "math.circom";

template Circuit () {  

// Input Signals
    signal input p; 
    signal input q;
// Intermediate Values
    signal pq_gcd_lhs_intermediate;
    signal pq_gcd_rhs_intermediate;
    // gcd: signal to store greatest common divisor
    signal gcd_intermediate;
    // lambda: signal to store least common multiple
    signal lambda_intermediate;
    signal mew;

    pq_gcd_lhs_intermediate <== p*q;
    pq_gcd_rhs_intermediate <== (p-1) * (q-1);
    gcd_intermediate <-- gcd(pq_gcd_lhs_intermediate, pq_gcd_rhs_intermediate);
    // assert that the gcd is 1
    1 === gcd_intermediate;

    // compute least common multiple according to
    // p*q / gcd(p, q) -> reuse the gcd_intermediate
    // note that division is equivalent to multiplying
    // by the modular inverse
    lambda_intermediate <-- pq_gcd_lhs_intermediate / gcd_intermediate;

    // check the existance of the modular inverse of mew
    // checking the existance is equivalent to asserting not zero
    

}

component main = Circuit();
