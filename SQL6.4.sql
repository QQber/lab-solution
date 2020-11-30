use sakila;

drop procedure if exists movie_cate;

delimiter //
create procedure movie_cate (in cate varchar(10))
begin
  select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = cate
  group by first_name, last_name, email;
end;
//
delimiter ;
  
call movie_cate('action');