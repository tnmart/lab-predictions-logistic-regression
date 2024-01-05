USE sakila;

SELECT
    f.title AS unique_film,
    f.rental_rate,
    f.rating,
    f.length,
    c.name AS film_category,
    COUNT(r.rental_id) AS total_rentals,
    MAX(CASE WHEN YEAR(r.rental_date) = 2005 AND MONTH (r.rental_date) = 05
		THEN True
        ELSE False
	END) AS "rented_in_may"
FROM film AS f
LEFT JOIN inventory AS i
ON f.film_id = i.film_id
LEFT JOIN rental AS r
ON i.inventory_id = r.inventory_id
JOIN film_category as fc
ON f.film_id = fc.film_id
JOIN category AS c
ON c.category_id = fc.category_id
GROUP BY unique_film, f.rental_rate, f.rating, f.length, film_category;