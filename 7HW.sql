--Задания:

    --Представления (Views)
        --Создайте представление CustomerMovieRentalView, которое объединяет информацию о клиентах и фильмах, которые они брали в аренду. Включите следующие столбцы:
       CREATE VIEW CustomerMovieRentalView AS SELECT c.first_name, c.last_name, c.email, m.title as film, r.rental_date FROM customers c JOIN rentals r ON r.customer_id = c.customer_id JOIN movies m ON r.movie_id=m.movie_id;
	  
	  --Напишите запрос, который покажет все фильмы, взятые в аренду клиентами в марте 2022 года, используя созданное представление.
	     select film from CustomerMovieRentalView WHERE rental_date>'2022-03-01' AND rental_date < '2022-04-01'



--Триггеры (Triggers)
        --Создайте триггер, который автоматически обновляет поле rental_date в таблице Rental на текущую дату, если пользователь пытается вставить запись с пустым значением rental_date. Используйте BEFORE INSERT триггер.

      create or replace function fill_rental_date()
		returns trigger
		language plpgsql
		as $$
		begin
		  if rental_date is null then
		new.rental_date := CURRENT_DATE;
		
		  return new;
		  end if;
		    return null;
		
		end;
		$$;
		
		create trigger fill_rental_date
		before insert or update of rental_date
		on rentals
			for each row execute function fill_rental_date();


        --Создайте триггер, который предотвращает удаление записей о фильмах, если они связаны с таблицей Rental. Используйте BEFORE DELETE триггер.

	create or replace function keep_rented_films()
	returns trigger
	language plpgsql
	as $$
	begin
	 select count(*) as rents from rentals where movie_id=old.movie_id;
	  if (rents > 0) then
	    RAISE EXCEPTION 'Запрещено удаление фильма котоырй ранее был арендован';
	  end if;

	return null;
	end;
	$$;
	
	CREATE TRIGGER emp_audit
	BEFORE DELETE ON movies
	    FOR EACH ROW EXECUTE function keep_rented_films();






    -- Последовательности (Sequences)
    --     Создайте последовательность actor_sequence, которая будет генерировать уникальные значения для новых актеров. Начальное значение должно быть 1000, шаг увеличения — 1.

CREATE SEQUENCE actor_sequence
AS bigint
START WITH 1000
INCREMENT BY 1
NO CYCLE
OWNED BY actors.actor_id

	
    --     Добавьте нового актера в таблицу Actor, используя значение из созданной последовательности для поля actor_id.

insert into actors values (nextval('actor_sequence'), 'Tom', 'Holand', '1996-06-01', 'British');


    --     Обновите последовательность, чтобы начальное значение было на 10 больше последнего созданного значения. Проверьте изменение.

select setval('actor_sequence', currval('actor_sequence')+10, true);
select currval('actor_sequence');


    -- Триггеры (Triggers)
    --     Создайте триггер, который при обновлении поля return_date в таблице Rental устанавливает текущую дату, если поле NULL, и оставляет значение без изменений, если оно больше текущей даты.
    --     Создайте триггер, который будет записывать информацию о каждом удалении записи из таблицы Customer в отдельную таблицу Customer_Deletion_Log. Запись должна включать ID клиента, дату удаления и email клиента.
    --     Создайте триггер, который после добавления новой записи в таблицу Movie автоматически будет увеличивать количество фильмов данного жанра в таблице Genre_Statistics. Если запись о жанре уже существует, увеличьте счетчик на 1; если не существует, создайте новую запись для этого жанра.


