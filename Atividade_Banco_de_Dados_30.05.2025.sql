CREATE DATABASE streaming;

USE streaming;

-- 1- b. Scripts para CONSTRUIR as tabelas

	CREATE TABLE movies (
		movie_id INT PRIMARY KEY,
		title VARCHAR(255) NOT NULL,
		genre VARCHAR(100)
	);

	CREATE TABLE clients (
		client_id INT PRIMARY KEY,
		client_name VARCHAR(255) NOT NULL,
		email VARCHAR(255) UNIQUE NOT NULL
	);

	CREATE TABLE subscriptions (
		subscription_id INT PRIMARY KEY,
		client_id INT,
		movie_id INT,
		subscription_date DATE NOT NULL,
		FOREIGN KEY (client_id) REFERENCES clients(client_id),
		FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
	);

-- 1- c. Scripts para INSERIR dados

	INSERT INTO movies (movie_id, title, genre) VALUES
		(1, 'Inception', 'Sci-Fi'),
		(2, 'The GodFather', 'Crime'),
		(3, 'The Dark Knight', 'Action'),
		(4, 'Pulp Fiction', 'Drama'),
		(5, 'Forrest Gump', 'Drama');
		
	INSERT INTO clients (client_id, client_name, email) VALUES
		(1, 'Alice', 'alice@gmail.com'),
		(2, 'Bob', 'bob@gmail.com'),
		(3, 'Charlie', 'charlie@gmail.com'),
		(4, 'David', 'david@gmail.com'),
		(5, 'Eve', 'eve@gmail.com');
		
	INSERT INTO subscriptions (subscription_id, client_id, movie_id, subscription_date) VALUES
		(1, 1, 1, '2023-01-01'),
		(2, 2, 2, '2023-02-01'),
		(3, 3, 3, '2023-03-01'),
		(4, 4, 4, '2023-04-01'),
		(5, 5, 5, '2023-05-01');
    
-- 1- d. Exercícios de JUNÇÃO (JOINS)

-- INNER JOIN

	SELECT
		subscriptions.subscription_id,
		clients.client_name,
		movies.title,
		subscriptions.subscription_date
	FROM
		subscriptions
	INNER JOIN
		clients ON subscriptions.client_id = clients.client_id
	INNER JOIN
		 movies ON subscriptions.movie_id = movies.movie_id;

-- LEFT JOIN 

	SELECT	
		clients.client_name,
		subscriptions.subscription_id,
		movies.title,
		subscriptions.subscription_date
	FROM
		clients
	LEFT JOIN
		subscriptions ON clients.client_id = subscriptions.client_id
	LEFT JOIN
		movies ON subscriptions.movie_id = movies.movie_id;
    
-- RIGHT JOIN 
    SELECT	
		clients.client_name,
		subscriptions.subscription_id,
		movies.title,
		subscriptions.subscription_date
	FROM
		movies
	RIGHT JOIN
		subscriptions ON movies.movie_id = subscriptions.movie_id
	RIGHT JOIN
		clients ON subscriptions.client_id = clients.client_id;
        
-- FULL OUTER JOIN

	SELECT
		clients.client_name,
		movies.title,
        subscriptions.subscription_id,
		subscriptions.subscription_date
	FROM
		clients
	FULL OUTER JOIN
		subscriptions ON clients.client_id = subscriptions.client_id
    FULL OUTER JOIN
        movies ON subscriptions.movie_id = movies.movie_id;

        
    
    
    
