SELECT
    c.name AS country_name,
    ci.name AS capital_city
FROM
    country c
JOIN
    city ci ON c.capital = ci.id
	WHERE continent = 'Europe';

