- caratteristiche
    - codice identificativo alfanumerico univoco
    - scadenza
    - non nominativo
    - sconto/omaggio
    - valido in un solo ristorante
    - non cumulabile
    - valido su tutto il tavolo


- modello_coupon
    - id (serial, primary key)
    - definizione (varchar(255), not null)
    - ristorante (fk[ristorante.id], not null)
    - durata (interval, not null)
    - attivo (boolean, default true, not null)

- coupon
    - id (uuid, autogenerato, primary key)
    - scadenza (datetime, not null)
    - emissione (datetime, not null)
    - modello (fk[coupon_model.id], not null)
    - usato (boolean, default false, not null)