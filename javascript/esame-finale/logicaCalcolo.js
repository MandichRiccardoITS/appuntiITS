function calcolaPrezzoFinale(prezzoLordo, categoria) {
    let sconto = 0;
    switch(categoria){
        case "STUDENTE":
            sconto = 20;
            break;
        case "PENSIONATO":
            sconto = 30;
            break;
        case "DOCENTE":
            sconto = 10;
            break;
    }

    return (prezzoLordo/100)*(100-sconto);
}