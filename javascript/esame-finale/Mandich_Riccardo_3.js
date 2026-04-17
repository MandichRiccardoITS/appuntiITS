const invitati = [];

function render(){
    let list = document.querySelector("#guest-list");
    list.innerHTML = "";
    invitati.forEach(el => {
        list.innerHTML += `<li ${el.presente ? "style='color: darkgreen'" : ""}><span>${el.nome}</span> <button>Arrivato</button> <button>Rimuovi</button>`;
    });
}

document.querySelector("#guest-list").addEventListener("click", (e) => {
    if(e.target.tagName === "BUTTON"){
        let nome = e.target.parentElement.querySelector("span").textContent.trim();
        let index = invitati.findIndex(el => el.nome === nome);
        if(e.target.textContent === "Arrivato"){
            console.log(invitati[index]);
            invitati[index].presente = true;
        }else if(e.target.textContent === "Rimuovi"){
            invitati.splice(index, 1);
        }
    }
    render();
});

document.querySelector("#add-guest-btn").addEventListener("click", () => {
    let nome = document.querySelector("#guest-input").value.trim();
    if(nome !== ""){
        invitati.push({
            nome: nome,
            presente: false
        });
        document.querySelector("#guest-input").value = "";
    }else{
        alert("Inserisci un nome valido");
    }
    render();
});