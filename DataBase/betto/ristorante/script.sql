drop table coupon;
drop table modello_coupon;
drop table prenotazione;
drop table dipendente;
drop table ristorante;

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
);

create table dipendente(
	id serial primary key,
	nome varchar(100) not null,
	cognome varchar(100) not null,
	telefono varchar(16) not null,
	email varchar(255) not null,
	id_ristorante int not null,
	foreign key (id_ristorante) references ristorante(id)
);

create table prenotazione(
	id serial primary key,
	nome_completo_ospite varchar(150) not null,
	telefono_ospite varchar(16) not null,
	data timestamp,
	numero_persone int not null,
	id_dipendente int not null,
	id_ristorante int not null,
	cancellata_alle timestamp,
	foreign key (id_dipendente) references dipendente(id),
	foreign key (id_ristorante) references ristorante(id)
);

create table modello_coupon(
	id serial primary key,
	definizione varchar(255) not null,
	id_ristorante int not null,
	durata interval not null,
	attivo boolean default true not null,
	foreign key (id_ristorante) references ristorante(id)
);

create table coupon(
	id uuid primary key default gen_random_uuid(),
	scadenza timestamp not null,
	emissione timestamp not null DEFAULT now(),
	id_modello int not null,
	usato boolean default false not null,
	foreign key (id_modello) references modello_coupon(id)
);


insert into ristorante (nome, indirizzo, telefono, orario_apertura, orario_chiusura, posti_adulti, posti_bambini, posti_totali) values
('Trattoria Da Mario', 'Via Indipendenza 12, Bologna', '0511234567', '12:00', '23:00', 60, 20, 80),
('Osteria del Porto', 'Via del Porto 8, Bologna', '0512345678', '11:30', '22:30', 50, 15, 65),
('Ristorante La Pergola', 'Via Saragozza 45, Bologna', '0513456789', '12:30', '23:30', 70, 25, 95),
('Pizzeria Bella Napoli', 'Via Massarenti 101, Bologna', '0514567890', '11:00', '23:59', 80, 30, 110),
('Bistrot Centrale', 'Piazza Maggiore 3, Bologna', '0515678901', '07:00', '20:00', 40, 10, 50);


insert into dipendente (nome, cognome, telefono, email, id_ristorante) values
('Luca','Rossi','3331000001','l.rossi@rist1.it',1),
('Marco','Bianchi','3331000002','m.bianchi@rist1.it',1),
('Giulia','Ferrari','3331000003','g.ferrari@rist1.it',1),
('Anna','Romano','3331000004','a.romano@rist1.it',1),
('Paolo','Gallo','3331000005','p.gallo@rist1.it',1),
('Sara','Costa','3331000006','s.costa@rist2.it',2),
('Davide','Fontana','3331000007','d.fontana@rist2.it',2),
('Elena','Moretti','3331000008','e.moretti@rist2.it',2),
('Simone','Greco','3331000009','s.greco@rist2.it',2),
('Francesca','Marino','3331000010','f.marino@rist2.it',2),
('Andrea','Rinaldi','3331000011','a.rinaldi@rist3.it',3),
('Valentina','Barbieri','3331000012','v.barbieri@rist3.it',3),
('Matteo','Lombardi','3331000013','m.lombardi@rist3.it',3),
('Chiara','Testa','3331000014','c.testa@rist3.it',3),
('Stefano','Caruso','3331000015','s.caruso@rist3.it',3),
('Giorgio','Conti','3331000016','g.conti@rist4.it',4),
('Martina','De Luca','3331000017','m.deluca@rist4.it',4),
('Alessio','Pellegrini','3331000018','a.pellegrini@rist4.it',4),
('Irene','Villa','3331000019','i.villa@rist4.it',4),
('Fabio','Ferri','3331000020','f.ferri@rist4.it',4),
('Laura','Serra','3331000021','l.serra@rist5.it',5),
('Roberto','Martini','3331000022','r.martini@rist5.it',5),
('Silvia','Leone','3331000023','s.leone@rist5.it',5),
('Nicola','Parisi','3331000024','n.parisi@rist5.it',5),
('Elisa','Grassi','3331000025','e.grassi@rist5.it',5);

insert into prenotazione (nome_completo_ospite, telefono_ospite, data, numero_persone, id_dipendente, id_ristorante, cancellata_alle) values
('Mario Verdi','3402000001','2026-02-10 20:00',2,1,1,null),
('Lucia Neri','3402000002','2026-02-10 21:00',4,2,1,null),
('Paolo Gatti','3402000003','2026-02-11 19:30',3,3,1,null),
('Anna Fabbri','3402000004','2026-02-12 20:30',5,4,1,'2026-02-12 18:00'),
('Carlo Riva','3402000005','2026-02-13 21:00',2,5,1,null),
('Giorgia Sala','3402000006','2026-02-10 20:00',2,6,2,null),
('Davide Pini','3402000007','2026-02-11 20:30',6,7,2,null),
('Elisa Monti','3402000008','2026-02-12 19:00',4,8,2,null),
('Fabio Gori','3402000009','2026-02-13 21:30',3,9,2,null),
('Luca Rizzi','3402000010','2026-02-14 20:00',5,10,2,'2026-02-14 17:00'),
('Andrea Villa','3402000011','2026-02-15 20:00',2,11,3,null),
('Silvia Testi','3402000012','2026-02-16 21:00',4,12,3,null),
('Matteo Lodi','3402000013','2026-02-17 20:30',6,13,3,null),
('Chiara Nanni','3402000014','2026-02-18 19:30',3,14,3,null),
('Stefano Poli','3402000015','2026-02-19 21:15',5,15,3,null),
('Giorgio Berti','3402000016','2026-02-20 20:00',2,16,4,null),
('Martina Fanti','3402000017','2026-02-21 21:00',4,17,4,null),
('Alessio Rosi','3402000018','2026-02-22 20:30',3,18,4,null),
('Irene Gatti','3402000019','2026-02-23 19:30',5,19,4,null),
('Fabio Grandi','3402000020','2026-02-24 21:00',6,20,4,'2026-02-24 18:30'),
('Laura Valli','3402000021','2026-02-10 13:00',2,21,5,null),
('Roberto Fini','3402000022','2026-02-11 13:30',3,22,5,null),
('Silvia Dini','3402000023','2026-02-12 14:00',4,23,5,null),
('Nicola Donati','3402000024','2026-02-13 12:30',2,24,5,null),
('Elisa Orsi','3402000025','2026-02-14 13:15',5,25,5,null),
('Marco Galli','3402000026','2026-03-01 20:00',4,1,1,null),
('Anna Ricci','3402000027','2026-03-02 21:00',2,7,2,null),
('Paolo Conti','3402000028','2026-03-03 20:30',3,12,3,null),
('Giulia Serra','3402000029','2026-03-04 19:45',6,18,4,null),
('Luca Greco','3402000030','2026-03-05 13:00',2,23,5,null);


insert into modello_coupon (definizione, id_ristorante, durata, attivo) values
('Sconto 10% pranzo',1,'30 days',true),
('Cena romantica -15%',1,'60 days',true),
('Menu degustazione -20%',2,'45 days',true),
('Promo weekend -10%',2,'30 days',true),
('Sconto famiglia -15%',3,'60 days',true),
('Pranzo business -10%',3,'30 days',true),
('Pizza + bibita -20%',4,'20 days',true),
('Promo studenti -15%',4,'25 days',false),
('Colazione -10%',5,'15 days',true),
('Brunch domenica -20%',5,'40 days',true);


insert into coupon (scadenza, emissione, id_modello, usato) values
(now() + interval '10 days', now() - interval '5 days',1,false),
(now() + interval '20 days', now() - interval '10 days',1,true),
(now() - interval '5 days', now() - interval '40 days',2,false),
(now() + interval '15 days', now() - interval '5 days',2,false),
(now() + interval '30 days', now() - interval '10 days',3,false),
(now() - interval '2 days', now() - interval '50 days',3,false),
(now() + interval '25 days', now() - interval '5 days',4,true),
(now() + interval '5 days', now() - interval '2 days',4,false),
(now() + interval '40 days', now() - interval '10 days',5,false),
(now() - interval '1 days', now() - interval '70 days',5,true),
(now() + interval '20 days', now() - interval '5 days',6,false),
(now() + interval '10 days', now() - interval '3 days',6,false),
(now() + interval '8 days', now() - interval '2 days',7,false),
(now() - interval '3 days', now() - interval '30 days',7,true),
(now() + interval '12 days', now() - interval '4 days',8,false),
(now() + interval '5 days', now() - interval '1 day',9,false),
(now() - interval '2 days', now() - interval '20 days',9,false),
(now() + interval '18 days', now() - interval '3 days',10,true),
(now() + interval '22 days', now() - interval '2 days',10,false),
(now() + interval '7 days', now() - interval '1 day',1,false),
(now() + interval '9 days', now() - interval '2 days',2,false),
(now() + interval '11 days', now() - interval '3 days',3,false),
(now() + interval '13 days', now() - interval '4 days',4,false),
(now() + interval '14 days', now() - interval '5 days',5,false),
(now() + interval '16 days', now() - interval '6 days',6,false),
(now() + interval '17 days', now() - interval '7 days',7,false),
(now() + interval '19 days', now() - interval '8 days',8,false),
(now() + interval '21 days', now() - interval '9 days',9,false),
(now() + interval '23 days', now() - interval '10 days',10,false),
(now() + interval '24 days', now() - interval '11 days',1,true);
