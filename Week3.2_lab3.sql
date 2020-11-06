use sakila;

select title, count(inventory_id) as copies from 
(
	select f.title, i.inventory_id from film f join inventory i
    on f.film_id = i.film_id
    where f.title='Hunchback Impossible'
) sub1;

select title from film
where length >
(
	select avg(length) from film
);

select first_name, last_name from
(
	select a.first_name, a.last_name 
    from actor a join film_actor fa
    on a.actor_id = fa.actor_id
    join film f
    on f.film_id = fa.film_id
    where f.title ='Alone Trip'
)sub1;

SELECT first_name, last_name FROM actor
WHERE actor_id in 
(
	SELECT actor_id FROM film_actor WHERE film_id =
    (
		SELECT film_id FROM film WHERE title = ‘ALONE TRIP’
	)
);

select title from
(
	select f.title
    from film f join film_category fc
    on f.film_id = fc.film_id
    join category c
    on c.category_id = fc.category_id
    where c.name='Family'
)sub1;

select first_name, last_name, email from customer
where address_id in 
(
	select address_id from address where city_id in
    (
		select city_id from city where country_id in
        (
			select country_id from country where country ='Canada'
		)
	)
);

select first_name, last_name,film.title from actor
inner join film_actor using(actor_id)
inner join film using(film_id)
where actor_id =
(	
	select actor_id from film_actor
    inner join film using (film_id)
    inner join actor using (actor_id)
    group by actor_id
    order by count(film_id) desc
    limit 1
);


select title,amount from film
inner join inventory using(film_id)
inner join rental using (inventory_id)
inner join payment using (rental_id)
where rental.customer_id = 
(	select customer_id from customer 
	inner join payment using (customer_id)
    group by customer_id
    order by sum(amount) desc
    limit 1
);


select customer_id,sum(amount)
from sakila.customer
inner join payment using (customer_id)
group by customer_id
order by sum(amount) desc
limit 1;


select customer_id, sum(amount) as payment
from sakila.customer
inner join payment using (customer_id)
group by customer_id
having sum(amount) > (
select avg(total_payment)
from (
select customer_id, sum(amount) as total_payment
from payment
group by customer_id
) a
)
order by payment desc;