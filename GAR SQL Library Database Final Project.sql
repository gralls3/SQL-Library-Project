

--START OF LIBRARY PROJECT

--BEGIN TABLE CREATION
CREATE DATABASE gr_library

USE gr_library

CREATE TABLE publishers (
	name VARCHAR(100) PRIMARY KEY NOT NULL,
	address VARCHAR(255),
	phone VARCHAR(20)
);

CREATE TABLE borrowers (
	card_number INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	name VARCHAR(100) NOT NULL,
	address VARCHAR(255),
	phone VARCHAR(20)
);

CREATE TABLE branches (
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	name VARCHAR(100) NOT NULL,
	address VARCHAR(255)
);

CREATE TABLE books (
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	title VARCHAR(255) NOT NULL,
	publisher VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES publishers(name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE authors (
	book_id INT NOT NULL CONSTRAINT fk_author_name FOREIGN KEY REFERENCES books(id)  ON UPDATE CASCADE ON DELETE CASCADE,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE copies (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES books(id)  ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES branches(id)  ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL DEFAULT 1
);

CREATE TABLE loans (
	book_id INT NOT NULL CONSTRAINT fk_bookloan_id FOREIGN KEY REFERENCES books(id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branchloan_id FOREIGN KEY REFERENCES branches(id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_number INT NOT NULL CONSTRAINT fk_card_number FOREIGN KEY REFERENCES borrowers(card_number) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	due_date DATE NOT NULL
);

--END OF TABLE CREATTION

--BEGIN POPULATING TABLES WITH DATA
INSERT INTO publishers
	(name, address, phone)
	VALUES
	('HarperCollins', '195 Broadway, New York, NY 10007', '+1 (212) 207-7000'),
	('Abdingdon Press', '201 Eighth Avenue South, P O Box 801, Nashville TN 37202-0801','615-749-6792'),
	('Ace Books', '375 Hudson Street, New York NY 10014', '+1 (212) 366-2000'),
	('Doubleday','1745 Broadway, New York NY 10019', '+1 (212) 782-9000'),
	('ECW Press', '2120 Queen Street East #200, Toronto, Ontario M4E 1E2 Canada', '+1 (416) 694-3348'),
	('Farrar Straus & Giroux', '18 West 18th Street, New York NY 10011', '+1 (212) 741-6900'),
	('Five Star', 'Kennedy Memorial Drive, Waterville ME 04901','+1 (202) 869-3270'),
	('Goose River Press', '3400 Friendship Road, Waldoboro ME 04572-6337', '+1 (207) 832-6665'),
	('Harlequin', '300 East 42nd Street, 6th Floor, New York NY 10017', '+1 (212) 234-0753'),
	('Harvard Square Editions','2152 Beachwood Terrace, Hollywood CA 90068', '+1 (323) 848-6400'),
	('Literary Wanderlust','121037 E Harvard Avenue #204, Aurora CO 80014', '+1( 720) 314-8619'),
	('The Permanent Press','172 Emery Ave, New York, NY 10019','+1 (212) 444-2341')
;

INSERT INTO borrowers
	(name, address, phone)
	VALUES
	('Sally Hawkins', '123 6th St., Melbourne, FL 32904','+1 (536) 234-4524'),
	('Bradley Cooper', '4 Goldfield Rd., Honolulu, HI 96815','+1 (234) 924-2352'),
	('Meryl Streep', '71 Pilgrim Avenue, Chevy Chase, MD 20815','+1 (254) 643-7834'),
	('Helen Hunt', '44 Shirley Ave., West Chicago, IL 60185','+1 (134) 654-2336'),
	('Kevin Costner', '70 Bowman St., South Windsor, CT 06074','011 (44) 12 2345'),
	('Helen Myrin', '514 S. Magnolia St., Orlando, FL 32806','+1 (888) 272-4070'),
	('Jennifer Laurence', '203 Myers St., Merrimack, NH 03054','+1 (777) 4884-654'),
	('Leonardo DiCaprio', '765 Philmont Avenue, Mcminnville, TN 37110','+1 (785) 234-0998'),
	('Marion Cotillard', '391 South Street, Montgomery, AL 36109','+1 (897) 432-8884')
;

INSERT INTO branches
	(name, address)
	VALUES
	('Sharpstown','2 Secondary Street, Lowell, WA 01845'),
	('Central','47 Circular Circle, Lowell, WA 01850'),
	('Greenfield','2 Blue Ave, Lowell, WA 01851'),
	('Lawnfield','8743234 Short Street, Lowell, WA 01855'),
	('Moutainbottom','8 Eight Street, Lowell, WA 01852')
;

INSERT INTO books
	(title, publisher)
	VALUES
	('The Lost Tribe','Harlequin'),
	('The Hobbit','Ace Books'),
	('Ghost Rider: Travels On The Healing Road','ECW Press'),
	('Staring At The Sun','Doubleday'),
	('Cosmos','The Permanent Press'),
	('God Is Not Great','LIterary Wanderlust'),
	('The Schopenhauer Cure','Harvard Square Editions'),
	('Last Words','Goose River Press'),
	('Stranger Among Friends','Doubleday'),
	('Broca''s Brain','ECW Press'),
	('Born To Run','The Permanent Press'),
	('A Brief History Of Everything','Five Star'),
	('When Neitzsche Wept','Farrar Straus & Giroux'),
	('Dry: A Memoir','Farrar Straus & Giroux'),
	('The Grapes Of Wrath','Literary Wanderlust'),
	('War And Peace','Abdingdon Press'),
	('Necronomicon','Goose River Press'),
	('The Selfish Gene','Five Star'),
	('Charlotte''s Web','ECW Press'),
	('The Da Vinci Code','Ace Books'),
	('The Girl Who Loved Tom Gordon','HarperCollins')
;

INSERT INTO authors
	(book_id, name)
	VALUES
	(21, 'Stephen King'),
	(3, 'Neil Peart'),
	(18, 'Richard Dawkins'),
	(20, 'Dan Brown'),
	(1, 'Mark Lee'),
	(2, 'J. R. R. Tolkien'),
	(4, 'Irvin Yalom'),
	(5, 'Carl Sagan'),
	(11, 'Bruce Springsteen'),
	(8, 'George Carlin'),
	(12, 'Stephen Hawking'),
	(14, 'Augusten Burroughs'),
	(15, 'John Steinbeck'),
	(17, 'H. P. Lovecraft'),
	(6, 'Christopher Hitchens'),
	(9, 'David Mixner'),
	(7, 'Irvin Yalom'),
	(10, 'Carl Sagan'),
	(12, 'Irvin Yalom'),
	(16, 'Leo Tolstoy'),
	(19, 'E. B. White'),
	(20, 'The Da Vince Code')
;

INSERT INTO copies
	(book_id, branch_id, number_of_copies)
	VALUES
	(1,1,2),
	(2,1,3),
	(3,1,4),
	(4,1,2),
	(5,1,5),
	(6,1,2),
	(7,1,2),
	(8,1,2),
	(9,1,2),
	(10,1,4),
	(11,1,4),
	(12,1,5),
	(13,1,2),
	(14,1,2),
	(15,1,2),
	(16,1,2),
	(17,1,4),
	(18,1,5),
	(19,1,5),
	(20,1,2),
	(21,1,2),
	(1,2,3),
	(2,2,3),
	(3,2,2),
	(4,2,2),
	(5,2,2),
	(6,2,2),
	(7,2,2),
	(8,2,2),
	(9,2,2),
	(10,2,5),
	(11,2,5),
	(12,2,2),
	(13,2,2),
	(14,2,5),
	(15,2,2),
	(16,2,2),
	(17,2,2),
	(18,2,2),
	(19,2,2),
	(20,2,2),
	(21,2,2),
	(1,3,2),
	(2,3,2),
	(3,3,5),
	(4,3,2),
	(5,3,2),
	(6,3,5),
	(7,3,3),
	(8,3,2),
	(9,3,4),
	(10,3,2),
	(11,3,2),
	(12,3,2),
	(13,3,2),
	(14,3,5),
	(15,3,2),
	(16,3,2),
	(17,3,2),
	(18,3,2),
	(19,3,2),
	(20,3,2),
	(21,3,2),
	(1,4,2),
	(2,4,5),
	(3,4,4),
	(4,4,2),
	(5,4,2),
	(6,4,2),
	(7,4,2),
	(8,4,2),
	(9,4,2),
	(10,4,2),
	(11,4,2),
	(12,4,2),
	(13,4,2),
	(14,4,5),
	(15,4,4),
	(16,4,2),
	(17,4,2),
	(18,4,2),
	(19,4,2),
	(20,4,2),
	(21,4,2),
	(1,5,2),
	(2,5,2),
	(3,5,2),
	(4,5,2),
	(5,5,4),
	(6,5,5),
	(7,5,2),
	(8,5,2),
	(9,5,2),
	(10,5,2),
	(11,5,2),
	(12,5,2),
	(13,5,2),
	(14,5,2),
	(15,5,2),
	(16,5,2),
	(17,5,2),
	(18,5,2),
	(19,5,2),
	(20,5,2),
	(21,5,2)
;


INSERT INTO loans
	(book_id, branch_id, card_number, date_out, due_date)

VALUES
	(1,1,1000,'2017-04-16','2017-10-05'),
	(2,1,1001,'2017-04-26','2017-10-06'),
	(10,1,1003,'2017-05-13','2017-10-15'),
	(11,1,1004,'2017-05-25','2017-10-16'),
	(12,1,1005,'2017-05-26','2017-07-20'),
	(13,1,1006,'2017-05-27','2017-07-27'),
	(14,1,1007,'2017-06-14','2017-08-12'),
	(18,1,1008,'2017-06-23','2017-08-19'),
	(19,1,1000,'2017-06-26','2017-08-27'),
	(20,1,1001,'2017-07-07','2017-09-08'),
	(1,2,1003,'2017-07-18','2017-09-13'),
	(2,2,1004,'2017-07-20','2017-10-02'),
	(3,2,1005,'2017-07-27','2017-10-05'),
	(4,2,1006,'2017-08-12','2017-10-06'),
	(10,2,1007,'2017-08-19','2017-10-15'),
	(11,2,1008,'2017-08-27','2017-10-16'),
	(12,2,1000,'2017-09-08','2017-10-18'),
	(13,2,1001,'2017-09-13','2017-10-24'),
	(14,2,1003,'2017-10-02','2017-08-27'),
	(15,2,1004,'2017-10-05','2017-09-08'),
	(16,2,1005,'2017-10-06','2017-09-13'),
	(17,2,1006,'2017-10-15','2017-10-02'),
	(18,2,1007,'2017-10-16','2017-07-20'),
	(19,2,1008,'2017-10-18','2017-07-27'),
	(20,2,1006,'2017-10-24','2017-08-12'),
	(21,2,1007,'2017-08-27','2017-08-19'),
	(1,3,1008,'2017-09-08','2017-08-27'),
	(2,3,1000,'2017-09-13','2017-09-08'),
	(3,3,1001,'2017-10-02','2017-08-27'),
	(5,3,1003,'2017-10-05','2017-09-08'),
	(6,3,1004,'2017-10-06','2017-09-13'),
	(7,3,1006,'2017-10-15','2017-10-02'),
	(8,3,1007,'2017-10-16','2017-10-05'),
	(9,3,1008,'2017-07-20','2017-10-06'),
	(11,3,1000,'2017-07-27','2017-10-15'),
	(12,3,1001,'2017-08-12','2017-10-16'),
	(13,3,1003,'2017-08-19','2017-10-18'),
	(14,3,1004,'2017-08-27','2017-10-02'),
	(15,3,1006,'2017-09-08','2017-07-20'),
	(16,3,1007,'2017-09-13','2017-07-27'),
	(21,3,1008,'2017-10-02','2017-08-12'),
	(2,4,1000,'2017-10-05','2017-08-19'),
	(3,4,1001,'2017-10-06','2017-08-27'),
	(4,4,1003,'2017-10-15','2017-09-08'),
	(5,4,1004,'2017-10-16','2017-08-27'),
	(6,4,1006,'2017-10-18','2017-09-08'),
	(7,4,1007,'2017-10-24','2017-09-13'),
	(8,4,1008,'2017-08-27','2017-10-02'),
	(9,4,1000,'2017-09-08','2017-10-05'),
	(10,4,1001,'2017-09-13','2017-10-06'),
	(18,4,1003,'2017-10-02','2017-10-15'),
	(19,4,1004,'2017-07-20','2017-10-16'),
	(20,4,1001,'2017-07-27','2017-10-18'),
	(21,4,1003,'2017-08-12','2017-10-02'),
	(1,5,1004,'2017-08-19','2017-07-20'),
	(2,5,1006,'2017-08-27','2017-07-27'),
	(3,5,1007,'2017-09-08','2017-08-12'),
	(5,5,1008,'2017-09-13','2017-08-19'),
	(6,5,1000,'2017-10-02','2017-08-27'),
	(8,5,1001,'2017-10-05','2017-09-08'),
	(9,5,1003,'2017-10-06','2017-08-27'),
	(10,5,1004,'2017-10-15','2017-09-08'),
	(11,5,1006,'2017-10-16','2017-09-13'),
	(12,5,1007,'2017-10-18','2017-10-02'),
	(13,5,1008,'2017-10-24','2017-10-05'),
	(16,5,1000,'2017-08-27','2017-10-06'),
	(17,5,1001,'2017-09-08','2017-10-15'),
	(18,5,1003,'2017-09-13','2017-10-16'),
	(19,5,1004,'2017-10-02','2017-10-18'),
	(21,5,1001,'2017-10-16','2017-10-06')
;

--BEGINING OF QUERIES
--NOTE THAT I JUST WROTE THE QUERIES, NOT STORED PROCS


--1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
SELECT br.name AS Branch, bk.title AS Book, co.number_of_copies AS 'No. Copies'
FROM branches br
JOIN copies co ON co.branch_id=br.id
JOIN books bk ON bk.id=co.book_id
WHERE bk.title='The Lost Tribe' AND br.name='Sharpstown'


--2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
SELECT br.name AS Branch, bk.title AS Book, co.number_of_copies AS 'No. Copies'
FROM branches br
JOIN copies co ON co.branch_id=br.id
JOIN books bk ON bk.id=co.book_id
WHERE bk.title='The Lost Tribe'
;

--3. Retrieve the names of all borrowers who do not have any books checked out.
SELECT bw.name AS 'Borrowers'
FROM borrowers bw
JOIN loans lo ON lo.card_number=bw.card_number
WHERE NOT bw.card_number IN (lo.card_number)
ORDER BY Borrowers;

/*
4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
retrieve the book title, the borrower's name, and the borrower's address.
*/
SELECT
	bk.title AS 'Book',
	bw.name AS 'Borrower',
	bw.address AS 'Address'
FROM borrowers bw
	JOIN loans lo ON lo.card_number=bw.card_number
	JOIN books bk ON bk.id=lo.book_id
	JOIN branches br ON br.id=lo.branch_id
WHERE
	(br.id IN (SELECT branch_id FROM loans) AND br.name='Sharpstown')
	AND lo.due_date=GETDATE()
;


--5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
SELECT
	br.name AS 'Branch',
	COUNT (lo.book_id) AS 'No. Books Loaned'	
FROM loans lo
JOIN branches br ON br.id=lo.branch_id
GROUP BY br.name;

/*
6. Retrieve the names, addresses, and number of books checked out
for all borrowers who have more than five books checked out.
*/
SELECT
	bw.name AS 'Borrower',
	bw.address AS 'Borrower Address',
	COUNT (lo.book_id) AS 'No. Books Out'
FROM borrowers bw
JOIN loans lo ON lo.card_number=bw.card_number
GROUP BY bw.name, bw.address;

/*
7. For each book authored (or co-authored) by "Stephen King",
retrieve the title and the number of copies owned by the library branch whose name is "Central".
*/
SELECT 
	bk.title AS 'Book',
	cp.number_of_copies AS 'No. Copies @ Central'
FROM books bk
	JOIN copies cp ON cp.book_id=bk.id
	JOIN branches br ON br.id=cp.branch_id
	JOIN authors au ON au.book_id=bk.id
WHERE au.name='Stephen King' AND br.name='Central'
;

--END OF LIBRARY PROJECT

