-- explain analyze ДО

"Limit  (cost=49.47..49.48 rows=1 width=541) (actual time=0.888..0.890 rows=5 loops=1)"
"  ->  Sort  (cost=49.47..49.48 rows=1 width=541) (actual time=0.888..0.888 rows=5 loops=1)"
"        Sort Key: (count(rentals.rental_id)) DESC, (max(rentals.rental_date)) DESC"
"        Sort Method: quicksort  Memory: 25kB"
"        ->  GroupAggregate  (cost=49.43..49.46 rows=1 width=541) (actual time=0.869..0.872 rows=5 loops=1)"
"              Group Key: customers.first_name, customers.last_name, movies.title"
"              ->  Sort  (cost=49.43..49.44 rows=1 width=537) (actual time=0.863..0.864 rows=5 loops=1)"
"                    Sort Key: customers.first_name, customers.last_name, movies.title"
"                    Sort Method: quicksort  Memory: 25kB"
"                    ->  Nested Loop  (cost=0.00..49.42 rows=1 width=537) (actual time=0.788..0.844 rows=5 loops=1)"
"                          Join Filter: (customers.customer_id = rentals.customer_id)"
"                          Rows Removed by Join Filter: 81"
"                          ->  Nested Loop  (cost=0.00..46.73 rows=1 width=528) (actual time=0.538..0.573 rows=5 loops=1)"
"                                Join Filter: (movies.movie_id = rentals.movie_id)"
"                                Rows Removed by Join Filter: 145"
"                                ->  Seq Scan on movies  (cost=0.00..11.12 rows=1 width=520) (actual time=0.287..0.296 rows=5 loops=1)"
"                                      Filter: ((genre)::text = 'Action'::text)"
"                                      Rows Removed by Filter: 25"
"                                ->  Seq Scan on rentals  (cost=0.00..35.50 rows=8 width=16) (actual time=0.050..0.053 rows=30 loops=5)"
"                                      Filter: ((rental_date >= '2021-01-01'::date) AND (rental_date <= '2022-12-31'::date))"
"                          ->  Seq Scan on customers  (cost=0.00..2.31 rows=31 width=17) (actual time=0.050..0.051 rows=17 loops=5)"
"Planning Time: 2.150 ms"
"Execution Time: 0.917 ms"


  -- так как в запросе есть фильтрация по жанру и соединение по movie_id таблицы Movies - добавила индекс. 
  -- так же по таблице Rentals идет фильтрация по rental_date и соединение по movie_id, customer_id - добавила индекс. 
  -- и добавим индекс по имени и фамилии клиентов чтобы быстро их доставать в запросе 

  
CREATE INDEX idx_movies_genre_id ON Movies(genre, movie_id);

CREATE INDEX idx_rentals_date_movie_customer ON Rentals(rental_date, movie_id, customer_id);

CREATE INDEX idx_customers_id_names ON Customers(customer_id, first_name, last_name);


-- explain analyze ПОСЛЕ

"  ->  Sort  (cost=6.33..6.34 rows=1 width=541) (actual time=0.162..0.163 rows=5 loops=1)"
"        Sort Key: (count(rentals.rental_id)) DESC, (max(rentals.rental_date)) DESC"
"        Sort Method: quicksort  Memory: 25kB"
"        ->  GroupAggregate  (cost=6.30..6.32 rows=1 width=541) (actual time=0.154..0.158 rows=5 loops=1)"
"              Group Key: customers.first_name, customers.last_name, movies.title"
"              ->  Sort  (cost=6.30..6.30 rows=1 width=537) (actual time=0.150..0.152 rows=5 loops=1)"
"                    Sort Key: customers.first_name, customers.last_name, movies.title"
"                    Sort Method: quicksort  Memory: 25kB"
"                    ->  Nested Loop  (cost=1.46..6.29 rows=1 width=537) (actual time=0.031..0.139 rows=5 loops=1)"
"                          Join Filter: (rentals.movie_id = movies.movie_id)"
"                          Rows Removed by Join Filter: 135"
"                          ->  Hash Join  (cost=1.46..3.90 rows=1 width=25) (actual time=0.026..0.035 rows=30 loops=1)"
"                                Hash Cond: (customers.customer_id = rentals.customer_id)"
"                                ->  Seq Scan on customers  (cost=0.00..2.31 rows=31 width=17) (actual time=0.006..0.008 rows=31 loops=1)"
"                                ->  Hash  (cost=1.45..1.45 rows=1 width=16) (actual time=0.014..0.015 rows=30 loops=1)"
"                                      Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                      ->  Seq Scan on rentals  (cost=0.00..1.45 rows=1 width=16) (actual time=0.004..0.008 rows=30 loops=1)"
"                                            Filter: ((rental_date >= '2021-01-01'::date) AND (rental_date <= '2022-12-31'::date))"
"                          ->  Seq Scan on movies  (cost=0.00..2.38 rows=1 width=520) (actual time=0.001..0.003 rows=5 loops=30)"
"                                Filter: ((genre)::text = 'Action'::text)"
"                                Rows Removed by Filter: 23"
"Planning Time: 0.461 ms"
"Execution Time: 0.195 ms"
