use sakila;
select*from film_category;

# 1. Select the first name, last name, and email address of all the customers who have rented a movie.
select c.first_name, c.last_name,c.address_id from customer c
join rental r using(customer_id)
group by c.customer_id;

# 2. What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
select c.customer_id, concat(c.first_name,' ',c.last_name) as customer_name,avg(p.amount) from customer c
join payment p using(customer_id)
group by c.customer_id;

# 3. Select the name and email address of all the customers who have rented the "Action" movies.
# 3.1 Write the query using multiple join statements
select concat(c.first_name,' ',c.last_name) as customer_name, c.email from customer c
join rental a using(customer_id)
join inventory i using(inventory_id)
join film_category f using(film_id)
join category ca using(category_id)
where ca.name='action'
group by a.customer_id;

# 3.2 Write the query using sub queries with multiple WHERE clause and IN condition
select concat(first_name,' ',last_name) as customer_name,email from customer
where customer_id in
	(select customer_id from rental where inventory_id in
		(select inventory_id from inventory where film_id in
			(select film_id from film_category where category_id in
				(select category_id from category where
					name = 'action')
			)
		)
	);

# 3.3 Verify if the above two queries produce the same results or not
    
# 4. Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment. If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, then it should be high.
select *, 
case when amount between 0 and 2 then 'low'
when amount between 2 and 4 then 'medium'
else 'high'
end as value
from payment;
