SELECT * FROM city
WHERE country_code = 'FIN';

SELECT * FROM city;
SELECT * FROM country;

SELECT * FROM city
WHERE country_code = 'USA' ;


SELECT SUM(population) FROM city
WHERE country_code = 'USA' ;


SELECT * FROM city
WHERE population BETWEEN 1000001 AND 1999999 LIMIT 15;


SELECT district, SUM(population) AS total_population
FROM city
WHERE country_code = 'USA'
GROUP BY district;


SELECT name, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy DESC
LIMIT 1;

SELECT
    name AS country_name,
    population AS country_population,
    (
        SELECT SUM(ci.population) IS NOT NULL
        FROM city ci
        WHERE ci.country_code = co.code
    ) AS total_city_population
FROM country co
ORDER BY total_city_population DESC;


SELECT
    c.code AS country_code,
    c.name AS country_name,
    SUM(ci.population) AS total_city_population,
    c.population AS country_population
FROM
    country c
JOIN
    city ci ON c.code = ci.country_code
GROUP BY
    c.code, c.name, c.population
ORDER BY
    total_city_population DESC;

SELECT * FROM city;
SELECT * FROM country;



SELECT
    c.name AS country_name,
    ci.name AS capital_city
FROM
    country c
JOIN
    city ci ON c.capital = ci.id
	WHERE continent = 'Europe';
