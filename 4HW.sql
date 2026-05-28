--- Напишите запрос, который выводит список фильмов вместе с именами и фамилиями актеров, сыгравших в них. Отсортируйте результат по названию фильма и фамилии актера.

SELECT 
    m.title AS movie_title, 
    a.first_name AS actor_first_name, 
    a.last_name AS actor_last_name
FROM 
    movies AS m
JOIN 
    movie_actors AS ma ON m.movie_id = ma.movie_id 
JOIN 
    actors AS a ON ma.actor_id = a.actor_id
ORDER BY 
    m.title ASC, 
    a.last_name ASC


-- Напишите запрос, который выводит список всех клиентов и, если они совершали аренды, то укажите дату последней аренды. Если клиент не совершал аренды, дата аренды должна быть NULL.

select
    c.last_name, c.first_name, MAX(r.rental_date)
FROM 
    customers AS c
LEFT JOIN 
    rentals AS r ON c.customer_id=r.customer_id 
GROUP BY
    c.first_name, c.last_name
ORDER BY 
    c.last_name ASC


-- Напишите запрос, который выводит название фильмов, чья продолжительность больше средней продолжительности всех фильмов в базе данных.

SELECT 
    title
FROM 
    movies 
WHERE 
    duration > (select AVG(duration) from movies)
ORDER BY
	duration


-- * Используя CTE, напишите запрос, который вычисляет количество аренд для каждого жанра и выводит жанры с общим количеством аренд, отсортированных по количеству аренд в порядке убывания.

WITH cte AS (
    select movie_id, genre from movies 
)
SELECT 
	o.genre, count(r.movie_id)
FROM 
	rentals r
join 
	cte o on r.movie_id=o.movie_id
group by 
	o.genre
order by 
	count desc


-- * Напишите запрос, который выводит список всех уникальных имен актеров и клиентов в одном столбце. Укажите, что это за тип лица с помощью дополнительного столбца (например, ""Актер"" или ""Клиент"").

SELECT first_name, 'Актер' AS тип FROM actors
UNION
SELECT first_name, 'Клиент' AS тип FROM customers



