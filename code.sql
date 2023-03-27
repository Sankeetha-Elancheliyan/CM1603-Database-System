CREATE DATABASE ACL_Library;
USE ACL_Library;
CREATE TABLE ACLUser
(
    user_id varchar(8) NOT NULL,
    fname varchar(25) NOT NULL,
    lname varchar(25) NOT NULL,
    address varchar (50) NOT NULL,
    PRIMARY KEY (user_id)
    
    
);

CREATE TABLE TP_no_user
(
    TP_no char(10) NOT NULL,
    user_id varchar(8) NOT NULL,
    PRIMARY KEY (TP_no),
    FOREIGN KEY (user_id) REFERENCES ACLUser(user_id)
    
    
);

CREATE TABLE Book
(
    ISBN char(13) NOT NULL,
    Title varchar(50) NOT NULL,
    author varchar(50) NOT NULL,
    Publisher varchar(25) NOT NULL,
    Year_published YEAR NOT NULL,
    no_copies INTEGER NOT NULL,
    PRIMARY KEY (ISBN)
    
    
);

CREATE TABLE Journal_info
(
    ISSN int(8) NOT NULL,
    JournalName varchar(25) NOT NULL,
    Publisher varchar(25) NOT NULL,
    Description varchar(250),
    year_published YEAR,
    subscriptionCost Decimal(6),
    PRIMARY KEY (ISSN)
    
    
);
    
CREATE TABLE Article
(
    manuscript_id varchar(10) NOT NULL,
    title varchar(50) NOT NULL,
    issue INTEGER(100) NOT NULL,
    volume INTEGER(100) NOT NULL,
    abstract varchar(500) NOT NULL,
    ISSN INTEGER(8) NOT NULL,
    PRIMARY KEY(manuscript_id),
    FOREIGN KEY(ISSN) REFERENCES Journal_info(ISSN)
    
    
);
 
CREATE TABLE Librarian
(
    Lib_id varchar(8) NOT NULL,
    fname varchar(25) NOT NULL,
    lname varchar(25) NOT NULL,
    address varchar (50) NOT NULL,
    PRIMARY KEY (Lib_id)

    
);


CREATE TABLE bookCopy
(
    barcode varchar(43) NOT NULL,
    ISBN char(13) NOT NULL,
    availability varchar(25) NOT NULL,
    PRIMARY KEY (barcode),
    FOREIGN KEY (ISBN) REFERENCES book(ISBN)
    
    
    
);


CREATE TABLE TP_no_Lib
(
    TP_no char(10) NOT NULL,
    Lib_id varchar(8) NOT NULL,
    PRIMARY KEY (TP_no),
    FOREIGN KEY (Lib_id) REFERENCES Librarian(Lib_id)
    
    
);

CREATE TABLE Author
(
    author_id varchar(8) NOT NULL,
    author_name varchar(25) NOT NULL,
    PRIMARY KEY (author_id)
    
    
);

CREATE TABLE Author_manuscript
(
    author_id varchar(8) NOT NULL,
    manuscript_id varchar(10) NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (manuscript_id) REFERENCES Article(manuscript_id),
    CONSTRAINT PK_Author_manuscript PRIMARY KEY (author_id,manuscript_id)
    
);

CREATE TABLE Order_
(
    ISBN char(13) NOT NULL,
    Lib_id varchar(8) NOT NULL,
    barcode  varchar(43) ,
    order_date date NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (Lib_id) REFERENCES Librarian(Lib_id),
    FOREIGN KEY (barcode) REFERENCES BookCopy(barcode),
    CONSTRAINT PK_Order_ PRIMARY KEY (ISBN,Lib_id,barcode)
    
    
);

CREATE TABLE Reserve
(
    user_id varchar(8) NOT NULL,
    ISBN char(13) NOT NULL,
    Reserve_date Date NOT NULL,
    FOREIGN KEY (user_id) REFERENCES ACLUser(user_id),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    CONSTRAINT PK_Reserve PRIMARY KEY (user_id,ISBN)
    
    
    
);

CREATE TABLE Journal
(
    J_barcode varchar(43) NOT NULL,
    ISSN int(8) NOT NULL,
    PRIMARY KEY (J_barcode),
    FOREIGN KEY (ISSN) REFERENCES Journal_info(ISSN)
    
    
);

CREATE TABLE Borrow
(
    user_id varchar(8) NOT NULL,
    barcode  varchar(43) NOT NULL,
    check_out_date date NOT NULL,
    check_in_date date ,
    due_date date NOT NULL,
    FOREIGN KEY (user_id) REFERENCES ACLUser(user_id),
    FOREIGN KEY (barcode) REFERENCES BookCopy(barcode),
    CONSTRAINT PK_Borrow PRIMARY KEY (user_id,barcode)
    
    
    
);

INSERT INTO ACLUser VALUES
('20201001','Sam','Anderson','No.20,Lily Avenue,Col-06'),
('20201002','Robert','Gorden','No.22,Maya Avenue,Col-07'),
('20201003','Niall','Horan','No.45,School lane,Col-06'),
('20201004','Harry','Styles','No.80,Church road,Col-11'),
('20201005','Amal','Perera','No.80,Church road,Col-11');  


INSERT INTO journal_info VALUES
(73520148,'The Wisdom','Wisdom Publishers','Award winning magazine in year 2001',2004,25000),
(73520147,'E&T','IET','Engineering and technology based magazine',2012,5000),
(73520146,'IEEE','IEEE pub','engineering related journal',2015,10000),
(73520145,'ACM','ACM pub', 'scientific journal',2010,5000),
(73520148,'Science Direct','science publishers','Research journal',2005,4500);



INSERT INTO article VALUES
('1549648725','The Ultimate Productivity Hack is saying no',5,5,'productivity tip for everyone',73520148),
('1549648724', 'Productivity tips',5,6,'productivity tip for everyone part 2',73520147),
('1549648723','Benefits of Journaling',5,5,'why you should start journaling',73520146),
('1549648722','Why you should think more',4,3,'magic of thinking big',73520145),
VALUES('1549648721','Hackathons',5,5,'why you should do hackathons.',73520148);



INSERT INTO book VALUES
('ASC148765492P','Magic of Thinking Big','James Bond','JS Pub',2000,5),
('EDK4572049PE7', 'Courage to be disliked','Ichio Kaku','MS pub',2000,4),
('SKLE784596145','Steve Jobs','Luis Thompson','DS pub',2005,4),
('DEH75831467LI','Mother Teresa','John Lee','JS Pub',2006,2),
('AREV45832075L','Brida','Paulo Coelho','MS pub',2012,2);



INSERT INTO bookcopy (barcode,availability,ISBN)
VALUES
('1548V78527894','available','AREV45832075L'),
('SA789IO785214','not available','ASC148765492P'),
('SKA4727472879','available','DEH75831467LI'),
('7HJ85478O9648','not available','EDK4572049PE7'),
('QT45876BL48612','available','SKLE784596145');



INSERT INTO author VALUES
('1001','James Henry'),
('1002','Oscar Wilde'),
('1003','Roald Dhal'),
('1004','Raymond Chang'),
('1005','Jack Welch');



INSERT INTO author_manuscript VALUES
('1001','1549648725'),
('1002','1549648723'),
('1003','1549648724'),
('1004','1549648721'),
('1005','1549648722');


INSERT INTO tp_no_user VALUES
('0785549872','20201001'),
('0766482751','20201002'),
('0777004587','20201003'),
('0766782482','20201004'),
('0777555400','20201005');



INSERT INTO borrow (user_id,barcode,check_out_date,check_in_date,due_date)
VALUES
('20201001','1548V78527894','2020-11-22','2020-12-07','2020-12-22'),
('20201002','7HJ85478O9648','2021-12-08','2021-12-11', '2021-12-22'),
('20201003','QT45876BL48612','2021-11-22','2021-12-06','2021-12-07'),
('20201004','SA789IO785214','2020-12-04','2020-12-06', '2020-12-18'),
('20201005','SKA4727472879','2020-12-08','2020-12-20', '2020-12-22');


INSERT INTO Librarian VALUES
('L0201001','Carl','Anderson','No.20,Lily Avenue,Col-06'),
('L0201002','Peter','Parker','No.22,Maya Avenue,Col-07'),
('L0201003','Mary','William','No.45,School lane,Col-06'),
('L0201004','Chris','Dave','No.80,Church road,Col-11'),
('L0201005','Ann','Fernando','No.80,Church road,Col-11'); 



INSERT INTO reserve (user_id,ISBN,Reserve_date)
VALUES
('20201001','AREV45832075L','2020-11-22'),
('20201002','ASC148765492P','2021-12-08'),
('20201003','DEH75831467LI','2021-11-22'),
('20201004','EDK4572049PE7','2020-12-04'),
('20201005','SKLE784596145','2020-12-08'); 


INSERT INTO tp_no_Lib VALUES
('0785789421','L0201001'),
('0766451548','L0201002'),
('0772141978','L0201003'),
('0766782428','L0201004'),
('0777555405','L0201005');


INSERT INTO journal VALUES

('J1000500',73520144),
('J1000501',73520145),
('J1000502',73520146),
('J1000503',73520147),
('J1000504',73520148);


INSERT INTO order_ (ISBN,Lib_id,barcode,order_date)
VALUES 
('AREV45832075L','L0201005','1548V78527894','2000-03-02'),
('ASC148765492P','L0201005','7HJ85478O9648','2000-02-01'),
('DEH75831467LI','L0201005','QT45876BL48612','2001-03-03'),
('EDK4572049PE7','L0201004','SA789IO785214','2010-02-01'),
('SKLE784596145','L0201002','SKA4727472879','2014-02-05');








SELECT Title 
FROM book
WHERE Year_published='2000';

SELECT Publisher,Description
FROM journal_info
WHERE JournalName='The Wisdom';



SELECT Title FROM book
WHERE ISBN=(SELECT ISBN from reserve WHERE user_id=(select user_id FROM ACLUser WHERE (fname='Amal')AND (lname='Perera')));

    