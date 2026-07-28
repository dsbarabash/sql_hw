-- 1. 
-- нужно удалить индексы и вставлять пачками по 500 клиентов

INSERT INTO customers (first_name, last_name, email, phone_number, address, registration_date, preferences) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', '2022-01-15', 
 '{"preferred_genres": ["Action", "Sci-Fi"], "preferred_actors": ["Leonardo DiCaprio"], "newsletter": true, "notifications": {"email": true, "sms": false}}'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Elm St', '2022-02-20', 
 '{"preferred_genres": ["Drama"], "preferred_actors": ["Scarlett Johansson"], "newsletter": false, "notifications": {"email": false, "sms": true}}'),
('Michael', 'Johnson', 'michael.johnson@example.com', '3456789012', '789 Oak St', '2022-03-05', 
 '{"preferred_genres": ["Comedy", "Romance"], "preferred_actors": ["Brad Pitt"], "newsletter": true, "notifications": {"email": true, "sms": true}}'),
('Emily', 'Davis', 'emily.davis@example.com', '4567890123', '135 Pine St', '2022-04-12', 
 '{"preferred_genres": ["Action"], "preferred_actors": ["Tom Cruise"], "newsletter": true, "notifications": {"email": false, "sms": false}}'),
('William', 'Brown', 'william.brown@example.com', '5678901234', '246 Maple St', '2022-05-25', 
 '{"preferred_genres": ["Sci-Fi", "Fantasy"], "preferred_actors": ["Robert Downey Jr."], "newsletter": false, "notifications": {"email": true, "sms": false}}'),
('Olivia', 'Wilson', 'olivia.wilson@example.com', '6789012345', '357 Cedar St', '2022-06-30', 
 '{"preferred_genres": ["Animation"], "preferred_actors": ["Chris Pratt"], "newsletter": true, "notifications": {"email": true, "sms": true}}'),
('James', 'Taylor', 'james.taylor@example.com', '7890123456', '468 Spruce St', '2022-07-08', 
 '{"preferred_genres": ["Action"], "preferred_actors": ["Chris Hemsworth"], "newsletter": false, "notifications": {"email": false, "sms": false}}'),
('Sophia', 'Anderson', 'sophia.anderson@example.com', '8901234567', '579 Birch St', '2022-08-15', 
 '{"preferred_genres": ["Drama", "Romance"], "preferred_actors": ["Emma Stone"], "newsletter": true}'),
('Benjamin', 'Thomas', 'benjamin.thomas@example.com', '9012345678', '680 Walnut St', '2022-09-22', 
 '{"preferred_genres": ["Comedy"], "preferred_actors": ["Will Smith"], "newsletter": false}'),
('Isabella', 'Jackson', 'isabella.jackson@example.com', '0123456789', '791 Cherry St', '2022-10-01', 
 '{"preferred_genres": ["Sci-Fi"], "preferred_actors": ["Natalie Portman"], "newsletter": true}'),
('Daniel', 'White', 'daniel.white@example.com', '1023456789', '802 Ash St', '2022-11-11', 
 '{"preferred_genres": ["Thriller"], "preferred_actors": ["Morgan Freeman"], "newsletter": true}'),
('Mia', 'Harris', 'mia.harris@example.com', '1123456789', '913 Willow St', '2022-12-20', 
 '{"preferred_genres": ["Animation"], "preferred_actors": ["Tom Hanks"], "newsletter": false}'),
('Ethan', 'Martin', 'ethan.martin@example.com', '1223456789', '124 Poplar St', '2021-01-05', 
 '{"preferred_genres": ["Action"], "preferred_actors": ["Dwayne Johnson"], "newsletter": true}'),
('Charlotte', 'Thompson', 'charlotte.thompson@example.com', '1323456789', '235 Fir St', '2021-02-14', 
 '{"preferred_genres": ["Drama"], "preferred_actors": ["Meryl Streep"], "newsletter": true}'),
('Alexander', 'Garcia', 'alexander.garcia@example.com', '1423456789', '346 Cypress St', '2021-03-23', 
 '{"preferred_genres": ["Sci-Fi"], "preferred_actors": ["Matt Damon"], "newsletter": false}'),
('Amelia', 'Martinez', 'amelia.martinez@example.com', '1523456789', '457 Sycamore St', '2021-04-30', 
 '{"preferred_genres": ["Comedy"], "preferred_actors": ["Jennifer Lawrence"], "newsletter": true}'),
('Jacob', 'Robinson', 'jacob.robinson@example.com', '1623456789', '568 Palm St', '2021-05-07', 
 '{"preferred_genres": ["Action", "Thriller"], "preferred_actors": ["Samuel L. Jackson"], "newsletter": true}'),
('Harper', 'Clark', 'harper.clark@example.com', '1723456789', '679 Redwood St', '2021-06-16', 
 '{"preferred_genres": ["Animation"], "preferred_actors": ["Ellen DeGeneres"], "newsletter": false}'),
('Michael', 'Rodriguez', 'michael.rodriguez@example.com', '1823456789', '780 Magnolia St', '2021-07-25', 
 '{"preferred_genres": ["Drama"], "preferred_actors": ["Bradley Cooper"], "newsletter": true}'),
('Evelyn', 'Lewis', 'evelyn.lewis@example.com', '1923456789', '891 Dogwood St', '2021-08-02', 
 '{"preferred_genres": ["Romance"], "preferred_actors": ["Ryan Gosling"], "newsletter": true}'),
('Daniel', 'Lee', 'daniel.lee@example.com', '2023456789', '902 Hickory St', '2021-09-09', 
 '{"preferred_genres": ["Sci-Fi"], "preferred_actors": ["Harrison Ford"], "newsletter": false}'),
('Sofia', 'Walker', 'sofia.walker@example.com', '2123456789', '103 Juniper St', '2021-10-18', 
 '{"preferred_genres": ["Comedy"], "preferred_actors": ["Steve Carell"], "newsletter": true}'),
('Matthew', 'Hall', 'matthew.hall@example.com', '2223456789', '214 Hemlock St', '2021-11-27', 
 '{"preferred_genres": ["Action"], "preferred_actors": ["Chris Evans"], "newsletter": true}'),
('Avery', 'Allen', 'avery.allen@example.com', '2323456789', '325 Cottonwood St', '2021-12-06', 
 '{"preferred_genres": ["Drama"], "preferred_actors": ["Anne Hathaway"], "newsletter": false}'),
('Joseph', 'Young', 'joseph.young@example.com', '2423456789', '436 Beech St', '2020-01-13', 
 '{"preferred_genres": ["Thriller"], "preferred_actors": ["Kevin Spacey"], "newsletter": true}'),
('Ella', 'Hernandez', 'ella.hernandez@example.com', '2523456789', '547 Aspen St', '2020-02-22', 
 '{"preferred_genres": ["Animation"], "preferred_actors": ["Idina Menzel"], "newsletter": true}'),
('David', 'King', 'david.king@example.com', '2623456789', '658 Alder St', '2020-03-31', 
 '{"preferred_genres": ["Sci-Fi"], "preferred_actors": ["Keanu Reeves"], "newsletter": false}'),
('Abigail', 'Wright', 'abigail.wright@example.com', '2723456789', '769 Cedar St', '2020-04-09', 
 '{"preferred_genres": ["Romance"], "preferred_actors": ["Julia Roberts"], "newsletter": true}'),
('Christopher', 'Lopez', 'christopher.lopez@example.com', '2823456789', '870 Sequoia St', '2020-05-18', 
 '{"preferred_genres": ["Action"], "preferred_actors": ["Bruce Willis"], "newsletter": true}'),
('Avery', 'Hill', 'avery.hill@example.com', '2923456789', '981 Redwood St', '2020-06-27', 
 '{"preferred_genres": ["Comedy"], "preferred_actors": ["Jim Carrey"], "newsletter": false}'),
('Andrew', 'Scott', 'andrew.scott@example.com', '3023456789', '192 Cedar St', '2020-07-06', 
 '{"preferred_genres": ["Drama"], "preferred_actors": ["Tom Hanks"], "newsletter": true}');

  


--2. 
-- Создадим индекс
  CREATE INDEX idx_movies_release_year ON movies(release_year);

-- вызовем апдейт
UPDATE movies
SET rating = LEAST(rating + 0.2, 10.0)
WHERE release_year > 2015 
  AND rating < 10.0;
  



-- EXPLAIN ANALYZE ДО 

/*
"Limit  (cost=15.62..15.65 rows=1 width=122) (actual time=0.188..0.190 rows=0 loops=1)"
"  ->  Unique  (cost=15.62..15.65 rows=1 width=122) (actual time=0.187..0.189 rows=0 loops=1)"
"        ->  Sort  (cost=15.62..15.62 rows=1 width=122) (actual time=0.187..0.189 rows=0 loops=1)"
"              Sort Key: (count(r.rental_id)) DESC, (max(r.return_date)) DESC, c.customer_id, c.first_name, c.last_name, c.email, c.registration_date, (COALESCE(sum(CASE WHEN (r.return_date IS NULL) THEN 1 ELSE 0 END), '0'::bigint)), ((SubPlan 1)), ((SubPlan 2)), ((SubPlan 3)), (sum(CASE WHEN ((m.genre)::text = 'Action'::text) THEN 1 ELSE 0 END))"
"              Sort Method: quicksort  Memory: 25kB"
"              ->  GroupAggregate  (cost=6.42..15.61 rows=1 width=122) (actual time=0.161..0.163 rows=0 loops=1)"
"                    Group Key: c.customer_id"
"                    Filter: (count(r.rental_id) > 10)"
"                    Rows Removed by Filter: 30"
"                    ->  Sort  (cost=6.42..6.43 rows=1 width=272) (actual time=0.140..0.143 rows=30 loops=1)"
"                          Sort Key: c.customer_id"
"                          Sort Method: quicksort  Memory: 27kB"
"                          ->  Hash Join  (cost=3.90..6.41 rows=1 width=272) (actual time=0.100..0.122 rows=30 loops=1)"
"                                Hash Cond: (c.customer_id = r.customer_id)"
"                                ->  Seq Scan on customers c  (cost=0.00..2.39 rows=31 width=46) (actual time=0.007..0.022 rows=31 loops=1)"
"                                      Filter: (registration_date <= '2022-12-31'::date)"
"                                ->  Hash  (cost=3.88..3.88 rows=1 width=230) (actual time=0.076..0.077 rows=30 loops=1)"
"                                      Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                      ->  Hash Join  (cost=1.46..3.88 rows=1 width=230) (actual time=0.047..0.057 rows=30 loops=1)"
"                                            Hash Cond: (m.movie_id = r.movie_id)"
"                                            ->  Seq Scan on movies m  (cost=0.00..2.30 rows=30 width=222) (actual time=0.005..0.008 rows=30 loops=1)"
"                                            ->  Hash  (cost=1.45..1.45 rows=1 width=16) (actual time=0.026..0.026 rows=30 loops=1)"
"                                                  Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                                  ->  Seq Scan on rentals r  (cost=0.00..1.45 rows=1 width=16) (actual time=0.003..0.007 rows=30 loops=1)"
"                                                        Filter: ((rental_date >= '2020-01-01'::date) AND (rental_date <= '2022-12-31'::date))"
"                    SubPlan 1"
"                      ->  Aggregate  (cost=3.78..3.79 rows=1 width=8) (never executed)"
"                            ->  Sort  (cost=3.77..3.78 rows=1 width=4) (never executed)"
"                                  Sort Key: m_1.movie_id"
"                                  ->  Nested Loop  (cost=0.00..3.76 rows=1 width=4) (never executed)"
"                                        Join Filter: (m_1.movie_id = r2.movie_id)"
"                                        ->  Seq Scan on movies m_1  (cost=0.00..2.38 rows=1 width=4) (never executed)"
"                                              Filter: ((genre)::text = 'Drama'::text)"
"                                        ->  Seq Scan on rentals r2  (cost=0.00..1.38 rows=1 width=4) (never executed)"
"                                              Filter: (customer_id = c.customer_id)"
"                    SubPlan 2"
"                      ->  Aggregate  (cost=3.81..3.82 rows=1 width=32) (never executed)"
"                            ->  Hash Join  (cost=1.39..3.81 rows=1 width=12) (never executed)"
"                                  Hash Cond: (m2.movie_id = r3.movie_id)"
"                                  ->  Seq Scan on movies m2  (cost=0.00..2.30 rows=30 width=16) (never executed)"
"                                  ->  Hash  (cost=1.38..1.38 rows=1 width=4) (never executed)"
"                                        ->  Seq Scan on rentals r3  (cost=0.00..1.38 rows=1 width=4) (never executed)"
"                                              Filter: (customer_id = c.customer_id)"
"                    SubPlan 3"
"                      ->  Aggregate  (cost=1.53..1.54 rows=1 width=8) (never executed)"
"                            ->  Seq Scan on rentals r4  (cost=0.00..1.52 rows=1 width=4) (never executed)"
"                                  Filter: ((rental_date >= '2021-01-01'::date) AND (rental_date <= '2022-12-31'::date) AND (customer_id = c.customer_id))"
"Planning Time: 1.311 ms"
"Execution Time: 0.356 ms"
*/
  
CREATE INDEX idx_rental_customer_date ON Rentals (customer_id, rental_date, movie_id, return_date, rental_id);

CREATE INDEX idx_rental_customer_movie ON Rentals (customer_id, movie_id);

CREATE INDEX idx_customer_reg_date ON Customers (registration_date, customer_id) 
INCLUDE (first_name, last_name, email);

CREATE INDEX idx_movie_genre ON Movies (movie_id, genre) INCLUDE (rating);

-- EXPLAIN ANALYZE ПОСЛЕ 

/*
"Limit  (cost=15.62..15.65 rows=1 width=122) (actual time=0.097..0.100 rows=0 loops=1)"
"  ->  Unique  (cost=15.62..15.65 rows=1 width=122) (actual time=0.096..0.098 rows=0 loops=1)"
"        ->  Sort  (cost=15.62..15.62 rows=1 width=122) (actual time=0.096..0.098 rows=0 loops=1)"
"              Sort Key: (count(r.rental_id)) DESC, (max(r.return_date)) DESC, c.customer_id, c.first_name, c.last_name, c.email, c.registration_date, (COALESCE(sum(CASE WHEN (r.return_date IS NULL) THEN 1 ELSE 0 END), '0'::bigint)), ((SubPlan 1)), ((SubPlan 2)), ((SubPlan 3)), (sum(CASE WHEN ((m.genre)::text = 'Action'::text) THEN 1 ELSE 0 END))"
"              Sort Method: quicksort  Memory: 25kB"
"              ->  GroupAggregate  (cost=6.42..15.61 rows=1 width=122) (actual time=0.085..0.087 rows=0 loops=1)"
"                    Group Key: c.customer_id"
"                    Filter: (count(r.rental_id) > 10)"
"                    Rows Removed by Filter: 30"
"                    ->  Sort  (cost=6.42..6.43 rows=1 width=272) (actual time=0.067..0.069 rows=30 loops=1)"
"                          Sort Key: c.customer_id"
"                          Sort Method: quicksort  Memory: 27kB"
"                          ->  Hash Join  (cost=3.90..6.41 rows=1 width=272) (actual time=0.050..0.059 rows=30 loops=1)"
"                                Hash Cond: (c.customer_id = r.customer_id)"
"                                ->  Seq Scan on customers c  (cost=0.00..2.39 rows=31 width=46) (actual time=0.009..0.013 rows=31 loops=1)"
"                                      Filter: (registration_date <= '2022-12-31'::date)"
"                                ->  Hash  (cost=3.88..3.88 rows=1 width=230) (actual time=0.034..0.034 rows=30 loops=1)"
"                                      Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                      ->  Hash Join  (cost=1.46..3.88 rows=1 width=230) (actual time=0.021..0.030 rows=30 loops=1)"
"                                            Hash Cond: (m.movie_id = r.movie_id)"
"                                            ->  Seq Scan on movies m  (cost=0.00..2.30 rows=30 width=222) (actual time=0.004..0.006 rows=30 loops=1)"
"                                            ->  Hash  (cost=1.45..1.45 rows=1 width=16) (actual time=0.012..0.012 rows=30 loops=1)"
"                                                  Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                                  ->  Seq Scan on rentals r  (cost=0.00..1.45 rows=1 width=16) (actual time=0.003..0.007 rows=30 loops=1)"
"                                                        Filter: ((rental_date >= '2020-01-01'::date) AND (rental_date <= '2022-12-31'::date))"
"                    SubPlan 1"
"                      ->  Aggregate  (cost=3.78..3.79 rows=1 width=8) (never executed)"
"                            ->  Sort  (cost=3.77..3.78 rows=1 width=4) (never executed)"
"                                  Sort Key: m_1.movie_id"
"                                  ->  Nested Loop  (cost=0.00..3.76 rows=1 width=4) (never executed)"
"                                        Join Filter: (m_1.movie_id = r2.movie_id)"
"                                        ->  Seq Scan on movies m_1  (cost=0.00..2.38 rows=1 width=4) (never executed)"
"                                              Filter: ((genre)::text = 'Drama'::text)"
"                                        ->  Seq Scan on rentals r2  (cost=0.00..1.38 rows=1 width=4) (never executed)"
"                                              Filter: (customer_id = c.customer_id)"
"                    SubPlan 2"
"                      ->  Aggregate  (cost=3.81..3.82 rows=1 width=32) (never executed)"
"                            ->  Hash Join  (cost=1.39..3.81 rows=1 width=12) (never executed)"
"                                  Hash Cond: (m2.movie_id = r3.movie_id)"
"                                  ->  Seq Scan on movies m2  (cost=0.00..2.30 rows=30 width=16) (never executed)"
"                                  ->  Hash  (cost=1.38..1.38 rows=1 width=4) (never executed)"
"                                        ->  Seq Scan on rentals r3  (cost=0.00..1.38 rows=1 width=4) (never executed)"
"                                              Filter: (customer_id = c.customer_id)"
"                    SubPlan 3"
"                      ->  Aggregate  (cost=1.53..1.54 rows=1 width=8) (never executed)"
"                            ->  Seq Scan on rentals r4  (cost=0.00..1.52 rows=1 width=4) (never executed)"
"                                  Filter: ((rental_date >= '2021-01-01'::date) AND (rental_date <= '2022-12-31'::date) AND (customer_id = c.customer_id))"
"Planning Time: 1.118 ms"
"Execution Time: 0.170 ms"
*/
