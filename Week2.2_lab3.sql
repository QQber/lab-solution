use sakila;

select distinct count(last_name) from actor;

select distinct language_id from film;

select*from film;
select count(*) from film
where rating='PG-13';

select*from film
where release_year >= 2006
order by length desc
limit 10;

select*from rental;
select datediff(max(return_date),min(rental_date)) from rental;

select *, date_format(rental_date,'%M') as month, date_format(rental_date,'%W') as day from rental;

select date_format(rental_date,'%w') from rental;
select *, case
	when date_format(rental_date,'%W')='sunday' then 'weekend'
    when date_format(rental_date,'%W')='saturday' then 'weekend'
    else 'weekday'
end as day_type
from rental;

select year(rental_date), month(rental_date), count(*) from rental
group by rental_date
order by 1 desc, 2 desc
limit 1;