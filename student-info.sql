-- Create a database
CREATE DATABASE Schooldb;


-- Use database
Use Schooldb;




-- Create the Students table (1-M relationship with Enrollments)
CREATE TABLE Students (
    student_id INT PRIMARY KEY,           
    first_name VARCHAR(50) NOT NULL,      
    last_name VARCHAR(50) NOT NULL,        
    email VARCHAR(100) UNIQUE NOT NULL,    
    date_of_birth DATE NOT NULL,           
    enrollment_date DATE NOT NULL          
);

-- Create the Teachers table (1-M relationship with Courses)
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,            
    first_name VARCHAR(50) NOT NULL,       
    last_name VARCHAR(50) NOT NULL,        
    email VARCHAR(100) UNIQUE NOT NULL,    
    hire_date DATE NOT NULL                
);

-- Create the Courses table (1-M relationship with Teachers)
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,             
    course_name VARCHAR(100) NOT NULL,     
    teacher_id INT,                       
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id) ON DELETE SET NULL 
);

-- Create the Enrollments table (Many-to-Many relationship between Students and Courses)
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,         
    student_id INT NOT NULL,                
    course_id INT NOT NULL,                 
    enrollment_date DATE NOT NULL,          
    grade CHAR(1),                          
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,  
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,    
    UNIQUE (student_id, course_id)          
);

-- Create the StudentAddresses table (1-1 relationship with Students)
CREATE TABLE StudentAddresses (
    address_id INT PRIMARY KEY,             
    student_id INT NOT NULL,                
    street_address VARCHAR(100),             
    city VARCHAR(50),                        
    state VARCHAR(50),                    
    postal_code VARCHAR(20),                 
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,  
    UNIQUE (student_id)                      
);

-- Create the CoursePrerequisites table (Many-to-Many relationship for course prerequisites)
CREATE TABLE CoursePrerequisites (
    course_id INT NOT NULL,                 
    prerequisite_course_id INT NOT NULL,     
    PRIMARY KEY (course_id, prerequisite_course_id), 
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,           
    FOREIGN KEY (prerequisite_course_id) REFERENCES Courses(course_id) ON DELETE CASCADE 
);


-- Insert data into Students table
INSERT INTO Students (student_id, first_name, last_name, email, date_of_birth, enrollment_date)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2000-04-15', '2023-01-10'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '1999-08-23', '2023-02-01');

-- Insert data into Teachers table
INSERT INTO Teachers (teacher_id, first_name, last_name, email, hire_date)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '2015-08-10'),
(2, 'Bob', 'Williams', 'bob.williams@example.com', '2018-06-15');

-- Insert data into Courses table
INSERT INTO Courses (course_id, course_name, teacher_id)
VALUES
(1, 'Introduction to Computer Science', 1),
(2, 'Database Systems', 2);

-- Insert data into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, grade)
VALUES
(1, 1, 1, '2023-01-10', 'A'),
(2, 1, 2, '2023-01-15', 'B'),
(3, 2, 2, '2023-02-01', 'A');

-- Insert data into StudentAddresses table
INSERT INTO StudentAddresses (address_id, student_id, street_address, city, state, postal_code)
VALUES
(1, 1, '123 Main St', 'New York', 'NY', '10001'),
(2, 2, '456 Oak Rd', 'Los Angeles', 'CA', '90001');

-- Insert data into CoursePrerequisites table (optional)
INSERT INTO CoursePrerequisites (course_id, prerequisite_course_id)
VALUES
(2, 1); 
