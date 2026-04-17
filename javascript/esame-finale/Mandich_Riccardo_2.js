const prodotti = [
    { id: 101, nome: "Smartphone Pro", prezzo: 800, categoria: "elettronica", stock: 12 },
    { id: 102, nome: "Laptop Business", prezzo: 1200, categoria: "elettronica", stock: 0 },
    { id: 103, nome: "Tastiera Meccanica", prezzo: 80, categoria: "accessori", stock: 25 },
    { id: 104, nome: "Monitor 4K", prezzo: 400, categoria: "elettronica", stock: 5 },
    { id: 105, nome: "Mouse Wireless", prezzo: 50, categoria: "accessori", stock: 0 },
    { id: 106, nome: "Sedia Ufficio", prezzo: 250, categoria: "arredamento", stock: 8 }
];

const scontiPerCategoria = {
    elettronica: 20, // 20% di sconto
    accessori: 10,   // 10% di sconto
    arredamento: 0   // Nessuno sconto
};

/**
  *
  * Deve restituire solo i prodotti che hanno uno stock maggiore di zero e un prezzo superiore a 100 euro.
  *
  */
function filtraDisponibiliEPrezzo(){
    let filteredProducts = [];
    prodotti.forEach(el => {
        if(el.stock > 0 && el.prezzo > 100){
            filteredProducts.push(el);
        }
    });
    return filteredProducts;
}

/**
  *
  * Deve restituire un nuovo array di oggetti.
  * Ogni oggetto deve avere il nome del prodotto e il prezzoScontato
  * calcolato in base alla sua categoria (usando l'oggetto scontiPerCategoria).
  *
  */
function applicaSconti(){
    let scontati = [];
    prodotti.forEach((el, idx) => {
        scontati[idx] = {
            nome: el.nome,
            prezzoScontato: (el.prezzo/100) * (100-scontiPerCategoria[el.categoria])
        };
    });
    return scontati;
}

/**
  *
  * Deve trovare e restituire il primo prodotto
  * che ha uno stock inferiore a 10 (ma maggiore di zero).
  * Se non esiste, restituisce null.
  *
  */
function trovaProdottoCritico(){
    return prodotti.find(el => el.stock < 10 && el.stock > 0) ?? null;
}

/**
  *
  * Deve restituire il valore totale economico di tutto il magazzino (somma di prezzo * stock per ogni prodotto).
  *
  */
function calcolaValoreMagazzino(){
    let somma = 0;
    prodotti.forEach(el => {
        somma += el.prezzo * el.stock;
    });
    return somma;
}