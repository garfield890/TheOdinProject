console.log("Hello, World!");

let name = "John";
let surname = "Smith";

console.log(name);
console.log(surname)

let age = 11;
console.log(age);

age = 54;
console.log(age);

function favoriteAnimal(animal) {
    return "My favorite animal is " + animal;
}

console.log(favoriteAnimal('Goat'));

function add7(num) {
    return num + 7;
}

let answer = parseInt(prompt("Please enter the number you want to use. "));
for (let i = 1; i <= answer; i++) {
    if (i % 3 === 0 && i % 5 !== 0) {
        console.log("Fizz");
    } else if (i % 5 === 0 && i % 3 !== 0) {
        console.log("Buzz");
    } else if (i % 5 === 0 && i % 3 === 0) {
        console.log("FizzBuzz");
    } else {
        console.log(i);
    }
}
