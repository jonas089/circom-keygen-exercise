template GCD() {
    signal input left_operand;
    signal input right_operand;
    signal output gcd;

    signal temp[256];
    signal left[256];
    signal right[256];

    left[0] <== left_operand;
    right[0] <== right_operand;

    for (var i = 0; i < 255; i++) {
        // Only perform modulo if right is not zero
        temp[i] <-- left[i] - right[i] * (left[i] / right[i]);
        left[i + 1] <== right[i];
        right[i + 1] <-- temp[i] * (right[i] != 0);
    }

    // The gcd is the last non-zero remainder in left or right
    gcd <-- left[255] * (right[254] == 0) + right[254] * (right[254] != 0);
}
