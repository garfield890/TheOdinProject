function getComputerChoice() {
    let randomVal = Math.random();
    if (randomVal < (1/3)) {
        return "rock";
    } else if (randomVal < (2/3)) {
        return "scissors";
    } else {
        return "paper"
    }
}

let humanScore = 0;
let computerScore = 0;

const div = document.createElement("div");
div.textContent = "Please make a choice!";
const container = document.querySelector(".container");

container.appendChild(div);

function playRound(human) {
    let computer = getComputerChoice();

    if (human.toLowerCase() == computer) {
        div.textContent = "Tie! The score is Computer: " + computerScore + " vs Human: " + humanScore + "!";
    } else if (human.toLowerCase() == "rock" && computer == "scissors") {
        humanScore += 1;
        div.textContent = "You Win! The score is Computer: " + computerScore + " vs Human: " + humanScore + "!";
    } else if (human.toLowerCase() == "rock" && computer == "paper") {
        computerScore += 1;
        div.textContent = "You Lose! The score is Computer: " + computerScore + " vs Human: " + humanScore + "!";
    } else if (human.toLowerCase() == "scissors" && computer == "rock") {
        computerScore += 1;
        div.textContent = "You Lose! The score is Computer: " + computerScore + " vs Human: " + humanScore + "!";
    } else if (human.toLowerCase() == "scissors" && computer == "paper") {
        humanScore += 1;
        div.textContent = "You Win! The score is Computer: " + computerScore + " vs Human: " + humanScore + "!";
    } else if (human.toLowerCase() == "paper" && computer == "scissors") {
        computerScore += 1;
        div.textContent = "You Lose! The score is Computer: " + computerScore + " vs Human: " + humanScore + "!";
    } else if (human.toLowerCase() == "paper" && computer == "rock") {
        humanScore += 1;
        div.textContent = "You Win! The score is Computer: " + computerScore + " vs Human: " + humanScore + "!";
    } 
}

const rockBtn = document.querySelector("#rock");
const scissorsBtn = document.querySelector("#scissors");
const paperBtn = document.querySelector("#paper");

rockBtn.addEventListener("click", () =>{
    playRound("rock");
    if (humanScore === 5) {
        div.textContent += " Human wins overall!!!"
    } else if (computerScore === 5) {
        div.textContent += " Computer wins overall!!!"
    }
});

scissorsBtn.addEventListener("click", () =>{
    playRound("scissors");
    if (humanScore === 5) {
        div.textContent += " Human wins overall!!!"
    } else if (computerScore === 5) {
        div.textContent += " Computer wins overall!!!"
    }
});

paperBtn.addEventListener("click", () =>{
    playRound("paper");
    if (humanScore === 5) {
        div.textContent += " Human wins overall!!!"
    } else if (computerScore === 5) {
        div.textContent += " Computer wins overall!!!"
    }
});