var currentPlayer = "X";
var turn = 0;
var winner = null;
refreshDashboard();

document.querySelectorAll("td").forEach((td, index) => {
    td.addEventListener("click", () => {
        if(td.innerText === ""){
            if(currentPlayer === "X"){
                td.innerText = "X";
                td.classList.add("x");
                currentPlayer = "O";
            }else{
                td.innerText = "O";
                td.classList.add("o");
                currentPlayer = "X";
            }
        }else{
            alert("Non è possibile riassegnare il valore di una casella");
        }
        console.log(index);
        console.log(Math.trunc(index/3), index%3);
        checkWin();
        turn++;
        if(turn === 9 && winner === null){
            alert("Pareggio!");
        }
        refreshDashboard();
    });
});

function checkWin(){
    checkWinOfPlayer("X");
    checkWinOfPlayer("O");
}

function checkWinOfPlayer(player){
    if(
        check(0, 0, player) && check(0, 1, player) && check(0, 2, player) ||
        check(1, 0, player) && check(1, 1, player) && check(1, 2, player) ||
        check(2, 0, player) && check(2, 1, player) && check(2, 2, player) ||
        check(0, 0, player) && check(1, 0, player) && check(2, 0, player) ||
        check(0, 1, player) && check(1, 1, player) && check(2, 1, player) ||
        check(0, 2, player) && check(1, 2, player) && check(2, 2, player) ||
        check(0, 0, player) && check(1, 1, player) && check(2, 2, player) ||
        check(0, 2, player) && check(1, 1, player) && check(2, 0, player)
    ){
        alert(player + " ha vinto!");
        winner = player;
    }
    if(check(0, 0, player) && check(0, 1, player) && check(0, 2, player)){
        getCell(0, 0).classList.add("win");
        getCell(0, 1).classList.add("win");
        getCell(0, 2).classList.add("win");
    }
    if(check(1, 0, player) && check(1, 1, player) && check(1, 2, player)){
        getCell(1, 0).classList.add("win");
        getCell(1, 1).classList.add("win");
        getCell(1, 2).classList.add("win");
    }
    if(check(2, 0, player) && check(2, 1, player) && check(2, 2, player)){
        getCell(2, 0).classList.add("win");
        getCell(2, 1).classList.add("win");
        getCell(2, 2).classList.add("win");
    }
    if(check(0, 0, player) && check(1, 0, player) && check(2, 0, player)){
        getCell(0, 0).classList.add("win");
        getCell(1, 0).classList.add("win");
        getCell(2, 0).classList.add("win");
    }
    if(check(0, 1, player) && check(1, 1, player) && check(2, 1, player)){
        getCell(0, 1).classList.add("win");
        getCell(1, 1).classList.add("win");
        getCell(2, 1).classList.add("win");
    }
    if(check(0, 2, player) && check(1, 2, player) && check(2, 2, player)){
        getCell(0, 2).classList.add("win");
        getCell(1, 2).classList.add("win");
        getCell(2, 2).classList.add("win");
    }
    if(check(0, 0, player) && check(1, 1, player) && check(2, 2, player)){
        getCell(0, 0).classList.add("win");
        getCell(1, 1).classList.add("win");
        getCell(2, 2).classList.add("win");
    }
    if(check(0, 2, player) && check(1, 1, player) && check(2, 0, player)){
        getCell(0, 2).classList.add("win");
        getCell(1, 1).classList.add("win");
        getCell(2, 0).classList.add("win");
    }
}

function check(row, col, player){
    console.log(row, col, row*3 + col);
    return document.querySelectorAll("td")[row*3 + col].innerText === player;
}

function getCell(row, col){
    return document.querySelectorAll("td")[row*3 + col];
}

function refreshCurrentPlayer(){
    document.querySelector("h1#current-player").innerText = "Giocatore corrente: " + currentPlayer;
}

function refreshCurrentTurn(){
    document.querySelector("h1#current-turn").innerText = "Turno: " + turn;
}

function refreshDashboard(){
    refreshCurrentPlayer();
    refreshCurrentTurn();
}