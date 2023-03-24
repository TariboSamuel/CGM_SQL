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