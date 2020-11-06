use bank;

select account_id from account
where district_id in
(
	select A1 from district
	where A3 ='central Bohemia'
);


select d.A2 district_name, account_id, round(total) as total
from
(
  select ac.account_id, ac.district_id, sum(tr.amount) as total,
  rank() over (partition by district_id order by sum(tr.amount) desc) as position
  from bank.account ac
  inner join bank.trans tr
  using (account_id)
  group by ac.account_id
) as t
inner join district as d
on t.district_id = d.A1
where position = 1
and d.A3 = 'central Bohemia'
order by t.district_id;

# ex3.06-1
with cet_account as (
select account_id,district_id,
rank() over (partition by district_id order by date ASC) as position
from account
)
select account_id,district_id from cet_account
where position=1;

# ex3.06-2
create view last_week_withdrawals as
with cte_trans as (
select account_id,sum(amount),date from trans
where operation ='VYDAJ'
group by account_id
order by sum(amount) DESC
)
select *from cte_trans ct
join disp d using(account_id)
join client c using(client_id);





drop view if exists last_week_withdrawals;
CREATE VIEW last_week_withdrawals AS
with cte_trans as (
SELECT *,
	(
		select max(date) from trans
	) as max_date from bank.trans
)
select account_id, round(sum(trans.amount)) as total_withdrawl
from bank.trans
left join cte_trans using(account_id)
where date(trans.date)>date_sub(max_date,interval 7 day)
and trans.operation='VYDAJ'
group by account_id;
