--Напишите запрос, который выводит название фильма и список языков, на которых доступен фильм. 
-- Используйте функции работы с JSON для извлечения массива языков из поля additional_info.


SELECT title, additional_info->'languages' from movies  

--Напишите запрос, который выводит список фильмов, бюджет которых превышает 100 миллионов 
-- долларов. Бюджет хранится в поле additional_info внутри ключа budget.


SELECT title, additional_info->'budget'  FROM movies  WHERE (additional_info->'budget')::INT > 100000000


--Напишите запрос, который для каждого клиента создаёт JSON-объект с полями full_name
-- (содержащим полное имя клиента) и contact (содержащим email и номер телефона). 
-- Выведите customer_id и созданный JSON-объект.


UPDATE customers
SET profile = profile, {full_name})


--Напишите запрос, который добавляет новый предпочитаемый жанр ""Drama"" в список 
-- preferred_genres для всех клиентов, которые подписаны на рассылку новостей
-- (ключ newsletter имеет значение true).


UPDATE customers 
SET preferences = jsonb_set(
	preferences, '{preferred_genres}', COALESCE(preferences->'preferred_genres', '[]'::JSONB) || '["Drama"]'::JSONB)
WHERE (preferences->'newsletter')::BOOL = true


-- Напишите запрос, который вычисляет средний бюджет фильмов по жанрам. Учтите, 
-- что жанр хранится в поле genre таблицы Movie, а бюджет — внутри JSON-поля additional_info.


SELECT genre, AVG((additional_info->'budget')::INT) from movies GROUP BY genre
