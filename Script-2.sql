
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45),
	last_name VARCHAR(45),
	email VARCHAR(100),
	address VARCHAR(255),
	billing_info VARCHAR(255) NOT NULL
);

CREATE TABLE concession_purchase(
	concession_purchase_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	payment FLOAT4
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	movie_id INT NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	screening_room_id INT NOT NULL,
	FOREIGN KEY(screening_room_id) REFERENCES screening_room(screening_room_id),
	price FLOAT4,
	purchase_time_date TIMESTAMP
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	ticket_id INT,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
	movie_screening_room_id INT,
	FOREIGN KEY(movie_screening_room_id) REFERENCES movie_screening_room(movie_screening_room_id),
	title VARCHAR(75) NOT NULL,
	description VARCHAR(255),
	rating VARCHAR(15) NOT NULL,
	genre VARCHAR(100)
);

CREATE TABLE screening_room(
	screening_room_id SERIAL PRIMARY KEY,
	ticket_id INT,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
	seat_index VARCHAR(30) NOT NULL,
	number_of_seating INTEGER
);

CREATE TABLE concession_product(
	concession_product_id SERIAL PRIMARY KEY,
	concession_purchase_id INT,
	FOREIGN KEY(concession_purchase_id) REFERENCES concession_purchase(concession_purchase_id),
	drinks VARCHAR(75),
	popcorn VARCHAR(75),
	candy VARCHAR(75)
);


CREATE TABLE movie_screening_room(
	movie_screening_room_id SERIAL PRIMARY KEY,
	screening_room_id INT,
	FOREIGN KEY(screening_room_id) REFERENCES screening_room(screening_room_id),
	movie_id INT,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	date DATE,
	time_ TIME 
);




