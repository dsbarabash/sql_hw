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
