use sakila;

select rating from film;

select release_year from film;

select * from film
where title regexp 'ARMAGEDDON ';

select*from film
where title regexp 'APOLLO';

select*from film
where title like '%apollo';

# [[:space:]] means space
select*from film
where title regexp '[[:space:]]date[[:space:]]'
or title regexp '[[:space:]]date'
or title regexp '^date[[:space:]]';

select*from film
order by length(title) desc
limit 10;

select*from film
order by length desc
limit 10;

select count(special_features) from film
where special_features = 'behind the scenes'
group by special_features;

select*from film
order by release_year, title;