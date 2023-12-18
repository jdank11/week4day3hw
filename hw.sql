-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT * 
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district LIKE 'Texas'

5 customers live in Texas

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name

SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT first_name, last_name, amount
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 175

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT first_name, last_name, city
FROM (
    SELECT first_name, last_name, city
    FROM city
    INNER JOIN address
    ON address.city_id = city.city_id
    INNER JOIN customer
    ON address.address_id = customer.address_id
) AS multi_join
WHERE city = 'Nepal'



-- 5. Which staff member had the most
-- transactions?

SELECT *
FROM (
    SELECT *
    FROM staff
    INNER JOIN rental
    ON staff.staff_id = rental.staff_id
    INNER JOIN payment
    ON rental.rental_id = payment.rental_id
) AS multi_join



-- 6. How many movies of each rating are
-- there?

SELECT COUNT(rating), rating
from film
GROUP BY rating


-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT *
FROM (
    SELECT first_name, last_name, amount
    FROM customer
    INNER JOIN payment
    ON customer.customer_id = payment.customer_id
) AS multi_join
WHERE amount > 6.99

ALVIN DELOACH, ALFREDO MCADAMS, HAROLD MARTINO, DOULGAS GRAD, IDA ANDREWS
-- 8. How many free rentals did our stores give away?

SELECT count(amount)
FROM (
    SELECT amount
    FROM payment
    INNER JOIN customer
    ON payment.customer_id = customer.customer_id
    INNER JOIN rental
    ON customer.customer_id = rental.customer_id
) AS multi_join
WHERE amount <= 0

404449
