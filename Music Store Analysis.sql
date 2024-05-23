create database Album;
use Album;


create table if not exists employee(
employee_id int primary key,
last_name varchar(50),
first_name varchar(50),
title text,
reports_to int default null,
levels varchar(10),
birth_date varchar(50),
hire_date varchar(50),
address  varchar(50),
city  varchar(50),
state  varchar(50),
country varchar(50),
postal_code varchar(15),
phone varchar(50) not null,     
fax varchar(50),
email varchar(100) not null);



ALTER TABLE employee
ADD CONSTRAINT fk_employee_employee_id
FOREIGN KEY (reports_to)
REFERENCES employee (employee_id);


desc employee;

create table if not exists customer(
customer_id int primary key,
first_name varchar(50),
last_name varchar(50),
company varchar(50),
address  varchar(50),
city  varchar(50),
state  varchar(50),
country varchar(50),
postal_code varchar(15),
phone varchar(50) not null,     
fax varchar(50),
email varchar(100) not null,
support_reo_id int not null);


desc customer;

ALTER TABLE customer
ADD CONSTRAINT fk_customer_support_reo_id
FOREIGN KEY(support_reo_id)
REFERENCES employee (employee_id);

desc customer;

create table if not exists invoice(
invoice_id int primary key,
customer_id int not null,
invoice_date datetime,
billing_address varchar(50),
billing_city varchar(50),
billing_state varchar(50),
billing_country varchar(50),
billing_postal_code varchar(50),
total int);

ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_customer_id
FOREIGN KEY(customer_id)
REFERENCES customer (customer_id);

desc invoice;

create table if not exists media_type(
media_type_id int primary key,
name varchar(50)
);
desc media_type;

create table if not exists genre(
genre_id int primary key,
name varchar(50));

desc genre;

create table if not exists playlist(
playlist_id int primary key,
name varchar(50));


desc playlist;

create table if not exists artist(
artist_id int primary key,
name varchar(50));

desc artist;

create table if not exists album(
album_id int primary key,
title text,
artist_id int not null
);

ALTER TABLE album
ADD CONSTRAINT fk_album_artist_id
FOREIGN KEY(artist_id)
REFERENCES artist (artist_id);

desc album;

create table if not exists track (
track_id int primary key,
name text,
album_id int not null,
media_type_id int not null,
genre_id int not null,
composer varchar(50),
milliseconds datetime,  
bytes int,
unit_price decimal(10,2));

ALTER TABLE track
ADD CONSTRAINT fk_track_album_id
FOREIGN KEY(album_id)
REFERENCES album (album_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_genre_id
FOREIGN KEY(genre_id)
REFERENCES genre (genre_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_media_type_id
FOREIGN KEY(media_type_id)
REFERENCES media_type (media_type_id);



desc track;

create table if not exists playlist_track(
playlist_id int primary key,
track_id int not null,
CONSTRAINT fk_playlist_track_playlist_id FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id));

ALTER TABLE playlist_track
ADD CONSTRAINT fk_playlist_track_track_id
FOREIGN KEY(track_id)
REFERENCES track (track_id);

desc playlist_track;

create table if not exists invoice_line(
invoice_line_id int not null,
invoice_id int not null,
track_id int not null,
unit_price decimal(10,2),
quantity int);

ALTER TABLE invoice_line
ADD CONSTRAINT fk_invoice_line_invoice_id
FOREIGN KEY(invoice_id)
REFERENCES invoice (invoice_id);

ALTER TABLE invoice_line
ADD CONSTRAINT fk_invoice_line_track_id
FOREIGN KEY(track_id)
REFERENCES track (track_id);


