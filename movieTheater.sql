-- Begin Create (start with tables without FKs)

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	payment_info VARCHAR(150)
);

CREATE TABLE movie (
	movie_id SERIAL PRIMARY KEY,
	movie_title VARCHAR(120),
	length_minutes INTEGER
);

CREATE TABLE inventory (
	upc SERIAL PRIMARY KEY,
	prod_name VARCHAR(100),
	prod_amount INTEGER
);

-- Move on to tables with FKs

CREATE TABLE tix (
	tix_id SERIAL PRIMARY KEY,
	tix_amount NUMERIC(5,2),
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE tix_order(
	t_order_id SERIAL PRIMARY KEY,
	t_order_date DATE DEFAULT CURRENT_DATE,
	t_count INTEGER,
	t_sub_total NUMERIC(5,2),
	t_total_cost NUMERIC(5,2),
	tix_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(tix_id) REFERENCES tix(tix_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE conc_order (
	c_order_id SERIAL PRIMARY KEY,
	c_order_date DATE DEFAULT CURRENT_DATE,
	c_count INTEGER,
	c_sub_total NUMERIC(5,2),
	c_total_cost NUMERIC(5,2),
	upc INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(upc) REFERENCES inventory(upc),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);


-- Begin Insert

INSERT INTO customer(customer_id, first_name, last_name, payment_info)
VALUES (0001, 'Sydney', 'Ward', '4545 5454 1212 2121, 123');

INSERT INTO customer(customer_id, first_name, last_name, payment_info)
VALUES (0002, 'Tucker', 'Ward', '5454 2121 4545 1212, 321');

INSERT INTO customer(customer_id, first_name, last_name, payment_info)
VALUES (0003, 'Cory', 'Tuggle', '2389 9832 8293 3928, 369');

INSERT INTO customer(customer_id, first_name, last_name, payment_info)
VALUES (0004, 'Jacob', 'Derington', '1991 9119 1199 9911, 919');

INSERT INTO customer(customer_id, first_name, last_name, payment_info)
VALUES (0005, 'Anna', 'Schmidt', '0123 4567 8987 6543, 210');

SELECT * FROM customer;


INSERT INTO movie(movie_id, movie_title, length_minutes) 
VALUES (01234, 'Saving Private Data', 169);

INSERT INTO movie(movie_id, movie_title, length_minutes) 
VALUES (01235, 'Spider-Men: So You Mean to Say There is More Than One?', 181);

INSERT INTO movie (movie_id, movie_title, length_minutes) 
VALUES (01236, 'You Will Regret Buying Your Ticket', 17);

INSERT INTO movie (movie_id, movie_title, length_minutes) 
VALUES (01237, 'DC Presents: Greyscale; When Brown Was Too Colorful: The Zack Snyder Cut', 210);

INSERT INTO movie (movie_id, movie_title, length_minutes)
VALUES (01238, 'This Movie Has No Title', 111);

SELECT * FROM movie;


INSERT INTO inventory(upc, prod_name, prod_amount)
VALUES (123456, 'Twixxlers', 750);

INSERT INTO inventory(upc, prod_name, prod_amount)
VALUES (654321, 'w&ws', 900);

INSERT INTO inventory(upc, prod_name, prod_amount)
VALUES (246369, 'ZABA-ABBA', 5);

INSERT INTO inventory(upc, prod_name, prod_amount)
VALUES (112233, 'Dippin Duds', 222);

SELECT * FROM inventory;


INSERT INTO tix(tix_id, tix_amount, movie_id)
VALUES (101, 15.50, 01234);

INSERT INTO tix(tix_id, tix_amount, movie_id)
VALUES (102, 15.50, 01235);

INSERT INTO tix(tix_id, tix_amount, movie_id)
VALUES (103, 39.50, 01236);

INSERT INTO tix(tix_id, tix_amount, movie_id)
VALUES (104, 12.50, 01237);

INSERT INTO tix(tix_id, tix_amount, movie_id)
VALUES (105, 15.50, 01238);

SELECT * FROM tix;


INSERT INTO tix_order (t_order_id, t_count, t_sub_total, t_total_cost, tix_id, customer_id)
VALUES (10110, 3, 46.50, 50.22, 101, 0001);

INSERT INTO tix_order (t_order_id, t_count, t_sub_total, t_total_cost, tix_id, customer_id)
VALUES (10111, 4, 62.00, 66.96, 102, 0002);

INSERT INTO tix_order (t_order_id, t_count, t_sub_total, t_total_cost, tix_id, customer_id)
VALUES (11000, 2, 79.00, 85.32, 103, 0003);

INSERT INTO tix_order (t_order_id, t_count, t_sub_total, t_total_cost, tix_id, customer_id)
VALUES (11001, 66, 825.00, 891.00, 104, 0004);

INSERT INTO tix_order (t_order_id, t_count, t_sub_total, t_total_cost, tix_id, customer_id)
VALUES (11010, 5, 77.50, 83.7, 105, 0005);

INSERT INTO tix_order (t_order_id, t_order_date, t_count, t_sub_total, t_total_cost, tix_id, customer_id)
VALUES (10101, '2022-06-30', 2, 25.00, 27.00, 104, 0004);

SELECT * FROM tix_order;


INSERT INTO conc_order (c_order_id, c_count, c_sub_total, c_total_cost, upc, customer_id)
VALUES (1010, 2, 14.00, 15.12, 123456, 0001);

INSERT INTO conc_order (c_order_id, c_count, c_sub_total, c_total_cost, upc, customer_id)
VALUES (1011, 4, 28.00, 30.24, 654321, 0003);

INSERT INTO conc_order (c_order_id, c_count, c_sub_total, c_total_cost, upc, customer_id)
VALUES (1100, 3, 21.00, 22.68, 246369, 0002);

INSERT INTO conc_order (c_order_id, c_count, c_sub_total, c_total_cost, upc, customer_id)
VALUES (1101, 14, 462.00, 498.96, 654321, 0004);

INSERT INTO conc_order (c_order_id, c_order_date, c_count, c_sub_total, c_total_cost, upc, customer_id)
VALUES (1001, '2022-06-30', 2, 14.00, 15.12, 654321, 0004);

SELECT * FROM conc_order;






