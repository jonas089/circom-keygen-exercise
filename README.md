# Paillier Keygen in Circom
Dear Chainsafe team, for this task I chose to make use of a `gcd` function found in `math.circom`. Other than that I wrote the circuit code in `keygen.circom` with plenty of comments explaining each step.

The circuit takes two private inputs that are the prime numbers `p`, `q` and `g` and performs assertions on them. If the proof can be verified then the primes satisfy the equations that I have implemented according to the specifications of the assignment.

# Compiling the circuit and generating a proof
I included bash scripts that help compile the circuit, compute the witness and generate a proof. 

Given that you have circom and snarkjs installed globally you can run:

```
./compile.sh
./prove.sh
```

-> public.json should contain a value (either 0 or 1).
if the value in public.json is 1 then the inputs `DO NOT MEET THE REQUIREMENTS`. If the value is 0 and the proof can be successfully verified, then all constraints are met.

# Verifying that the inputs are valid
The inputs `p`, `q` and `g` are considered valid if the circuit does not error and the public output `o` is equal to 0:

```
    mew <-- (l_inner_intermediate/pq_gcd_lhs_intermediate) % pq_gcd_lhs_intermediate;
    o <== (mew != 0 ? 0 : 1);
```

If the output value is 1 (not 0) the inputs are invalid because `n` does not divide the order of `g` 

Thank you for this interesting problem.

