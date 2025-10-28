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
    });
});

const deleteButton  = document.querySelector(".delete");
deleteButton.addEventListener("click", function() {
    if (vals[index].length > 0) {
        vals[index] = vals[index].slice(0, -1);
    }
    result.innerText = vals[index];
});

const clear = document.querySelector(".clear");
clear.addEventListener("click", function() {
    vals = ["", "", ""];
    result.innerText = "";
    index = 0;
});

const operators = document.querySelectorAll(".operator");
operators.forEach(button => {
    button.addEventListener("click", function () {
        if (index === 2 && vals[2] === "") {
            result.innerText = "INVALID";
        } else if (index === 2) {
            let tempVal = operate(parseInt(vals[0]), vals[1], parseInt(vals[2]));
            result.innerText = tempVal;
            vals = ["", "", ""];
            vals[0] = tempVal.toString();
            vals[1] = this.innerText;
        } else {
            index += 1;
            vals[index] = this.innerText;
            result.innerText = vals[index];
            index += 1;
        }
    })
});

const equals = document.querySelector(".equals_button");
equals.addEventListener("click", function () {
    if (vals[2] === "") {
        result.innerText = "INVALID";
    } else if (vals[2] == "0" && vals[1] == "/") {
        result.innerText = "you fool";
        vals = ["", "", ""];
        index = 0;
    } else {
        result.innerText = operate(parseInt(vals[0]), vals[1], parseInt(vals[2]));
        index = 0;
        vals = ["", "", ""];
    }
});