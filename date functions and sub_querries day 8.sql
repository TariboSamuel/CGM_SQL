select *
from "orders" o
join "accounts" a
on o.account_id=a.id
join "sales_reps" s
on s.id=a.sales_rep_id;


select *
from "Brewery_data";

select distinct "COUNTRIES"
from "Brewery_data";


select "TERRITORIES", sum ("PROFIT") as "TERRITORIAL_PROFIT"
from
(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORIES"
from "Brewery_data") as "Table1"
group by "TERRITORIES";


select *,
case when "MONTHS" in ('January', 'February', 'March') then 'Q1'
when "MONTHS" in ('April', 'May', 'June') then 'Q2'
when "MONTHS" in ('July', 'August', 'September') then 'Q3'
else 'Q4' end as "QUARTELY"
from "Brewery_data";

select "QUARTELY", sum("PROFIT") as "TOTAL_PROFIT"
from
(select *,
case when "MONTHS" in ('January', 'February', 'March') then 'Q1'
when "MONTHS" in ('April', 'May', 'June') then 'Q2'
when "MONTHS" in ('July', 'August', 'September') then 'Q3'
else 'Q4' end as "QUARTELY"
from "Brewery_data"
 where "YEARS" = 2019) as "Table2"
 group by "QUARTELY"
 order by "TOTAL_PROFIT" desc;



-- using the date functions

select *
from "orders";

select date_part('year',"occurred_at") as "ordered_year"
from "orders";

select date_part('Month',"occurred_at") as "ordered_Month"
from "orders";


select date_part('year',"occurred_at") as "ordered_year", sum ("total_amt_usd") as "total_spent"
from "orders"
group by 1
order by 2;

select *
from
(select date_part('year',"occurred_at") as "ordered_year", count (*) as "Year_counts"
from "orders"
group by 1
order by 2) as "table3"
where "ordered_year" between '2013' and '2015';

-- question 1: join orders and accounts, where a.name is walmart, select only the month in the date_part. then sum the gloss_amt_usd
-- question 2: select the day, and count it with the w.channel


select date_part('Month', "occurred_at") as "ordered_month", a.name, sum("gloss_amt_usd") as "Total_gloss_amt_usd"
from "orders" o
join "accounts" a
on o.account_id=a.id
where a.name = 'Walmart'
group by a.name, "occurred_at";

select *
from
(select date_part('Month', "occurred_at") as "ordered_month", a.name, sum(o.gloss_amt_usd) as "Total_gloss_amt_usd"
from "orders" o
join "accounts" a
on o.account_id=a.id
group by a.name, "ordered_month"
order by "Total_gloss_amt_usd") as "table4"
where "name" = 'Walmart';

select *
from "web_events";

select *
from "orders";

select date_part('Day', o.occurred_at) as "day_occurred", count (w.channel) as "channel_count"
from "web_events" w
join "orders" o
on w.id=o.id
group by 1
order by 2 desc;













