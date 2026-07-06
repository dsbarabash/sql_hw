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


--     Создайте функцию GetMoviesByDirector, которая принимает имя режиссера в качестве параметра и возвращает таблицу с названием фильма, годом выпуска и жанром для всех фильмов этого режиссера.

