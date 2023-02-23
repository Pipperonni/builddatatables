
CREATE OR REPLACE FUNCTION adjustprice(
	ticketId INTEGER,
	newPrice FLOAT4
)
RETURNS INT
LANGUAGE plpgsql AS $$
BEGIN 
	UPDATE ticket 
	SET price = newPrice
	WHERE ticket_id = ticketId
	RETURN ticketId;
END;
$$

CREATE OR REPLACE PROCEDURE insertCustomer(
	fName VARCHAR,
	lName VARCHAR,
	email_ VARCHAR,
	address_ VARCHAR,
	billinG_Info_ VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO customer(
		first_name,
		last_name,
		email,
		address,
		billing_info
	)VALUES(
		fName,
		lName,
		email_,
		address_,
		billinG_Info_
	);	
END;
$$

CALL insertcustomer('John', 'Giggles', 'J.Giggles@laughs.fun', '123 Clown St.', '4242-4242-4242-4242'); 
CALL insertcustomer('Fray', 'Tyler', 'Helloworld@python.com', '123 Watch Rd.', '4242-4242-4242-5252');
call insertCustomer('Blane', 'Severson', 'wow.lookwho@whatup.lik', '123 three st mtg, IO', '4242-4242-4242-4242');

SELECT *
FROM customer;

CREATE OR REPLACE PROCEDURE addingProducts(
	drink_ VARCHAR,
	popcorn_ VARCHAR,
	candy_ VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO concession_product(
		drinks,
		popcorn,
		candy 	
	)VALUES(
		drink_,
		popcorn_,
		candy_
	); 
END;
$$

CALL addingProducts('Coke', 'cheese', 'M&Ms');
CALL addingproducts('water', 'butter', 'Sour Patch Kids');

CREATE OR REPLACE PROCEDURE sales(
	customerId INT,
	payment_ FLOAT4
) 
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO concession_purchase(
		customer_id,
		payment
	)VALUES(
		customerId,
		payment_
	);
END;
$$

CALL sales(1, 34.74);
CALL sales(2, 54.74);

CREATE OR REPLACE PROCEDURE ticketSale(
	customerId INT,
	movieId INT,
	screenRoomId INT,
	price_ FLOAT4
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO ticket(
		customer_id,
		movie_id,
		screening_room_id,
		price 
	)VALUES(
		customerId,
		movieId,
		screenRoomId,
		price_
	);
END;
$$

CALL ticketSale(1, 1, 1, 28.00);
CALL ticketSale(2,2,2, 16.00);



CREATE OR REPLACE PROCEDURE newMovie(
	title_ VARCHAR,
	description_ VARCHAR,
	rating_ VARCHAR,
	genre_ VARCHAR
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO movie(
		title,
		description,
		rating,
		genre
	)VALUES(
		title_,
		description_,
		rating_,
		genre_
	);
END;
$$

CALL newMovie('Circular Square Conundrum', 'Is it a circle or is it a square, the world may never know.', 'PG-13', 'Comedy');
CALL newMovie('Bigfoot vs Cliffard', 'The battle of the mysterious bigfoot against the loveable big red dog, who will come out on top.', 'PG', 'Action');

CREATE OR REPLACE PROCEDURE seating(
	seatIndex VARCHAR,
	numOfSeats INT4
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO screening_room(
		seat_index,
		number_of_seating
	)VALUES(
		seatIndex,
		numOfSeats
	);
END;
$$

CALL seating('A2A', 100);
CALL seating('A3D', 80);

CREATE OR REPLACE PROCEDURE movieShowroom(
	screenRoomId INT4,
	movieId INT4
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO movie_screening_room(
		screening_room_id,
		movie_id
	)VALUES(
		screenRoomId,
		movieId
	);
END;
$$

CALL movieShowroom(1, 2);
CALL movieShowroom(2, 1);





