pragma circom 2.0.0;

include "math.circom";

template Circuit () {  

// Input Signals
    signal input p; 
    signal input q;
    signal input g;
// Output Signals
    signal output o;
// Intermediate Values
    signal pq_gcd_lhs_intermediate;
    signal pq_gcd_rhs_intermediate;
    // gcd: signal to store greatest common divisor
    signal gcd_intermediate;
    // lambda: signal to store least common multiple
    signal lambda_intermediate;
    signal mew;
    // mew intermediate signals
    signal l_inner_intermediate;

    pq_gcd_lhs_intermediate <== p*q;
    pq_gcd_rhs_intermediate <== (p-1) * (q-1);
    gcd_intermediate <-- gcd(pq_gcd_lhs_intermediate, pq_gcd_rhs_intermediate);
    // assert that the gcd is 1
    1 === gcd_intermediate;

    // compute least common multiple according to
    // p*q / gcd(p, q) -> reuse the gcd_intermediate
    // note that division is equivalent to multiplying
    // by the modular inverse.
    lambda_intermediate <-- pq_gcd_lhs_intermediate / gcd_intermediate;

    // check the existance of the modular inverse of mew
    // checking the existance is equivalent to asserting not zero.

    // pq_gcd_lhs_intermediate == n

    // Formula to compute mew
    // (((g**lambda % n**2) - 1) / n)
    // a**(n-2) % n will yield the modular inverse


    l_inner_intermediate <-- (g**lambda_intermediate % pq_gcd_lhs_intermediate**2) - 1;
    mew <-- l_inner_intermediate**(pq_gcd_lhs_intermediate-2)%pq_gcd_lhs_intermediate;
    o <-- (mew != 0 ? 0 : 1);
}

component main = Circuit();
