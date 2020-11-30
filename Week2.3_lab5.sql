use sakila;

# Drop column picture from staff
alter table staff drop column picture;


insert into staff values(3,'Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy',null,'2006-02-15 04:57:20');
INSERT INTO staff (staff_id, first_name, last_name, address_id, store_id, username)
values (3, ‘Tammy’, “Sanders”, 79, 2, ‘Tammy’);

insert into rental values('16050',current_timestamp(),9,130,null,1,current_timestamp());

drop table deleted_user;
create table deleted_user (
customer_id int unique not null,
email varchar(50) default null,
date datetime default null,
constraint primary key(customer_id)
);
insert into deleted_user select customer_id, email,create_date from customer where active=0;

create table deleted_user2
select customer_id, email,create_date from customer where active=0;


select*from deleted_user;