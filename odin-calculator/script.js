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
    if (operation === "+") {
        return add(val1, val2);
    } else if (operation === "-") {
        return subtract(val1, val2);
    } else if (operation === "*") {
        return multiply(val1, val2);
    } else if (operation === "/") {
        return divide(val1, val2);
    }
}

let index = 0;
let vals = ["", "", ""]

const result = document.querySelector(".result_screen");
const numbers = document.querySelectorAll(".number_button");
numbers.forEach(button => {
    button.addEventListener("click", function() {
        vals[index] += this.innerText;
        result.innerText = vals[index];
        console.log(vals);
    });
});

const clear = document.querySelector(".clear");
clear.addEventListener("click", function() {
    vals[index] = "";
    result.innerText = vals[index];
    console.log(vals);
});

const operators = document.querySelectorAll(".operator");
operators.forEach(button => {
    button.addEventListener("click", function () {
        if (index === 1 || (index + 1) > 2) {
            result.innerText = "INVALID";
        } else {
            index += 1;
            vals[index] = this.innerText;
            result.innerText = vals[index];
            index += 1;
        }
        console.log(vals);
    })
});

const equals = document.querySelector(".equals_button");
equals.addEventListener("click", function () {
    if (index != 2) {
        result.innerText = "INVALID";
    } else {
        if (vals[1] == "+") {
            result.innerText = operate(parseInt(vals[0]), "+", parseInt(vals[2]));
        } else if (vals[1] == "-") {
            result.innerText = operate(parseInt(vals[0]), "-", parseInt(vals[2]));
        } else if (vals[1] == "*") {
            result.innerText = operate(parseInt(vals[0]), "*", parseInt(vals[2]));
        } else if (vals[1] == "/") {
            result.innerText = operate(parseInt(vals[0]), "/", parseInt(vals[2]));
        }
        index = 0;
        vals = ["", "", ""];
    }
    console.log(vals);
});