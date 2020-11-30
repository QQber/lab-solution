use sakila;

select min(first_name), last_name, count(*) as lncount from actor
group by last_name
having lncount = 1
order by last_name; 

SELECT first_name, last_name
FROM actor
where last_name in (
    select last_name from actor
    group by last_name having count(*) = 1
)
order by last_name;

select last_name, count(last_name) as count from actor
group by last_name
having count>=2;

select staff_id, count(rental_id) from rental
group by staff_id;

select release_year, count(film_id) from film
group by release_year;

select rating, count(film_id) from film
group by rating;

select*from film;
select round(avg(length),2), rating from film
group by rating;

select rating, avg(length) as avg from film
group by rating
having avg >120;