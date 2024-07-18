Create Database library_System1

Create Table Authors(
ID int primary key identity(1,1),
FirstName varchar(20),
LastName varchar(20));

Create Table Sections(
ID int primary key identity(1,1),
Section varchar(50));

Create Table Categories(
ID int primary key identity(1,1),
Categorie varchar(50),
SectionID int,
FOREIGN KEY (SectionID) REFERENCES Sections(ID));

Create Table Employees(
ID int primary key identity(1,1),
FirstName varchar(20),
LastName varchar(20),
SectionID int,
FOREIGN KEY (SectionID) REFERENCES Sections(ID));

Create Table Users(
ID int primary key identity(1,1),
FirstName varchar(20),
LastName varchar(20));

Create Table Books(
ID int primary key identity(1,1),
Name varchar(50),
AuthorID int,
UserID int,
FOREIGN KEY (AuthorID) REFERENCES Authors(ID),
FOREIGN KEY (UserID) REFERENCES Users(ID));

Create Table Books_Categories(
BookID int,
CategorieID int,
FOREIGN KEY (BookID) REFERENCES Books(ID),
FOREIGN KEY (CategorieID) REFERENCES Categories(ID));


INSERT INTO Authors (FirstName, LastName) VALUES 
('J.K.', 'Rowling'),
('George', 'Orwell'),
('Jane', 'Austen'),
('Mark', 'Twain'),
('Harper', 'Lee');

INSERT INTO Sections (Section) VALUES 
('Fiction'),
('Non-Fiction'),
('Science'),
('History'),
('Biography');

INSERT INTO Categories (Categorie, SectionID) VALUES 
('Fantasy', 1),
('Dystopian', 1),
('Classics', 1),
('Adventure', 1),
('Historical Fiction', 4);

INSERT INTO Employees (FirstName, LastName, SectionID) VALUES 
('Alice', 'Johnson', 1),
('Bob', 'Smith', 2),
('Carol', 'Davis', 3),
('David', 'Wilson', 4),
('Eve', 'Miller', 5);

INSERT INTO Users (FirstName, LastName) VALUES 
('John', 'Doe'),
('Emma', 'Brown'),
('Michael', 'Taylor'),
('Olivia', 'Anderson'),
('Liam', 'Thomas');

INSERT INTO Books (Name, AuthorID, UserID) VALUES 
('Harry Potter and the Sorcerers Stone', 1, 1),
('1984', 2, 2),
('Pride and Prejudice', 3, 3),
('The Adventures of Tom Sawyer', 4, 4),
('To Kill a Mockingbird', 5, 5);

INSERT INTO Books_Categories (BookID, CategorieID) VALUES 
(1, 1),  -- Harry Potter and the Sorcerer's Stone -> Fantasy
(2, 2),  -- 1984 -> Dystopian
(3, 3),  -- Pride and Prejudice -> Classics
(4, 4),  -- The Adventures of Tom Sawyer -> Adventure
(5, 5);  -- To Kill a Mockingbird -> Historical Fiction

-----------------------------------------------------------------

--one--TO--many
--INNER
SELECT Books.Name, Authors.FirstName, Authors.LastName FROM Books
 JOIN Authors ON Books.authorID = Authors.ID;

--LEFT
 SELECT  Books.Name, Authors.FirstName, Authors.LastName FROM Books
LEFT JOIN Authors ON Books.authorID = Authors.ID;

--RIGHT
SELECT Books.Name, Authors.FirstName, Authors.LastName FROM Books
RIGHT JOIN Authors ON Books.authorID = Authors.ID;

--FULL
SELECT Books.Name, Authors.FirstName, Authors.LastName FROM Books
FULL OUTER JOIN Authors ON Books.authorID = Authors.ID;

---------------------------------------------------------------------------
--many--TO--many
--INNER
SELECT Books.Name, Categories.Categorie FROM Books
JOIN Books_Categories ON Books.ID = Books_Categories.bookID 
JOIN Categories ON Books_Categories.CategorieID = Categories.ID;

--LEFT
SELECT Books.Name, Categories.Categorie FROM Books
LEFT JOIN Books_Categories ON Books.ID = Books_Categories.bookID 
LEFT JOIN Categories ON Books_Categories.CategorieID = Categories.ID;

--RHIGHT
SELECT Books.Name, Categories.Categorie FROM Books
RIGHT JOIN Books_Categories ON Books.ID = Books_Categories.bookID 
RIGHT JOIN Categories ON Books_Categories.CategorieID = Categories.ID;

--FULL
SELECT Books.Name, Categories.Categorie FROM Books
FULL OUTER JOIN Books_Categories ON Books.ID = Books_Categories.bookID 
FULL OUTER JOIN Categories ON Books_Categories.CategorieID = Categories.ID;
