-- SECTION A NUMBER 1. Within the space of the last three years, what was the profit worth of the breweries,
-- inclusive of the anglophone and the francophone territories?

select "YEARS", sum("PROFIT") as "PROFIT_FOR_2017"
from "Brewery_data"
where "YEARS" = 2017
GROUP BY "YEARS";


select "YEARS", sum("PROFIT") as "PROFIT_FOR_2018"
from "Brewery_data"
where "YEARS" = 2018
GROUP BY "YEARS";

select "YEARS", sum("PROFIT") as "PROFIT_FOR_2019"
from "Brewery_data"
where "YEARS" = 2019
GROUP BY "YEARS";



-- SECTION A NUMBER 3. Country that generated the highest profit in 2019

select "COUNTRIES", sum("PROFIT") as "GRAND_PROFIT", "YEARS"
from "Brewery_data"
where "YEARS" = 2019
group by "COUNTRIES", "YEARS"
limit 1;

-- SECTION A NUMBER 4. Help him find the year with the highest profit.
select "YEARS", sum("PROFIT") as "NEW_PROFIT"
from "Brewery_data"
group by "YEARS" 
order by "NEW_PROFIT" desc
limit 1;

-- SECTION A NUMBER 5. Which month in the three years was the least profit generated?

select "MONTHS", sum("PROFIT") as "MONTH_THAT_GENERATED_LEAST_PROFIT_IN_3_YEARS"
from "Brewery_data"
group by "MONTHS" 
order by "MONTH_THAT_GENERATED_LEAST_PROFIT_IN_3_YEARS" asc
limit 1;

-- SECTION A NUMBER 6. What was the minimum profit in the month of December 2018?

select "MONTHS", "PROFIT" as "MINIMUM_PROFIT", "YEARS"
from "Brewery_data"
where "MONTHS" = 'December' and "YEARS" = 2018
order by "PROFIT" asc
limit 1;

-- SECTION A NUMBER 7. Compare the profit in percentage for each of the month in 2019

select "MONTHS", (sum("PROFIT")/sum("COST")*100) as "PERCENTAGE_FOR_EACH_MONTH_IN_2019"
from "Brewery_data"
where "YEARS" = 2019
group by "MONTHS"
order by "PERCENTAGE_FOR_EACH_MONTH_IN_2019";

-- SECTION A NUMBER 8. Which particular brand generated the highest profit in Senegal?

select "BRANDS", "PROFIT", "COUNTRIES"
from "Brewery_data"
where "COUNTRIES" = 'Senegal'
order by "PROFIT" desc
limit 1;

