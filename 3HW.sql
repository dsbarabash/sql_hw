    
-- Задания:

SELECT COALESCE(rating, 0) FROM movies WHERE rating=0;
SELECT title, CEIL(rating) FROM movies;
SELECT * FROM customers  where registration_date>CURRENT_DATE-30;
SELECT c.customer_id, c.first_name, c.last_name, r.movie_id, SUM(r.return_date - r.rental_date) AS rental_days FROM rentals r JOIN customers c ON c.customer_id=r.customer_id GROUP BY c.customer_id, r.movie_id;
SELECT UPPER(title) FROM movies;






-- Задания со звездочкой - выполняются по желанию:

SELECT substring(description for 50) FROM movies;
SELECT genre, count(genre) FROM movies GROUP BY genre;
SELECT title, rating FROM movies ORDER BY rating DESC;
SELECT title, rating, LAG(rating, 1) OVER (ORDER BY rating DESC) AS previous_rating FROM movies ORDER BY rating DESC; 
SELECT genre, (COUNT(genre)), ROUND(AVG(rating), 2) FROM movies GROUP BY genre, rating;


