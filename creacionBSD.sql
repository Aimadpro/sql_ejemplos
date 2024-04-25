create database lloguerPelicules;
use lloguerPelicules;
create table country (
	 country_id INT PRIMARY KEY auto_increment,
     country varchar(50),
     last_update date
     );
create table city (
	city_id INT PRIMARY KEY auto_increment,
    city varchar(255),
    last_update date,
    country_id int,
    constraint fk_city_country foreign key (country_id)
    references country (country_id)
    );
create table adress (
	adress_id INT PRIMARY KEY auto_increment,
    aadress varchar(255),
    district varchar(255),
    postal_code char(5),
    phone varchar(15),
    last_update date,
    city_id INT,
    constraint fk_adress_city foreign key (city_id)
    references city (city_id)
    );
create table actor (
	actor_id INT PRIMARY KEY auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    last_update date
    );
create table language (
	language_id  INT PRIMARY KEY auto_increment,
    name varchar(50),
    last_update date
    );
create table category (
	category_id INT PRIMARY KEY auto_increment,
    name varchar(50),
    last_update date
    );
create table film (
    film_id INT PRIMARY KEY auto_increment,
    title varchar(50),
    description varchar(10000),
    release_year year,
    rental_duration int,
    rental_rate decimal(3,2),
    length double,
    replacement_cost DECIMAL(4, 2),
    raiting varchar(3),
    special_features VARCHAR(255),
    last_update DATE,
	constraint fk_film_city foreign key (city_id)
    references city (city_id)
    );
    
    
    
    
    
    
    
    
    
    
    