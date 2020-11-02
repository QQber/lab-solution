use sakila;


SELECT 
    s.store_id, c.city, y.country
FROM
    store s
        JOIN
    address a ON a.address_id = s.address_id
        JOIN
    city c ON c.city_id = a.city_id
        JOIN
    country y ON y.country_id = c.country_id;
    

SELECT 
    s.store_id, SUM(p.amount)
FROM
    payment p
        JOIN
    staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;


SELECT 
    c.name,AVG(m.length) AS avg_time
FROM
    film_category f
        JOIN
    category c ON c.category_id = f.category_id
        JOIN
    film m ON m.film_id = f.film_id
GROUP BY c.name;


SELECT 
    c.name,AVG(m.length) AS avg_time
FROM
    film_category f
        JOIN
    category c ON c.category_id = f.category_id
        JOIN
    film m ON m.film_id = f.film_id
GROUP BY c.name
order by avg_time desc
limit 1;


SELECT 
    f.title, COUNT(r.rental_id) AS rent_time
FROM
    inventory i
        JOIN
    rental r ON i.inventory_id = r.inventory_id
        JOIN
    film f ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY rent_time DESC;


SELECT 
    c.name, SUM(p.amount) AS revenue
FROM
    payment p
        JOIN
    rental r ON r.rental_id = p.rental_id
        JOIN
    inventory i ON i.inventory_id = r.inventory_id
        JOIN
    film_category f ON f.film_id = i.film_id
        JOIN
    category c ON c.category_id = f.category_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 5;

select*from inventory;
select*from rental;
select f.title, count(*)
from film f join inventory i
on f.film_id = i.film_id
where f.title = 'Academy Dinosaur' and i.store_id=1;