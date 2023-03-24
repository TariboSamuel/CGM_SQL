select *
from "web_events";

select "channel", count (*)
from "web_events"
group by "channel";

select w.channel, count (*)
from "web_events" w
group by w.channel;

select a.name, min("total_amt_usd") as "min_order"
from "accounts" a
join "orders" o
on a.id=o.account_id
group by a.name
order by "min_order";

select a.name, min(o.total_amt_usd) as "min_order"
from "accounts" a
join "orders" o
on a.id=o.account_id
group by a.name
order by "min_order";

select a.name, max(o.total_amt_usd) as "max_order"
from "accounts" a
join "orders" o
on a.id=o.account_id
group by a.name
order by "max_order" desc;

select r.name, count (*) as "num_reps"
from "region" r
join "sales_reps" s
on r.id=s.region_id
group by r.name
order by "num_reps";


-- join account and web_events and sales rep, then select s.name, w.channel. count all of them

select s.name, w.channel, count (*) as "num_events"
from "accounts" a
join "web_events" w
on a.id=w.account_id
join "sales_reps" s
on a.sales_rep_id=s.id
group by s.name, w.channel
order by "num_events" desc;


-- join account, web_event and region. select r.name, w.channel and count all of them

select r.name, w.channel, count (*) as "num_events"
from "accounts" a
join "web_events" w
on a.id=w.account_id 
join "region" r
on w.id=r.id
group by r.name, w.channel
order by "num_events";

select distinct s.id, s.name
from "sales_reps" s;

-- account, sales_rep and region. give distinct s.id, distinct a.id, distinct r.id, distinct a.name 

select distinct s.id, a.id, r.id, a.name
from "accounts" a
join "sales_reps" s
on a.sales_rep_id=s.id
join "region" r
on s.region_id=r.id
order by s.id desc;


-- using having command: having comes between (group by and order by)

select s.id, s.name, count (*) as "num_account"
from "accounts" a
join "sales_reps" s
on a.sales_rep_id=s.id
group by s.id, s.name
having count (*) > 8
order by "num_account";


select a.id, a.name, sum(o.total_amt_usd) as "sum_total_amt_usd"
from "accounts" a
join "orders" o
on a.id=o.account_id
group by a.id, a.name
having sum(o.total_amt_usd) > 3000
order by "sum_total_amt_usd";

-- join account and web_events. select a.id, a.name and w.channel. count all of them and call it "use of channel", then use having to find count greater than 6 and w.channel that is only facebook.

select a.id, a.name, w.channel, count (*) as "use_of_channel"
from "accounts" a
join "web_events" w
on a.id=w.account_id
group by a.id, a.name, w.channel
having count (*) > 6 and w.channel = 'facebook'
order by "use_of_channel";


-- solving problems with cases

select *
from "orders";


select*,
case when "poster_qty" = 0 or "poster_qty" is null then 0
else "standard_amt_usd"/"poster_qty" end as "unit_price"
from "orders";


select*,
case when "total_amt_usd" > 3000 then 'large'
else 'small' end as "order_level"
from "orders";

select "account_id", "total_amt_usd",
case when "total_amt_usd" > 3000 then 'large'
else 'small' end as "order_level"
from "orders";


select a.name, sum ("total_amt_usd") as "total_spent",
case when sum ("total_amt_usd") > 2000 then 'top'
when sum ("total_amt_usd") > 10000 then 'middle'
else 'low' end as "customer_level"
from "accounts" a
join "orders" o
on a.id =o.account_id
group by a.name
order by "total_spent";



-- join orders, account and sales_rep. select s.name as colomn. set a case to count the s.name > 200 as top, and <200 as low and call it sales_rep_level

select s.name, count (s.name),
case when count (s.name) > 200 then 'top'
else 'low' end as "sales_rep_level"
from "orders" o
join "accounts" a
on o.account_id=a.id
join "sales_reps" s
on a.sales_rep_id=s.id
group by s.name;








select s.name, count (*), sum(o.total_amt_usd) as "total_spent",
case when count (*) sum(o.total_amt_usd)>75000 then 'top'
when count(*)>150 or sum(o.total_amt_usd) <5000 then 'middle'
else 'bottom' end as "customer_level"
from "orders" o
join "accounts" a
on o.account_id=a.id
join "sales_reps" s
on s.id=a.sales_rep_id
order by s.name;
