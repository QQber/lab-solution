use Sakila;

SELECT 
    f.category_id, c.name, COUNT(f.film_id) AS film_amount
FROM
    film_category f
        LEFT JOIN
    category c ON f.category_id = c.category_id
GROUP BY category_id;


SELECT 
    s.first_name, s.last_name, a.address
FROM
    staff s
        LEFT JOIN
    address a ON s.address_id = a.address_id;


SELECT 
    s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM
    staff s
        LEFT JOIN
    payment p ON s.staff_id = p.staff_id
WHERE
    MONTH(p.payment_date) = 8
        AND YEAR(p.payment_date) = 2005
GROUP BY s.first_name , s.last_name;


SELECT 
    f.title, COUNT(a.actor_id) AS actor_num
FROM
    film f
        JOIN
    film_actor a ON f.film_id = a.film_id
GROUP BY f.title;


SELECT 
    c.first_name, c.last_name, SUM(p.amount) AS total
FROM
    customer c
        JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name , c.last_name
ORDER BY c.last_name;