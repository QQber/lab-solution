use sakila;

select * from actor where first_name='Scarlett';

select*from actor where last_name='Johansson';

select count(film_id) from inventory;

select count(inventory_id) from rental;

select*from rental;

SELECT distinct timestampdiff(second,rental_date,return_date) as max_duration
from rental
order by max_duration desc
limit 1;

SELECT distinct timestampdiff(second,rental_date,return_date) as min_duration
from rental
where timestampdiff(second,rental_date,return_date)>0
order by min_duration
limit 1;

select distinct rental_duration from film
order by rental_duration
limit 1;

select from_unixtime(AVG(length), '%m:%s') as avg from film;


select concat
	(concat
		(concat(upper(substring(first_name,1,1)),
				lower(substring(first_name,2,length(first_name)))),
		' ',last_name,' - ',lower(email)))
as name from customer;

select length(title) as Lenght from film
order by Lenght desc
limit 1;