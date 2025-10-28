const container = document.querySelector(".container");

let width = 3120 / 16;
let height = 3120 / 16;

for (let i = 0; i < 16; i++) {
    for (let j = 0; j < 16; j++) {
        const div = document.createElement("div");
        if (width && height) {
            div.style.width = `${width}px`;
            div.style.height = `${height}px`;
        }
        container.appendChild(div);
    }
}

const button = document.querySelector(".button");
button.addEventListener("click", function() {
    let ans = parseInt(prompt("How many squares wide would you like your grid to be?"));
    container.innerHTML = '';

    width = 3120 / ans;
    height = 3120 / ans;

    for (let i = 0; i < ans; i++) {
        for (let j = 0; j < ans; j++) {
            const div = document.createElement("div");
            if (width && height) {
                div.style.width = `${width}px`;
                div.style.height = `${height}px`;
            }
            container.appendChild(div);
        }
    }
});

