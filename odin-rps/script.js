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

function getHumanChoice() {
    return String(prompt("Please choose rock, paper, or scissors. Enter quit to stop playing."));
}

let humanScore = 0;
let computerScore = 0;

function playRound() {
    let computer = getComputerChoice();
    let human = getHumanChoice();
    if (human.toLowerCase() == "quit") {
        return "stop";
    }

    if (human.toLowerCase() == computer) {
        console.log("Tie!");
    } else if (human.toLowerCase() == "rock" && computer == "scissors") {
        console.log("You Win! The computer chose scissors, you chose rock");
        humanScore += 1;
    } else if (human.toLowerCase() == "rock" && computer == "paper") {
        console.log("You Lose! The computer chose paper, you chose rock");
        computerScore += 1;
    } else if (human.toLowerCase() == "scissors" && computer == "rock") {
        console.log("You Lose! The computer chose rock, you chose scissors");
        computerScore += 1;
    } else if (human.toLowerCase() == "scissors" && computer == "paper") {
        console.log("You Win! The computer chose paper, you chose rock");
        humanScore += 1;
    } else if (human.toLowerCase() == "paper" && computer == "scissors") {
        console.log("You Lose! The computer chose scissors, you chose paper");
        computerScore += 1;
    } else if (human.toLowerCase() == "paper" && computer == "rock") {
        console.log("You Win! The computer chose rock, you chose paper");
        humanScore += 1;
    } 
}

while (true) {
    if (playRound() == "stop") {
        break;
    }
    console.log("Human Score: " + humanScore);
    console.log("Computer Score: " + computerScore);
}