-- Напишите запрос, который выводит название фильма и список языков, на которых доступен фильм. 
-- Используйте функции работы с JSON для извлечения массива языков из поля additional_info.

SELECT title, additional_info->'languages' FROM movies  

	
--Напишите запрос, который выводит список фильмов, бюджет которых превышает 100 миллионов 
-- долларов. Бюджет хранится в поле additional_info внутри ключа budget.

SELECT title, additional_info->'budget' FROM movies WHERE (additional_info->'budget')::INT > 100000000


-- Напишите запрос, который для каждого клиента создаёт JSON-объект с полями full_name
-- (содержащим полное имя клиента) и contact (содержащим email и номер телефона). 
-- Выведите customer_id и созданный JSON-объект.

SELECT json_build_object(
	'full_name', CONCAT(first_name, last_name),
	'contact', CONCAT(email, phone_number)
) as customer_json
FROM customers


-- Напишите запрос, который добавляет новый предпочитаемый жанр ""Drama"" в список 
-- preferred_genres для всех клиентов, которые подписаны на рассылку новостей
-- (ключ newsletter имеет значение true).

UPDATE customers 
SET preferences = jsonb_set(
	preferences, '{preferred_genres}', COALESCE(preferences->'preferred_genres', '[]'::JSONB) || '["Drama"]'::JSONB)
WHERE (preferences->'newsletter')::BOOL = true


-- Напишите запрос, который вычисляет средний бюджет фильмов по жанрам. Учтите, 
-- что жанр хранится в поле genre таблицы Movie, а бюджет — внутри JSON-поля additional_info.

SELECT genre, AVG((additional_info->'budget')::INT) from movies GROUP BY genre


-- Задание со звездочкой - выполняется по желанию.
-- 6. Напишите запрос, который выводит список клиентов, у которых в preferences указан предпочитаемый актёр ""Leonardo DiCaprio"".

SELECT *  FROM customers  WHERE preferences->'preferred_actors' @> '["Leonardo DiCaprio"]'::JSONB


-- 7. Напишите запрос, который выводит список фильмов, отсортированных по значению кассовых сборов box_office из поля additional_info в порядке убывания.

SELECT title, additional_info->'box_office' from movies order by additional_info->'box_office' DESC

-- 8. Напишите запрос, который выводит название фильма, его жанр и количество наград (awards) из additional_info.

SELECT title, genre, additional_info->'awards' as awards from movies 

-- 9. Напишите запрос, который подсчитывает количество фильмов, имеющих более чем одну награду в поле awards внутри additional_info.

SELECT count(title) from movies where jsonb_array_length(additional_info->'awards') > 1

-- 10. Напишите запрос, который удаляет ключ preferred_actors из поля preferences для всех клиентов. 

UPDATE customers 
SET preferences = preferences - 'preferred_actors'

