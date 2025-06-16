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


SELECT
    c.name AS country_name,
    ci.name AS capital_city
FROM
    country c
JOIN
    city ci ON c.capital = ci.id
	WHERE continent = 'Europe';

