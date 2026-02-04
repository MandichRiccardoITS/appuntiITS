- caratteristiche
    - codice identificativo alfanumerico univoco
    - scadenza
    - non nominativo
    - sconto/omaggio
    - valido in un solo ristorante
    - non cumulabile
    - valido su tutto il tavolo


- coupon
    - id (uuid, autogenerato, primary key)
    - scadenza (datetime, not null)
    - tipo (fk[coupon_model.id], not null)
    - usato (boolean, default false, not null)

- coupon_model
    - id (serial, primary key)
    - definizione (varchar(255), not null)
    - ristorante (fk[ristorante.id], not null)