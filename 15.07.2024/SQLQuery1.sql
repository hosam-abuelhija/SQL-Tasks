Create database Library;
Create table Books (
BookID int,
Title varchar(255),
AuthorID int,
PublishedYear int,
CopiesAvailable int,
BookCategory varchar(255),
);

Create table Authors
(
AuthorID int,
FirstName varchar(20),
LastName varchar(20),
BirthYear int,
);

INSERT INTO Books VALUES
(1,'Inferno',1,2013,2001,'mystery thriller'),
(2,'Perfume: The Story of a Murderer',2,1985,20,'thriller'),
(3,'The Kite Runner',3,2003,400,'fiction'),
(4,'Angels and Demons',4,2000,600,'mystery thriller'),
(5,'A Thousand Splendid Suns',5,2007,50,'fiction');

INSERT INTO Authors VALUES
(1,'Dan','Brown','1964'),
(2,'Khalid','Hosseini','1965'),
(3,'Patrick','Süskind','1949'),
(4,'Dante','Alighieri','1265'),
(5,'Haruki','Murakami','1949');

SELECT * FROM Books;
SELECT * FROM Authors;

SELECT Title FROM Books
WHERE CopiesAvailable=(SELECT MAX(CopiesAvailable) FROM Books);

SELECT Title FROM Books
WHERE CopiesAvailable=(SELECT MIN(CopiesAvailable) FROM Books);

SELECT AVG(PublishedYear) FROM Books;

SELECT COUNT(BookID)  FROM Books;

TRUNCATE TABLE Books;

DROP TABLE Authors;