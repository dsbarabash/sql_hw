-- Задания:

--     1. Создайте хранимую процедуру AddNewMovie, которая добавляет новый фильм в таблицу Movie, но только если фильма с таким названием и годом выпуска еще нет в базе данных. Если фильм существует, процедура должна вывести сообщение о наличии дубля.

create or replace procedure AddNewMovie(
  title text,
  release_year text,
  genre text,
  raiting numeric,
  duration int,
  description text,
  addition jsonb
)
language plpgsql
as $$
declare
  total int;
begin
  select count(*) from movies m INTO total where m.title=title AND m.realese_year=release_year;
  if total >0 then
   raise notice '[лог] Фильм с таким названием и годом выпуска уже существует';
  else 
   insert into movies (title, release_year, genre, raiting, duration, description, additional_info)
   VALUES (title, release_year, genre, raiting, duration, description, addition);
  end if;
end;
$$;

--     2. Создайте хранимую процедуру GetCustomerRentalCount, которая принимает customer_id и возвращает количество фильмов, которые этот клиент арендовал, а также сумму всех аренд (общее количество записей).

create or replace procedure GetCustomerRentalCount(
  c_id int,
  films_count out int,
  total out int
)
language plpgsql
as $$
begin
  select count(*) from rentals r INTO total where customer_id=c_id;
  select count(distinct movie_id) from rentals INTO films_count where customer_id=c_id;
end;
$$;


-- Задание со звездочкой - выполняется по желанию

--     3. Создайте хранимую процедуру UpdateMovieRating, которая обновляет рейтинг фильма. Процедура должна принимать movie_id и новый рейтинг, но только если новый рейтинг находится в пределах от 0.0 до 10.0. Если рейтинг выходит за эти рамки, выведите сообщение об ошибке.

create or replace procedure UpdateMovieRating(
  m_id int,
  new_rating numeric
)
language plpgsql
as $$
begin
  if new_rating < 0.0 OR new_rating > 10.0 then
     raise exception 'значение рейтинга должно быть от 0 до 10';
  else
     update movies set rating=new_rating where customer_id=c_id;
  end if;
end;
$$;


--     4. Создайте хранимую процедуру DeleteCustomerWithLog, которая удаляет клиента из таблицы Customer, а информацию об удалении (ID клиента, email, дата удаления) записывает в лог-таблицу Customer_Deletion_Log.

create or replace procedure DeleteCustomerWithLog(
  c_id int
)
language plpgsql
as $$
declare
  em text;
begin
	select email INTO em from customers WHERE customer_id=c_id;
	delete from client where customer_id=c_id;
	insert into Customer_Deletion_Log(customer_id, email, deletion_date) VALUES (c_id, em, CURRENT_DATE);
end;
$$;


--     5. Создайте хранимую процедуру CalculateRentalRevenue, которая рассчитывает общую выручку от аренды фильмов для указанного клиента. Процедура должна принимать customer_id в качестве параметра, подсчитывать общую сумму аренд на основе фиксированной стоимости аренды каждого фильма (например, 5 долларов за фильм) и выводить результат.
