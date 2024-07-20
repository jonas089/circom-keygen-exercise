# Paillier Keygen in Circom
Dear Chainsafe team, for this task I chose to make use of a `gcd` function found in `math.circom`. Other than that I wrote the circuit code in `keygen.circom` with plenty of comments explaining each step.

The circuit takes two private inputs that are the prime numbers `p`, `q` and `g` and performs assertions on them. If the proof can be verified then the primes satisfy the equations that I have implemented according to the specifications of the assignment.

# Challenges
The primary challenge was to ensure that the field arithmetic modulo `n` checks out. By default circom performs elliptic curve arithmetic modulo `p`, which would yield incorrect results for this exercise. I have solved this by computing the modular inverse modulo, with `n` already being a field element of the field under `p`. This should yield correct results since the field arithmetic happens under `p` but `n` is mapped to the corresponding element in that field.

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

If the first value in `public.json` is 1 (not 0), then the inputs are invalid because `n` does not divide the order of `g` 

Thank you for this interesting problem.

# Other Circuit Outputs


Example with `invalid` inputs (`mew` == 0) e.g. public output o == 1:
```
input.json

input: {
    "p": "3",
    "q": "5",
    "g": "7"
}


public.json

output: [
 "1",
 "7",
 "15",
 "4",
 "0"
]
```

Example with `valid` inputs (`mew` != 1) e.g. public output o == 0:

```
input.json 

input: {
    "p": "97",
    "q": "89",
    "g": "47"
}

public.json

output: [
 "0",
 "47",
 "8633",
 "1056",
 "342"
]
```

As mentioned earlier the first output is expect to be `0`. The second output is the random value for `g` that was passed as a public input, the public key is (`n`, `g`).
The third value is `n`. The fourth value is `lambda` and the fith value is `mew`. The private key is (`lambda`, `mew`).