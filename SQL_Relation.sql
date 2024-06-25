drop database Education;
create database Education;
use Education;
CREATE TABLE Student (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20)
);
insert into Student(FirstName, LastName)
values ('Anchu','Antony'),('Anu','Anto'),('Anna','Ben');
CREATE TABLE Course (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Subject NVARCHAR(20),
    Credits INT,
    Code NVARCHAR(10)
);
insert into Course(Subject,Credits,Code) 
values('Sociology', 10, '45DPE'), ('Biology', 20, '45DBO'),('Maths', 15, '85DPE');
CREATE TABLE Address (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    StreetNumber INT,
    Street NVARCHAR(20),
    City NVARCHAR(20),
    Student_id INT,
     UNIQUE (Student_id),
    FOREIGN KEY (Student_id)
        REFERENCES Student (Id)
    
);
insert into Address(StreetNumber,Street,City,Student_id)
values(18,'halmstad','halmstad',1),(20,'halmstad','halmstad',2);
CREATE TABLE Student_Course (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Student_id INT,
   
    FOREIGN KEY (Student_id)
        REFERENCES Student (Id),
    Course_id INT,
    FOREIGN KEY (Course_id)
        REFERENCES Course (Id)
);

insert into Student_Course(Student_id,Course_id)
values(1,1),(1,2);