use sakila;

select f1.film_id, concat(a1.first_name,' ',a1.last_name),concat(a2.first_name,' ',a2.last_name)
from actor a1
inner join film_actor f1 on a1.actor_id=f1.actor_id
inner join film_actor f2 on f1.film_id=f2.film_id and f2.actor_id != f1.actor_id
inner join actor a2 on a2.actor_id = f2.actor_id;

# For each film, list actor that has acted in more films.

with cet_actor as (
select actor_id,count(film_id) as num_film from film_actor
group by actor_id
)
select f.title, concat(a.first_name,' ',a.last_name) as actor_name from
(select film_id, actor_id,
rank() over (partition by film_id order by num_film desc) as position
from film_actor
inner join cet_actor using (actor_id)) t
inner join actor a on a.actor_id = t.actor_id
inner join film f on f.film_id=t.film_id
where position=1;


