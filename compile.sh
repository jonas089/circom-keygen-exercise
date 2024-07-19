#! /bin/bash
circom keygen.circom --r1cs --wasm --sym --c
node ./keygen_js/generate_witness.js ./keygen_js/keygen.wasm input.json witness.wtns
