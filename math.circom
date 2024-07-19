function gcd(left_operand, right_operand){
    var temp;
    var left;
    var right;
    left = left_operand;
    right = right_operand;

    while (right != 0){
        temp = left % right;
        left = right;
        right = temp;
    }
    return left;
}