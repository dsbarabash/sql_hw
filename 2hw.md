<img width="1175" height="799" alt="изображение" src="https://github.com/user-attachments/assets/8d16104a-1b27-4758-90bf-7239d6645488" />






**Напишите запрос, который выводит всех актеров.**

```select * from actors```


**Задание со звездочкой - выполняется по желанию**
**Создание базы данных:**

Напишите SQL-код для создания базы данных и всех необходимых таблиц. Можно сгенерировать из ERD Tools

```
CREATE DATABASE cinema_db;

CREATE TABLE directors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  bith_date DATE,
  nationality VARCHAR(100)
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  release_year INT,
  genre VARCHAR(50),
  rating VARCHAR(50),
  duration_min INT,
  description VARCHAR(500)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(50) UNIQUE NOT NULL,
  address VARCHAR(200)
);

CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  bith_date DATE,
  nationality VARCHAR(100)
);

CREATE TABLE movies_directors (
  movie_id INT,
  director_id INT,
  PRIMARY KEY (movie_id, director_id),
  FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
  FOREIGN KEY (director_id) REFERENCES directors(id) ON DELETE CASCADE
);

CREATE TABLE movies_actors (
  movie_id INT,
  actor_id INT,
  PRIMARY KEY (movie_id, actor_id),
  FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
  FOREIGN KEY (actor_id) REFERENCES actors(id) ON DELETE CASCADE
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  movie_id INT NOT NULL,
  order_date DATE DEFAULT CURRENT_DATE,
  return_date DATE,
  FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

```


**Написание SQL-запросов:**

Напишите запрос, который выводит все фильмы жанра ""Драма"", выпущенные после 2010 года.

```select * from movies where genre='драма' and release_year > 2010```

Напишите запрос, который выводит список актеров, отсортированных по фамилии в алфавитном порядке.

```select * from actors order by last_name asc```

Напишите запрос, который выводит топ 5 фильмов с самым высоким рейтингом.

```select * from movies order by rating limit 5```

Напишите запрос, который выводит следующую страницу (фильмы с 6 по 10) из отсортированного по рейтингу списка фильмов.

```SELECT * FROM movies ORDER BY rating DESC LIMIT 5 OFFSET 5 ```

