function isEven(value) {
    if (value % 2 === 0) {
        return true;
    }
}

function sumOfTripledEvens(array) {
    array = array.filter(isEven);
    array = array.map((num) => num * 3);
    let total = array.reduce((total, currentItem) =>{
        total = total + currentItem;
    }, 0);
    return total;
}

let arr = [1, 2, 3, 4, 5];
console.log(sumOfTripledEvens(arr));