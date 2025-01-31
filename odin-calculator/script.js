function add(val1, val2) {
    return val1 + val2;
}

function subtract(val1, val2) {
    return val1 - val2;
}

function multiply(val1, val2) {
    return val1 * val2;
}

function divide(val1, val2) {
    return val1 / val2;
}

function operate(val1, operation, val2) {
    if (operation == "+") {
        return add(val1, val2);
    } else if (operation == "-") {
        return subtract(val1, val2);
    } else if (operation == "*") {
        return multiply(val1, val2);
    } else if (operation == "/") {
        return divide(val1, val2);
    } else {
        return "INVALID COMMAND";
    }
}

let val1 = 0;
let val2 = 0;
let operation = "+";