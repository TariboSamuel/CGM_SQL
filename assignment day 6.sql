select max ("total_amt_usd") - min("total_amt_usd") as "difference"
from "orders";

select sum ("standard_amt_usd") as "sum_standards", sum ("gloss_amt_usd") as "gloss_usd"
from "orders";

select avg ("gloss_amt_usd") as "average_gloss"
from "orders";

select sum ("standard_amt_usd") / sum ("standard_qty") as "standard_price_per_unit"
from "orders";

select avg("standard_qty") as "avg_standard_qty", avg("gloss_qty") as "avg_gloss_qty", avg("poster_qty") as "avg_poster_qty",
avg("total") as "avg_total", avg ("standard_amt_usd") as "avg_standard_amt_usd", avg("gloss_amt_usd") as "avg_gloss-amt_usd",
avg("poster_amt_usd") as "avg_poster_amt_usd", avg("total_amt_usd") as "avg_total_amt_usd"
from "orders";

select *
from 
(select "total_amt_usd"
from "orders"
 order by "total_amt_usd"
 limit 200) as "table1"
 order by "total_amt_usd" desc
 limit 20;
 
 select *
from 
(select "account_id", "total_amt_usd"
from "orders"
 order by "total_amt_usd"
 limit 200) as "table1"
 where "account_id" > 2000
 order by "total_amt_usd" desc
 limit 20;
 
select w.occurred_at, w.channel, a.name
 from "web_events" w
 join "accounts" a
 on w.account_id=a.id
 where w.occurred_at between '2015-01-01' and '2017-12-31'
 and w.channel = 'organic';
 
 
select *
from 
(select *
from
(select w.occurred_at, w.channel, a.name
 from "web_events" w
 join "accounts" a
 on w.account_id=a.id
 where w.occurred_at between '2015-01-01' and '2017-12-31') as "keys"
 where keys.channel = 'organic') as "ayo"
 order by ayo.occurred_at desc;

 