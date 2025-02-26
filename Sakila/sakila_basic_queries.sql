/* Write a query to retrieve all the films from film table whose release year is 2006. Only include the title,
release_year, and rental_rate columns as Film Title, Release Year, and Rental Rate in your results.*/

SELECT title as 'Film Title', release_year as 'Release Year', rental_rate as 'Rental Rate'
FROM film
WHERE release_year = 2006

/* Write a query to retrieve all the films from film table that contains only Commentaries in the special_features.
Select film_id, title, special_features columns as Film ID, Film Title, and Special Features.*/

SELECT film_id as 'Film ID', title as 'Film Title', special_features as 'Special Features'
From film
WHERE special_features = 'Commentaries'

/* Find out how many distinct films are available for rent in the inventory table and rename it to Total Film.*/

SELECT count(distinct(film_id)) as 'Total Film'
FROM inventory

/* Determine the total number of films available for rent,
but only count those with a rental duration of 5 days and rename it to Total Film.*/

SELECT count(film_id) as 'Total Film'
FROM film
WHERE rental_duration = 5

/* Find the date of the last film rented out using the return_date column from the rental table and rename it to Last Film*/ 

SELECT max(return_date) as 'Last Film'
FROM rental 

/* Find the first and last payment date using the payment_date column from the payment table and rename it to First Payment and Last Payment.*/

SELECT min(payment_date) as 'First Payment', max(payment_date) as 'Last Payment'
FROM payment

/* Find the number of copies of FAMILY SWEET in the inventory table and rename it to Copies of FAMILY SWEET.
Use film_id from film table to find number of copies of FAMLIY SWEET.*/

SELECT count(*) as 'Copies of FAMILY SWEET'
FROM inventory
WHERE film_id = (
                    SELECT film_id 
                    FROM film 
                    WHERE title = 'FAMILY SWEET');

/* The customer ELEANOR HUNT has made most payments in the payment table. 
Find the number of payments made by ELEANOR HUNT and rename it to Payments by ELEANOR HUNT.*/ 
SELECT count(*) as 'Payments by ELEANOR HUNT'
FROM payment
WHERE customer_id = (
                        SELECT customer_id 
                        FROM customer
                        WHERE first_name = 'ELEANOR' AND last_name = 'HUNT')

/* In the previous activity, we found that ELEANOR HUNT has made the most payments in the payment table.
Now, find the total amount paid by ELEANOR HUNT and rename it to Total Amount Paid by ELEANOR HUNT*/

SELECT sum(amount) as 'Total Amount Paid by ELEANOR HUNT'
FROM payment
WHERE customer_id = (
                        SELECT customer_id 
                        FROM customer
                        WHERE first_name = 'ELEANOR' AND last_name = 'HUNT')

/* Find the total number of customers associated with staff whose owner is Mike Hillyer and rename it to Customer's staff Mike Hillyer.*/

SELECT count(*) as "Customer's staff Mike Hillyer"
FROM customer
WHERE store_id = (
                    SELECT staff_id
                    FROM staff
                    WHERE first_name = 'Mike' AND last_name = 'Hillyer')