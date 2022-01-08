-- What years are covered by the dataset? (you can manually count the number of years returned).

SELECT DISTINCT year 
FROM population_years;

2000
2001
2002
2003
2004
2005
2006
2007
2008
2009
2010

SELECT COUNT(DISTINCT year) 
FROM population_years;

11

-- What is the largest population size for Gabon in this dataset?

SELECT population, year 
FROM population_years 
WHERE country = 'Gabon' 
ORDER BY population DESC 
LIMIT 1;

1.54526|2010

-- What were the 10 lowest population countries in 2005?

SELECT country, population 
FROM population_years 
WHERE year = 2005 
ORDER BY population ASC 
LIMIT 10;

Niue|0.00216
Falkland Islands (Islas Malvinas)|0.00297
Montserrat|0.00453
Saint Pierre and Miquelon|0.0062
Saint Helena|0.00748
Nauru|0.01001
Cook Islands|0.0136
Turks and Caicos Islands|0.02057
Virgin Islands, British|0.02268
Gibraltar|0.02846

-- What are all the distinct countries with a population of over 100 million in the year 2010?

SELECT DISTINCT country, population 
FROM population_years 
WHERE year = 2010 
AND population > 100;

Mexico|112.46886
United States|310.23286
Brazil|201.10333
Russia|139.39021
Nigeria|152.21734
Bangladesh|156.11846
China|1330.14129
India|1173.10802
Indonesia|242.96834
Japan|126.80443
Pakistan|184.40479

-- How many countries in this dataset have the word “Islands” in their name?

SELECT DISTINCT country 
FROM population_years 
WHERE country LIKE '%Islands%';

Cayman Islands
Falkland Islands (Islas Malvinas)
Turks and Caicos Islands
Virgin Islands,  U.S.
Virgin Islands, British
Faroe Islands
Cook Islands
Solomon Islands
U.S. Pacific Islands

-- What is the difference in population between 2000 and 2010 in Indonesia?

SELECT 
    (SELECT ROUND(population, 0) FROM population_years WHERE country = 'Indonesia' AND year = 2010) - 
    (SELECT ROUND(population, 0) FROM population_years WHERE country = 'Indonesia' AND year = 2000);

28.0