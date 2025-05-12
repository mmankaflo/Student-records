# 📚 **Student Records Relational Database**
# 📝 Description
This project is a well-structured SQL-based relational database designed to manage student records. It includes key entities such as Students, Teachers, Courses, Enrollments, Student Addresses, and Course Prerequisites. The schema uses proper data types, primary and foreign key constraints, and supports 1-to-1, 1-to-many, and many-to-many relationships.

# 📦 Project Features
Students can enroll in multiple courses (M-M)

Each course is taught by one teacher (1-M)

Each student has one address (1-1)

Courses can have prerequisite courses (M-M)

Enforced constraints: PKs, FKs, NOT NULL, UNIQUE, and CASCADE rules

# ⚙️ How to Run / Import the SQL
Clone this repository

bash
Copy
Edit
git clone (https://github.com/mmankaflo/Student-records.git)
cd student-records-db
Open your SQL client or DBMS (e.g., MySQL Workbench, pgAdmin, DBeaver)

Create a new database
Example:

sql
Copy
Edit
CREATE DATABASE student_records;
USE student_records;
Import the SQL schema

Open the student-info.sql file

Run the script to create all tables and (optionally) insert sample data

# 🖼️ ERD (Entity-Relationship Diagram)
You can generate and view the ERD using tools like:

dbdiagram.io

DrawSQL

QuickDBD

# 📎 Example ERD Link (replace with yours):
View ERD


# ✅ Submission Checklist
 Tables created with appropriate constraints

 1-1, 1-M, M-M relationships established

 SQL file ready for execution

 README with setup and ERD

