use videoclub;

 -- 1
select film.title, count(*) as actors
from actor
inner join film_actor on film_actor.actor_id = actor.actor_id
inner join film on film.film_id = film_actor.film_id
group by film.title;
use lloguerpelicules;

-- 2
SELECT FILM.title, COUNT(FILM_ACTOR.actor_id) AS num_actors
FROM FILM
JOIN FILM_ACTOR ON FILM.film_id = FILM_ACTOR.film_id
GROUP BY FILM.title;
-- 3
select actor.first_name, actor.last_name, count(film.film_id) as 'num_films'
from actor
inner join film_actor on film_actor.actor_id = actor.actor_id
inner join film on film.film_id = film_actor.film_id
group by actor.first_name, actor.last_name
order by num_films desc;
-- 4
SELECT CUSTOMER.last_name, CUSTOMER.first_name, MAX(RENTAL.rental_date) AS max_rental_days
FROM CUSTOMER
JOIN RENTAL ON CUSTOMER.customer_id = RENTAL.customer_id
JOIN INVENTORY ON RENTAL.inventory_id = INVENTORY.inventory_id
JOIN FILM ON INVENTORY.film_id = FILM.film_id
GROUP BY CUSTOMER.last_name, CUSTOMER.first_name
ORDER BY CUSTOMER.last_name, CUSTOMER.first_name;
-- 5
use lloguerpelicules;
select country.country, avg(payment.amount) as mitjana_pagos
from country
inner join city on country.country_id = city.country_id
inner join address on address.city_id = city.city_id
inner join customer on customer.address_id = address.address_id
inner join payment on payment.customer_id =payment.customer_id
group by country.country
order by country.country asc;
-- 6
SELECT f.film_id, f.title, SUM(payment.amount) AS total_rental_income
FROM FILM f
INNER JOIN INVENTORY inventory ON f.film_id = inventory.film_id
INNER JOIN RENTAL rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN PAYMENT payment ON rental.rental_id = payment.rental_id
GROUP BY f.film_id, f.title
ORDER BY total_rental_income DESC;
