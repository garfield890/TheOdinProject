const container = document.querySelector(".container");

const paragraph = document.createElement("p");
paragraph.textContent = "Hey I'm red!";
paragraph.style.color = "red";

const header = document.createElement("h3");
header.textContent = "I'm a blue h3";
header.style.color = "blue";

container.appendChild(paragraph);
container.appendChild(header);

const smallDiv = document.createElement("div");
smallDiv.style.backgroundColor = "pink";
smallDiv.style.border = "2px solid black";

container.appendChild(smallDiv);

const header2 = document.createElement("h1");
header2.textContent = "I'm in a div!";

smallDiv.appendChild(header2);

const p2 = document.createElement("p");
p2.textContent = "Me too!";

smallDiv.appendChild(p2);

const btn = document.querySelector("#btn");
btn.addEventListener("click", () => {
  alert("Hello World");
});

btn.addEventListener("click", function (e) {
    console.log(e.target);
    e.target.style.background = "lightblue";
  });

const buttons = document.querySelectorAll("button");
buttons.forEach((button) => {
    button.addEventListener("click", () => {
      alert(button.id);
    });
  });