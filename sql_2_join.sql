# SQL Join exercise
#
use world;
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT 
    Name, Population
FROM
    city
WHERE
    Name LIKE 'ping%'
ORDER BY Population ASC;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT 
    Name, Population
FROM
    city
WHERE
    Name LIKE 'ran%'
ORDER BY Population DESC;
#
# 3: Count all cities
SELECT 
    COUNT(name)
FROM
    city;
#
# 4: Get the average population of all cities
SELECT 
    AVG(Population)
FROM
    city;
#
# 5: Get the biggest population found in any of the cities
SELECT 
    MAX(Population)
FROM
    city;
#
# 6: Get the smallest population found in any of the cities
SELECT 
    MIN(Population)
FROM
    city;
#
# 7: Sum the population of all cities with a population below 10000
SELECT 
    SUM(Population)
FROM
    city
WHERE
    Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT 
    COUNT(Countrycode)
FROM
    city
WHERE
    Countrycode IN ('MOZ' , 'VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT 
    COUNT(Name), Countrycode
FROM
    city
WHERE
    Countrycode IN ('MOZ' , 'VNM')
GROUP BY Countrycode;
#
# 10: Get average population of cities in MOZ and VNM
SELECT 
    AVG(Population)
FROM
    city
WHERE
    Countrycode IN ('MOZ' , 'VNM');
SELECT 
    AVG(Population), Countrycode
FROM
    city
WHERE
    Countrycode IN ('MOZ' , 'VNM')
GROUP BY Countrycode;
# 11: Get the countrycodes with more than 200 cities
#select city.Name,country.Name from city join country on city.CountryCode = country.Code;
SELECT 
    country.Code AS CountryCode, COUNT(*) AS CityCount
FROM
    country
        JOIN
    city ON country.Code = city.CountryCode
GROUP BY country.Code
HAVING COUNT(*) > 200;
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT 
    city.CountryCode AS CountryCode, COUNT(*) AS CityCount
FROM
    city
        JOIN
    country ON city.CountryCode = country.Code
GROUP BY city.CountryCode
HAVING COUNT(*) > 200
ORDER BY CityCount ASC;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT 
    city.Name AS cityname,
    city.Population AS population,
    countrylanguage.Language AS language
FROM
    city
        JOIN
    countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE
    city.Population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT 
    city.Name AS cityname,
    city.Population AS population,
    countrylanguage.Language AS language
FROM
    city
        JOIN
    countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE
    city.Population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT 
    city.Name, city.Population, country.Name
FROM
    city
        JOIN
    country ON city.CountryCode = country.Code
WHERE
    country.Code = (SELECT 
            CountryCode
        FROM
            city
        WHERE
            Population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT 
    city.Name AS CityName, country.Name AS CountryName
FROM
    city
        JOIN
    country ON city.CountryCode = country.Code
WHERE
    city.Population = 122199;

SELECT 
    city.Name AS cityname,
    city.Population AS population,
    country.Name AS countryname
FROM
    city
JOIN
    country ON city.CountryCode = country.Code
WHERE
    country.Code = (
        SELECT 
            CountryCode
        FROM
            city
        WHERE
            Population = 122199
    )
    AND city.Population != 122199;

#
# 17: What are the city names in the country where Luanda is capital?
SELECT 
    city.Name, country.Code
FROM
    city 
        JOIN
    country ON city.CountryCode = country.Code
WHERE
    country.Capital = (SELECT 
            ID
        FROM
            city
        WHERE
            Name = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT 
    city.Name AS capital_city_name,
    country.Name AS country_name,
    country.Region AS region_name
FROM
    city 
JOIN
    country ON city.ID = country.Capital
WHERE
    country.Region = (
        SELECT 
            region
        FROM
            city
        JOIN country ON city.CountryCode = country.Code
        WHERE
            city.Name = 'Yaren'
    );
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT
    countrylanguage.Language
FROM
    countrylanguage
        JOIN
    country ON countrylanguage.CountryCode = country.Code
WHERE
    country.Region = (SELECT 
            Region
        FROM
            country
        WHERE
            Code = (SELECT 
                    CountryCode
                FROM
                    city
                WHERE
                    Name = 'Riga'));

#
# 20: Get the name of the most populous city
#
SELECT 
    city.Name, city.Population
FROM
    city
        JOIN
    country ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 5;