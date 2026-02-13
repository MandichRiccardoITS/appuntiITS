drop table if exists booking;
drop table if exists coupon;
drop table if exists coupon_model;
drop table if exists employee;
drop table if exists restourant;

create table restourant(
	id serial primary key,
	name varchar(150) not null,
	surname varchar(150) not null,
	address varchar(150) not null,
	number varchar(16) not null,
	opening time not null,
	closure time not null,
	adult int not null,			--posti per adulti
	people int not null			--posti totali
);

create table employee(
	id serial primary key,
	name varchar(100) not null,
	surname varchar(100) not null,
	number varchar(16) not null,
	email varchar(255) not null,
	id_restourant int not null,
	foreign key (id_restourant) references restourant(id)
);

create table coupon_model(
	id serial primary key,
	definition varchar(255) not null,
	id_restourant int not null,
	duration interval not null,
	active boolean default true not null,
	foreign key (id_restourant) references restourant(id)
);

create table coupon(
	id uuid primary key default gen_random_uuid(),
	expiring timestamp not null,
	emission timestamp not null DEFAULT now(),
	id_model int not null,
	active boolean default false not null,
	foreign key (id_model) references coupon_model(id)
);

create table booking(
	id serial primary key,
	full_name varchar(150) not null,
	phone_number varchar(16) not null,
	date timestamp,
	people_number int not null,
	id_employee int not null,
	id_restourant int not null,
	canceled_at timestamp,
	canceled_by int,
	coupon_id uuid,
	foreign key (coupon_id) references coupon(id),
	foreign key (id_employee) references employee(id),
	foreign key (id_restourant) references restourant(id)
);


insert into restourant 
(name, surname, address, number, opening, closure, adult, people) 
values
('Trattoria', 'Da Mario', 'Via Indipendenza 12, Bologna', '0511234567', '12:00', '23:00', 60, 80),
('Osteria', 'del Porto', 'Via del Porto 8, Bologna', '0512345678', '11:30', '22:30', 50, 65),
('Ristorante', 'La Pergola', 'Via Saragozza 45, Bologna', '0513456789', '12:30', '23:30', 70, 95),
('Pizzeria', 'Bella Napoli', 'Via Massarenti 101, Bologna', '0514567890', '11:00', '23:59', 80, 110),
('Bistrot', 'Centrale', 'Piazza Maggiore 3, Bologna', '0515678901', '07:00', '20:00', 40, 50);

insert into employee 
(name, surname, number, email, id_restourant) 
values
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

insert into booking 
(full_name, phone_number, date, people_number, id_employee, id_restourant, canceled_at) 
values
('Mario Verdi','3402000001','2026-02-10 20:00',2,1,1,null),
('Lucia Neri','3402000002','2026-02-10 21:00',4,2,1,null),
('Paolo Gatti','3402000003','2026-02-11 19:30',3,3,1,null),
('Anna Fabbri','3402000004','2026-02-12 20:30',5,4,1,'2026-02-12 18:00'),
('Carlo Riva','3402000005','2026-02-13 21:00',2,5,1,null);

insert into coupon_model 
(definition, id_restourant, duration, active) 
values
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

insert into coupon 
(expiring, emission, id_model, active) 
values
(now() + interval '10 days', now() - interval '5 days',1,false),
(now() + interval '20 days', now() - interval '10 days',1,true),
(now() - interval '5 days', now() - interval '40 days',2,false),
(now() + interval '15 days', now() - interval '5 days',2,false);


-- todo