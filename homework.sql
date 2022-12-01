-- 1. How many actors are there with the last name ‘Wahlberg’? 
-- (2) people with the last name Wahlberg.
SELECT last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99? 
-- 4803 payments.
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory table)
-- There are 72 films with 8 copies each. 
SELECT film_id, COUNT(inventory_id)
FROM inventory
GROUP BY film_id
ORDER BY Count(inventory_id)DESC
LIMIT 72;


-- 4. How many customers have the last name ‘William’?
-- 0 however there is one customer with the last name Williams.
SELECT last_name
FROM customer
WHERE last_name LIKE 'William';

-- 5. What store employee (get the id) sold the most rentals? 
-- Mike Hilyer Staff Id 1 8040.
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id;

-- 6. How many different distinct names are there?
-- 591 distinct first names and 599 dinstinct last names. 
SELECT COUNT(DISTINCT first_name)
FROM customer;

SELECT COUNT(DISTINCT last_name)
FROM customer;

-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
-- Film ID 508  Lambs Cincinatti has the most actors in it.  
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT (actor_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--  (13) customers from store_id 1. (21) customers have the last name ending in es. 
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%_es' AND store_id =1;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 3 total accounts. 

SELECT amount
from payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT (rental_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
-- (5) ratings total. PG-13 has the most with 223 movies total. 
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;
