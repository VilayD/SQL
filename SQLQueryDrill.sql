CREATE DATABASE db_Library;

USE db_Library;

/* Create Tables */
CREATE TABLE LIBRARY_BRANCH (
	Branch_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Branch_Name VARCHAR(50) NOT NULL,
	Branch_Address VARCHAR(100) NOT NULL
);

CREATE TABLE PUBLISHER (
	Publisher_ID VARCHAR(50) PRIMARY KEY NOT NULL,
	Publisher_Name VARCHAR(50) NOT NULL,
	Publisher_Address VARCHAR(50) NOT NULL,
	Publisher_Phone INT NOT NULL
);

CREATE TABLE BOOKS (
	Book_ID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Book_Title VARCHAR(50) NOT NULL,
	Pub_Name VARCHAR(50) NOT NULL,
	FOREIGN KEY(Pub_Name) REFERENCES
	PUBLISHER(Publisher_ID)
); 

CREATE TABLE BOOK_AUTHORS (
	Book_ID_2 INT PRIMARY KEY NOT NULL,
	FOREIGN KEY(Book_ID_2) REFERENCES
	BOOKS(Book_ID),
	Author_Name VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	Book_ID_3  INT NOT NULL,
	FOREIGN KEY(Book_ID_3) REFERENCES
	BOOKS(Book_ID),
	Branch_ID_2 INT,
	FOREIGN KEY(Branch_ID_2) REFERENCES
	LIBRARY_BRANCH(Branch_ID),
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE BORROWER (
	Card_Num INT PRIMARY KEY NOT NULL IDENTITY(200, 1),
	Bor_Name VARCHAR(50) NOT NULL,
	Bor_Address VARCHAR(50) NOT NULL,
	Bor_Phone INT NOT NULL
);



CREATE TABLE BOOK_LOAN (
	Book_ID_4 INT ,
	FOREIGN KEY(Book_ID_4) REFERENCES
	BOOKS(Book_ID),
	Branch_ID_3 INT,
	FOREIGN KEY(Branch_ID_3) REFERENCES
	LIBRARY_BRANCH(Branch_ID),
	Card_Num_2 INT NOT NULL,
	FOREIGN KEY(Card_Num_2) REFERENCES
	BORROWER(Card_Num),
	Date_Out  DATE,
	Date_Due  DATE 
);

/* Insert */
INSERT INTO LIBRARY_BRANCH
	(Branch_Name, Branch_Address)
	VALUES
	('Sharpstown', '1575 W 1000 N, Los Angeles, CA 58458'),
	('Central', '280 W 500 N, San Fransico, CA 54684'),
	('Kern County', '9507 California City Blvd, California City, CA 93505'),
	('Glendale Central', '222 E Harvard St, Glendale, CA 91205'),
	('Beaumont', '125 E 8th St, Beaumont, CA 92223')
;

INSERT INTO PUBLISHER
	(Publisher_ID, Publisher_Name, Publisher_Address, Publisher_Phone)
	VALUES
	('ID_1', 'Scholastic', '1745 Broadway, New York, NY 10019', 800-793-2665),
	('ID_2', 'Harper Collins', '195 Broadway, New York, NY 10007', 212-207-7000),
	('ID_3', 'Simon & Schuster', '1230 6th Ave, New York, NY 10020', 212-698-7000),
	('ID_4', 'Hachette', '1290 6TH Ave, New York, NY 10104', 212-364-1110),
	('ID_5', 'Macmillan', '120 Broadway, New York, NY 10271', 646-307-5151)
;

INSERT INTO BOOKS
	(Book_Title, Pub_Name)
	VALUES
	('The Lost Tribe', 'ID_5'),
	('It', 'ID_3'),
	('The Shining', 'ID_3'),
	('Hunger Games', 'ID_1'),
	('Hunger Games MockingJay', 'ID_1'),
	('Killing Floor', 'ID_3'),
	('Die Trying', 'ID_3'),
	('Tripwire', 'ID_3'),
	('The Visitor', 'ID_3'),
	('The House of Bridges', 'ID_2'),
	('A Cruel Deception', 'ID_2'),
	('The Black Widow', 'ID_2'),
	('Along Came a Spider', 'ID_4'),
	('Kiss the Girls', 'ID_4'),
	('Jack & Jill', 'ID_4'),
	('The Lake House', 'ID_4'),
	('Flower in the Attic', 'ID_3'),
	('Keeper of the Lost Cities Flashback', 'ID_3'),
	('Strangers at the Gate: Arrivals in New York', 'ID_5'),
	('Dog Man: For Whom the ball Rolls', 'ID_1'),
	('Diary of a Wimpy Kid: Wrecking Ball', 'ID_2')
;

INSERT INTO BOOK_AUTHORS
	(Book_ID_2, Author_Name)
	VALUES
	(100, 'Mark Lee'),
	(101, 'Stephen King'),
	(102, 'Stephen King'),
	(103, 'Suzanne Collins'),
	(104, 'Suazanne Collins'),
	(105, 'Lee Child'),
	(106, 'Lee Child'),
	(107, 'Lee Child'),
	(108, 'Catherine Burns'),
	(109, 'Katie Hakfner'),
	(110, 'Charles Todd'),
	(111, 'Daniel Silva'),
	(112, 'James Patterson'),
	(113, 'James Patterson'),
	(114, 'James Patterson'),
	(115, 'James Patterson'),
	(116, 'V.C. Andrews'),
	(117, 'Shannon Messenger'),
	(118, 'Adam Gopnik'),
	(119, 'Dav Pilkey'),
	(120, 'Jeff Kinney')
;

INSERT INTO BOOK_COPIES
	(Book_ID_3, Branch_ID_2, Number_Of_Copies)
	VALUES
	(100, 1, 3),
	(104, 1, 2),
	(101, 1, 2),
	(107, 1, 3),
	(108, 1, 2),
	(106, 1, 4),
	(109, 1, 2),
	(110, 1, 3),
	(120, 1, 2),
	(115, 1, 3),
	(117, 1, 3),
	(118, 1, 2),
	(100, 2, 2),
	(102, 2, 2),
	(104, 2, 3),
	(105, 2, 2),
	(107, 2, 4),
	(108, 2, 2),
	(109, 2, 2),
	(110, 2, 3),
	(111, 2, 2),
	(112, 2, 2),
	(114, 2, 3),
	(115, 2, 4),
	(116, 2, 2),
	(102, 3, 2),
	(103, 3, 2),
	(104, 3, 2),
	(105, 3, 2),
	(107, 3, 3),
	(109, 3, 3),
	(110, 3, 4),
	(112, 3, 3),
	(113, 3, 3),
	(114, 3, 2),
	(116, 3, 2),
	(117, 3, 3),
	(118, 3, 2),
	(119, 3, 2),
	(120, 3, 3),
	(116, 3, 3),
	(101, 4, 2),
	(103, 4, 3),
	(104, 4, 2),
	(105, 4, 2),
	(106, 4, 2),
	(107, 4, 3),
	(108, 4, 3),
	(100, 4, 2),
	(111, 4, 3),
	(112, 4, 3),
	(109, 4, 3),
	(101, 4, 2),
	(115, 4, 3),
	(116, 4, 3),
	(117, 4, 3),
	(118, 4, 2),
	(119, 4, 2),
	(120, 4, 2),
	(114, 4, 3),
	(100, 5, 3),
	(101, 5, 3),
	(103, 5, 3),
	(104, 5, 2),
	(105, 5, 2),
	(106, 5, 2),
	(107, 5, 3),
	(108, 5, 2),
	(109, 5, 2),
	(110, 5, 2),
	(112, 5, 3),
	(113, 5, 2),
	(114, 5, 3),
	(115, 5, 2),
	(116, 5, 2),
	(117, 5, 3),
	(118, 5, 3),
	(120, 5, 3),
	(101, 2, 3),
	(102, 2, 3)
;

INSERT INTO BORROWER
	(Bor_Name, Bor_Address, Bor_Phone)
	VALUES
	('Shane Davis', '555 W 506 N, Los Angeles CA 54856', 213-252-5505),
	('Micheal Mann', '1825 W 220 S, San Jose CA 65745', 310-555-2424),
	('Nat Spring', '4789 Marry Way Dr, California City CA 55845', 424-887-5530),
	('Nikki Gains', '1872 Mickey Lane, Los Angeles CA 84565', 661-121-5476),
	('Danny Dangle', '3654 Milky Way Dr, San Francisco CA 56485', 415-554-4486),
	('Martha Keen', '548 Martin St, Fresno CA 46888', 559-457-1123),
	('Sean Kane', '1936 Green Circle, Long Beach CA 87945', 562-845-6969),
	('Nat Smith', '555 Goneway, Fresno CA 65478', 559-124-4152),
	('Maggie May', '8457 S 895 W, Glendale CA 84571', 818-224-5769),
	('Bob Lee', '1248 NE 56874 S, Los Angeles CA 45712', 213-458-5444)
;

INSERT INTO BOOK_LOAN
	(Book_ID_4, Branch_ID_3, Card_Num_2, Date_Out, Date_Due)
	VALUES
	(100, 1, 200, '2019-10-15', '2019-11-15'),
	(100, 2, 204, '2019-10-02', '2019-11-02'),
	(100, 5, 202, '2019-10-01', '2019-11-01'),
	(101, 1, 205, '2019-09-26', '2019-10-26'),
	(101, 2, 204, '2019-09-25', '2019-10-25'),
	(101, 3, 201, '2019-09-30', '2019-10-30'),
	(101, 4, 200, '2019-10-12', '2019-11-12'),
	(102, 1, 200, '2019-10-15', '2019-11-15'),
	(102, 2, 208, '2019-10-03', '2019-11-03'),
	(102, 3, 202, '2019-10-07', '2019-11-07'),
	(102, 5, 208, '2019-10-06', '2019-11-06'),
	(103, 1, 200, '2019-10-04', '2019-11-04'),
	(103, 3, 207, '2019-10-18', '2019-11-18'),
	(103, 4, 206, '2019-10-16', '2019-11-16'),
	(103, 5, 205, '2019-10-02', '2019-11-02'),
	(104, 2, 209, '2019-10-17', '2019-11-17'),
	(104, 3, 200, '2019-10-07', '2019-11-07'),
	(104, 5, 209, '2019-10-15', '2019-11-15'),
	(105, 1, 200, '2019-10-06', '2019-11-06'),
	(105, 2, 202, '2019-10-21', '2019-11-21'),
	(105, 3, 207, '2019-10-12', '2019-11-12'),
	(105, 4, 204, '2019-10-14', '2019-11-14'),
	(105, 5, 205, '2019-10-05', '2019-11-05'),
	(106, 1, 205, '2019-10-08', '2019-11-08'),
	(106, 2, 204, '2019-10-01', '2019-11-01'),
	(106, 3, 208, '2019-09-13', '2019-10-13'),
	(106, 5, 209, '2019-09-28', '2019-10-28'),
	(107, 2, 201, '2019-10-21', '2019-11-21'),
	(107, 3, 207, '2019-10-22', '2019-11-22'),
	(107, 4, 205, '2019-10-17', '2019-11-17'),
	(107, 5, 209, '2019-10-15', '2019-11-15'),
	(108, 1, 201, '2019-10-07', '2019-11-07'),
	(108, 2, 205, '2019-10-05', '2019-11-05'),
	(109, 3, 204, '2019-10-22', '2019-11-22'),
	(109, 4, 207, '2019-10-19', '2019-11-19'),
	(110, 5, 205, '2019-10-09', '2019-11-09'),
	(110, 2, 208, '2019-10-04', '2019-11-04'),
	(111, 3, 207, '2019-10-21', '2019-11-21'),
	(111, 4, 206, '2019-10-03', '2019-11-03'),
	(112, 1, 205, '2019-10-01', '2019-11-01'),
	(112, 2, 202, '2019-10-06', '2019-11-06'),
	(112, 3, 206, '2019-10-08', '2019-11-08'),
	(113, 3, 200, '2019-10-23', '2019-11-23'),
	(113, 4, 201, '2019-10-22', '2019-11-22'),
	(114, 5, 209, '2019-10-11', '2019-11-11'),
	(114, 2, 205, '2019-10-13', '2019-11-13'),
	(115, 3, 208, '2019-10-06', '2019-11-06'),
	(115, 4, 207, '2019-09-30', '2019-10-30'),
	(116, 1, 208, '2019-10-05', '2019-11-05'),
	(116, 3, 202, '2019-09-27', '2019-10-27'),
	(117, 1, 201, '2019-10-06', '2019-11-06'),
	(117, 4, 204, '2019-10-07', '2019-11-07'),
	(117, 5, 206, '2019-10-05', '2019-11-05'), 
	(118, 1, 208, '2019-10-03', '2019-11-03'),
	(118, 2, 205, '2019-10-15', '2019-11-15'),
	(119, 5, 202, '2019-10-18', '2019-11-18'),
	(119, 3, 209, '2019-10-28', '2019-11-28'),
	(119, 5, 206, '2019-10-25', '2019-11-25'),
	(120, 1, 209, '2019-10-19', '2019-11-19'),
	(120, 2, 207, '2019-10-22', '2019-11-22')
;

/*DRILL 1*/
CREATE PROC LT_Copies
AS
BEGIN
	SELECT 
		Book_Title, Branch_Name, Number_Of_Copies
		FROM BOOK_COPIES
		INNER JOIN BOOKS ON Book_ID = Book_ID_3
		INNER JOIN LIBRARY_BRANCH ON Branch_ID = Branch_ID_2
		WHERE Book_Title = 'The Lost Tribe'
		AND Branch_Name = 'Sharpstown'
	;
END
GO

/*DRILL 2*/
CREATE PROC LT_All_Branch
AS
BEGIN
	SELECT
		Branch_Name, Book_Title, Number_Of_Copies
		FROM BOOK_COPIES
		INNER JOIN BOOKS ON Book_ID = Book_ID_3
		INNER JOIN LIBRARY_BRANCH ON Branch_ID = Branch_ID_2
		WHERE Book_Title = 'The Lost Tribe'
	;
END
GO
	
/*DRILL 3  NEED HELP ON THIS ONE
3.) Retrieve the names of all borrowers who do not have any books checked out.
I don't know how to write the NOT statements to pull this info.*/ 
CREATE PROC Borrow_None
AS
BEGIN
	SELECT
		Bor_Name
		FROM BORROWER
		WHERE NOT EXISTS
		(SELECT *
		FROM BOOK_LOAN
		WHERE BOOK_LOAN.Card_Num_2 = BORROWER.Card_Num)
		;
END
GO

/*DRILL 4*/
CREATE PROC Book_Due
AS
BEGIN
	SELECT 
		Branch_Name, Book_Title, Bor_Name, Bor_Address, Date_Due
		FROM BOOK_LOAN
		INNER JOIN LIBRARY_BRANCH ON Branch_ID = Branch_ID_3
		INNER JOIN BOOKS ON Book_ID = Book_ID_4
		INNER JOIN BORROWER ON Card_Num = Card_Num_2
		WHERE Branch_Name = 'Sharpstown'
		AND Date_Due = '2019-10-25'
	;
END
GO

/*DRILL 5*/
CREATE PROC Book_Out
AS
BEGIN
	SELECT Branch_Name,
		COUNT(Book_ID_4) AS Books_Out
		FROM BOOK_LOAN
		INNER JOIN LIBRARY_BRANCH ON Branch_ID = Branch_ID_3
		GROUP BY Branch_Name
	;
END
GO

/*DRILL*/ 
CREATE PROC Bor_5_Out
AS
BEGIN
	SELECT
		Bor_Name, Bor_Address, Bor_Phone,
		COUNT(Book_ID_4) AS Books_Currently_Out
		FROM BOOK_LOAN
		INNER JOIN BORROWER ON Card_Num = Card_Num_2
		GROUP BY Bor_Name, Bor_Address, Bor_Phone
	;
END
GO

/*DRILL 7*/
CREATE PROC Steven_King
AS
BEGIN
	SELECT
		Author_Name, Book_Title, Number_Of_Copies, Branch_Name
		FROM BOOK_COPIES
		INNER JOIN BOOK_AUTHORS ON Book_ID_2 = Book_ID_3
		INNER JOIN LIBRARY_BRANCH ON Branch_ID = Branch_ID_2
		INNER JOIN BOOKS ON Book_ID = Book_ID_3
		WHERE Branch_Name = 'Central'
		AND Author_Name = 'Stephen King'
	;
END
GO

