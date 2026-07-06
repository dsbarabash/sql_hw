-- Задания:

--     Создайте функцию GetMovieDurationInHours, которая принимает movie_id в качестве параметра и возвращает продолжительность фильма в часах (округленную до двух знаков после запятой).

create or replace function GetMovieDurationInHours(m_id int)
returns numeric
as $$
declare
  h_duration numeric;
  m_duration numeric;
begin
SELECT duration / 60 INTO h_duration 
    FROM movies 
    WHERE movie_id = m_id;

SELECT duration % 60 INTO m_duration 
    FROM movies 
    WHERE movie_id = 1;
	
return round(h_duration + m_duration/100, 2);
end;
$$ language plpgsql;


SELECT * FROM GetMovieDurationInHours(1);


--     Создайте функцию GetMoviesByDirector, которая принимает имя режиссера в качестве параметра и возвращает таблицу с названием фильма, годом выпуска и жанром для всех фильмов этого режиссера.

create or replace function GetMoviesByDirector(d TEXT)
returns table (
  title  varchar(255),
  release_year int,
  genre      varchar(100)
  )
as $$

begin
return query
	select m.title, m.release_year, m.genre from movies m
	WHERE  m.additional_info ->> 'director' = d;
	
end;
$$ language plpgsql;


SELECT * FROM GetMoviesByDirector('James Cameron');


-- Задание со звездочкой - выполняется по желанию

--     Создайте функцию CalculateCustomerRentalCost, которая принимает customer_id и возвращает общую стоимость всех аренд этого клиента, основываясь на фиксированной цене аренды одного фильма (например, 5 долларов).

create or replace function CalculateCustomerRentalCost(c_id int, price float)
returns numeric
as $$
declare
  rental_date date;
  return_date date;
  days int;
begin

  SELECT r.rental_date, r.return_date INTO rental_date, return_date  from rentals r WHERE customer_id = c_id;
	
  SELECT (return_date - rental_date ) INTO days;
  return days*price;
	
end;
$$ language plpgsql;

SELECT * FROM CalculateCustomerRentalCost(3, 5);


--     Создайте функцию GetCustomerStatus, которая принимает customer_id и возвращает статус клиента в зависимости от количества аренд.

--     Если клиент арендовал более 10 фильмов, вернуть статус 'VIP'.
--     Если клиент арендовал от 5 до 10 фильмов, вернуть статус 'Regular'.
--     Если клиент арендовал менее 5 фильмов, вернуть статус 'Newbie'.

create or replace function GetCustomerStatus(c_id int)
returns text
as $$
declare
  total int;

begin

  select count(*) from rentals INTO total WHERE customer_id = c_id;
	
  if total > 10 then
   return 'VIP';
  elsif  total <5 then 
   return 'Newbie';
   else 
   return 'Regular';
 end if;

	
end;
$$ language plpgsql;

SELECT * FROM GetCustomerStatus(4);


--     Создайте функцию GetMostPopularGenre, которая возвращает жанр, по которому арендовали больше всего фильмов.Функция не принимает параметров и возвращает строку с названием самого популярного жанра.


