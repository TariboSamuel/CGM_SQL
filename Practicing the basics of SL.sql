select *,
from "Brewery_data";

select COUNT (distinct "EMAILS") as distinct_emails
from "Brewery_data"

select count (distinct "EMAILS") as distinctbrands
from "Brewery_data"

Select distinct "EMAILS"
from "Brewery_data"

USING THE WHERE CLAUSE
select "PLANT_COST", "UNIT_PRICE"
FROM "Brewery_data" 
where "COUNTRIES" = 'Nigeria'

USING THE AND SYNTAX
SELECT *
FROM "Brewery_data"
WHERE "BRANDS" = 'trophy' AND "COUNTRIES" = 'Nigeria'

THE OR SYNTAX
SELECT "SALES_REP"
FROM "Brewery_data"
WHERE "SALES_REP" = 'Andrews' OR "SALES_REP" = 'Nigeria'

THE NOT SYNTAX
SELECT *
FROM "Brewery_data"
WHERE NOT "PLANT_COST" = 200

COMBINING THE AND, OR AND NOT SYNTAX
SELECT *
FROM C
WHERE "SALES_REP" = 'Jones' AND "BRANDS" = 'trophy' AND ("COUNTRIES" = 'Togo' OR "COUNTRIES" = 'west')

THE ORDER BY SYNTAX
SELECT *
FROM "Brewery_data"
ORDER BY "PLANT_COST" ASC, "QUANTITY" DESC

SELECT *
FROM "region"

THE INSERT INTO  SYNTAX
SELECT *
FROM "region"
INSERT INTO "region" ("Id", "name")
VALUES (5, 'North')
to be visited


THE IS NOT NULL SYNTAX
This will display values that are not null.
SELECT "name"
FROM "region"
WHERE "name" IS NOT NULL; 

THE IS NULL SYNTAX
this will display the null values
SELECT "name"
FROM "region"
WHERE "name" IS NULL;


SELECT *
FROM "Brewery_data",
UPDATE "Brewery_data",
SET "SALES_ID" = 10001, 
WHERE "COUNTRIES"='Ghana';

USING THE LIMIT SYNTAX
SELECT *
FROM "Brewery_data"
LIMIT 3;


SELECT MIN("QUANTITY") AS "MINIMUM_QUANTITY"
FROM "Brewery_data"


SELECT MAX("QUANTITY") AS "MAXIMUM_QUANTITY"
FROM "Brewery_data"


SELECT "QUANTITY", MIN("QUANTITY") AS "MINIMUM_QUANTITY"
FROM "Brewery_data";
GROUP BY "QUANTITY"


SELECT AVG("QUANTITY") AS "AVERAGE_QUANTITY"
FROM "Brewery_data"

USING THE IN SYNTAX
SELECT *
FROM "Brewery_data"
WHERE "BRANDS" IN('trophy', 'hero')


USING THE BETWEEN SYNTAX
SELECT "PLANT_COST" 
FROM "Brewery_data"
WHERE "PLANT_COST" BETWEEN 100 AND 250

SELECT *
FROM "Brewery_data"
WHERE "SALES_REP" BETWEEN 'Smith' AND 'Gill'
ORDER BY "PLANT_COST"

SELECT "PLANT_COST" 
FROM "Brewery_data"
WHERE "PLANT_COST" NOT BETWEEN 100 AND 250
 
USING THE AS SYNTAX
SELECT "long", SUM(long) AS "Sum_long" 
FROM "accounts"
GROUP BY "long"

USING THE LIKE SYNTAX
SELECT "BRANDS", "COUNTRIES"
FROM "Brewery_data"
WHERE "BRANDS" LIKE "COUNTRIES"

USING THE IN SYNTAX
SELECT "BRANDS", "COUNTRIES"
FROM "Brewery_data"
WHERE "BRANDS" IN('trophy', 'hero', 'beta malt'); 

SELECT "BRANDS"
FROM "Brewery_data"
UNION
SELECT "COUNTRIES"
FROM "Brewery_data"






