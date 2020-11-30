select * from sakila.actor;
select*from sakila.city;

select*from sakila.film;
select title from sakila.film;

select * from sakila.language;
select sakila.film.title, sakila.language.name from sakila.film 
inner join sakila.language on sakila.film.language_id = sakila.language.language_id;

select count(store_id) from sakila.store;
select count(staff_id) from sakila.staff;
select staff_id, address_id from sakila.staff;
select staff_id,first_name, last_name from sakila.staff;
