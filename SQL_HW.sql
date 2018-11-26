-- 1_a
use sakila;
CREATE VIEW 1_a
as
SELECT first_name, last_name
FROM actor;
-- 1_b
use sakila;
CREATE VIEW 1_b
as
SELECT CONCAT (first_name , ' ' , last_name) AS actor_name
FROM actor;
-- 2_a
use sakila;
CREATE VIEW 2_a
AS
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name LIKE 'joe%';
-- 2_b
use sakila;
CREATE VIEW 2_b
AS
SELECT * FROM actor
WHERE last_name LIKE '%gen%';
-- 2_c
use sakila;
CREATE VIEW 2_c
AS
SELECT last_name, first_name FROM actor
WHERE last_name LIKE '%li%';
-- 2_d
use sakila;
CREATE VIEW 2_d
AS
SELECT country_id, country FROM country
WHERE country IN ('afghanistan', 'bangladesh', 'china');
-- 3_a
use sakila;
ALTER TABLE actor
ADD description blob(100);
-- 3_b
use sakila;
ALTER TABLE actor
DROP COLUMN description;
-- 4_a
use sakila;
SELECT last_name, count(last_name) AS
'last_name_count'
FROM actor
GROUP BY last_name;
-- 4_b
use sakila;
SELECT last_name, count(last_name) AS
'last_name_count'
FROM actor
GROUP BY last_name
Having 'last_name_frequency' >= 2;
-- 4_c
use sakila;
UPDATE actor
SET first_name='HARPO'
WHERE first_name='GROUCHO' AND last_name='WILLIAMS';
-- 4_d
use sakila;
UPDATE actor
SET first_name='GROUCHO'
WHERE first_name='HARPO' AND last_name='WILLIAMS';
-- 5_a
use sakila;
SELECT*FROM address;
-- 6_a
use sakila;
CREATE VIEW 6_a
AS
select first_name, last_name, address 
from staff s
inner join address a on s.address_id = a.address_id;
-- 6_b
use sakila;
CREATE VIEW 6_b
AS
select s.staff_id,s.first_name, s.last_name, sum(p.amount) as Total_Amount
from payment p
inner join staff s on p.staff_id = s.staff_id
WHERE MONTH(p.payment_date) = 08 AND YEAR(p.payment_date) = 2005
group by staff_id;
-- 6_c
use sakila;
CREATE VIEW 6_c
AS
select s.film_id,s.title, COUNT(p.film_id) as number_of_actors
from film s
inner join film_actor p on s.film_id = p.film_id
group by film_id;
-- 6_d
use sakila;
CREATE VIEW 6_d
AS
select s.film_id,s.title, COUNT(p.film_id) as number_of_copies
from film s
inner join inventory p on s.film_id = p.film_id
WHERE title='Hunchback Impossible';
-- 6_e
use sakila;
CREATE VIEW 6_e
AS
select  s.last_name, s.first_name, p.customer_id, sum(p.amount) as total_amount_per_customer
from customer s
inner join payment p on s.customer_id = p.customer_id
group by last_name ASC;
-- 7_a
use sakila;
CREATE VIEW 7_a
AS
select  s.title, p.language_id, p.name
from film s
inner join language p on s.language_id = p.language_id
WHERE s.title LIKE 'K%' or 'Q%' AND p.name='english';
-- 7_b
use sakila;
CREATE VIEW 7_b
AS
select  s.film_id, s.title, p.actor_id, q.first_name, q.last_name
from film s
inner join film_actor p on s.film_id = p.film_id inner join actor q on p.actor_id = q.actor_id
WHERE s.title='Alone Trip';
-- 7_c
use sakila;
CREATE VIEW 7_c
AS
select  s.first_name, s.last_name, s.email, r.country
from customer s
inner join address p on s.address_id = p.address_id inner join city q on p.city_id = q.city_id inner join country r on q.country_id = r.country_id
WHERE r.country='Canada';
-- 7_d
use sakila;
CREATE VIEW 7_d
AS
select  s.film_id, s.title, q.name as category
from film s
inner join film_category p on s.film_id = p.film_id inner join category q on p.category_id = q.category_id
WHERE q.name='Family';
-- 7_e
use sakila;
CREATE VIEW 7_e
AS
select f.title , count(r.rental_id) as Count_rentals from film f
inner join inventory inv on f.film_id = inv.film_id inner join rental r on inv.inventory_id = r.inventory_id
group by f.title
order by count(r.rental_id) desc;
-- 7_f
use sakila;
CREATE VIEW 7_f
AS
SELECT s.store_id, SUM(amount) AS Gross
FROM payment p
JOIN rental r
ON p.rental_id = r.rental_id
JOIN inventory i
ON  i.inventory_id = r.inventory_id
JOIN store s
ON s.store_id = i.store_id
GROUP BY s.store_id;
-- 7_g
use sakila;
CREATE VIEW 7_g
AS
select s.store_id, c.city, ct.country
from store s
inner join address a on a.address_id = s.address_id
inner join city c on a.city_id = c.city_id
inner join country ct on c.country_id = ct.country_id;
use sakila;
-- 7_h
CREATE VIEW 7_h
AS
SELECT d.category_id, e.name, SUM(a.amount) AS Gross
FROM payment a
JOIN rental b
ON a.rental_id = b.rental_id
JOIN inventory c
ON  c.inventory_id = b.inventory_id
JOIN film_category d
ON  c.film_id = d.film_id
JOIN category e
ON d.category_id = e.category_id
GROUP BY category_id DESC;
-- 8_a
CREATE VIEW 8_a
AS
SELECT d.category_id, e.name, SUM(a.amount) AS Gross
FROM payment a
JOIN rental b
ON a.rental_id = b.rental_id
JOIN inventory c
ON  c.inventory_id = b.inventory_id
JOIN film_category d
ON  c.film_id = d.film_id
JOIN category e
ON d.category_id = e.category_id
GROUP BY category_id DESC;
-- 8_b
SELECT * FROM 8_a;
-- 8_c
DROP VIEW 8_a;













