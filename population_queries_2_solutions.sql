-- How many entries in the database are from Africa?

SELECT COUNT (*) 
FROM countries 
WHERE continent = 'Africa';

56

-- What was the total population of Oceania in 2005?

SELECT SUM(population) 
FROM countries 
JOIN population_years 
ON countries.id = population_years.country_id 
WHERE countries.continent = 'Oceania' 
AND population_years.year = 2005;

32.66417

-- What is the average population of countries in South America in 2003?

SELECT AVG(population) 
FROM countries 
JOIN population_years 
ON countries.id = population_years.country_id 
WHERE countries.continent = 'South America' 
AND population_years.year = 2003;

25.8906514285714

-- What country had the smallest population in 2007?

SELECT countries.name, population_years.population 
FROM countries 
JOIN population_years 
ON countries.id = population_years.country_id 
WHERE year = 2007
ORDER BY population_years.population ASC
LIMIT 1;

Former Serbia and Montenegro|null

-- What is the average population of Poland during the time period covered by this dataset?

SELECT countries.name, AVG(population_years.population) 
FROM countries 
JOIN population_years 
ON countries.id = population_years.country_id 
WHERE countries.name = 'Poland' 
GROUP BY countries.name;

Poland|38.5606790909091

-- How many countries have the word "The" in their name?

SELECT name 
FROM countries 
WHERE name LIKE '%The%';

Bahamas, The
Netherlands Antilles
Netherlands
Gambia, The

-- What was the total population of each continent in 2010?

SELECT countries.continent, SUM(population_years.population) 
FROM countries 
JOIN population_years 
ON countries.id = population_years.country_id 
WHERE population_years.year = 2010 
GROUP BY countries.continent;

Africa|1015.47846
Asia|4133.09148
Europe|723.06044
North America|539.79456
Oceania|34.95696
South America|396.58235