create table ristorante(
	id serial primary key,
	nome varchar(150) not null,
	indirizzo varchar(150) not null,
	telefono varchar(16) not null,
	orario_apertura time not null,
	orario_chiusura time not null,
	posti_adulti int not null,
	posti_bambini int not null,
	posti_totali int not null
	-- check(posti_totali == "posti_adulti" + "posti_bambini")
);

create table dipendente(
	id serial primary key,
	nome varchar(100) not null,
	cognome varchar(100) not null,
	telefono varchar(16) not null,
	email varchar(255) not null,
	id_ristorante serial not null,
	foreign key (id_ristorante) references ristorante(id)
);

create table prenotazione(
	id serial primary key,
	nome_completo_ospite varchar(150) not null,
	telefono_ospite varchar(16) not null,
	data timestamp,
	numero_persone int not null,
	id_dipendente serial not null,
	id_ristorante serial not null,
	cancellata_alle timestamp,
	foreign key (id_dipendente) references dipendente(id),
	foreign key (id_ristorante) references ristorante(id)
);

create table modello_coupon(
	id serial primary key,
	definizione varchar(255) not null,
	id_ristorante serial not null,
	durata interval not null,
	attivo boolean default true not null,
	foreign key (id_ristorante) references ristorante(id)
);

create table coupon(
	id uuid primary key default gen_random_uuid(),
	scadenza timestamp not null,
	emissione timestamp not null DEFAULT now(),
	id_modello serial not null,
	usato boolean default false not null,
	foreign key (id_modello) references modello_coupon(id)
);