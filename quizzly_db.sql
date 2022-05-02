
/* CREATE DATABASE quizzlydb; */


DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT, 
    username varchar(20) NOT NULL,
    user_password varchar(25) NOT NULL,
    user_type VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL, 
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO users 
(id, username, user_password, user_type, email, first_name, surname)
VALUES (1, 'admin', 'admin', 1, 'admin@gmail.com', 'adminName', 'adminSurname' ),
(2, 'admin2', 'admin2', 1, 'admin2@gmail.com', 'admin2Name', 'admin2Surname' ),
(3, 'prof', 'prof', 2, 'prof@gmail.com', 'profName', 'profSurname' ),
(4, 'prof2', 'prof2', 2, 'prof2@gmail.com', 'prof2Name', 'prof2Surname' ),
(5, 'student', 'student', 3, 'student@gmail.com', 'studentName', 'studentSurname' ),
(6, 'student2', 'student2', 3, 'student2@gmail.com', 'student2Name', 'student2Surname' );


DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses (
    id INT NOT NULL AUTO_INCREMENT, 
    professor_id INT NOT NULL,
    course_name VARCHAR(25),
    course_description VARCHAR(100),
    tags VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (professor_id)
    REFERENCES users (id)
);

INSERT INTO courses 
(id, professor_id, course_name, course_description, tags)
VALUES (1, 3, 'course1', 'course1description', 'course1tags'),
(2, 4, 'course2', 'cpurse2description', 'course2tags');


DROP TABLE IF EXISTS quizzes;
CREATE TABLE IF NOT EXISTS quizzes (
    id INT NOT NULL AUTO_INCREMENT,
    course_id INT NOT NULL,
    quiz_name VARCHAR(25) NOT NULL,
    quiz_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    topic VARCHAR(25),
    tags VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (course_id)
    REFERENCES courses (id)
);

INSERT INTO quizzes
(id, course_id, quiz_name, quiz_date, topic, tags)
VALUES (1, 1, 'quiz1', CURRENT_TIMESTAMP, 'quiz1topic', 'quiz1tags'),
(2, 1, 'quiz2', CURRENT_TIMESTAMP, 'quiz2topic', 'quiz2tags'),
(3, 2, 'quiz3', CURRENT_TIMESTAMP, 'quiz3topic', 'quiz3tags'),
(4, 2, 'quiz4',CURRENT_TIMESTAMP , 'quiz4topic', 'quiz4tags');


DROP TABLE IF EXISTS contact;
CREATE TABLE IF NOT EXISTS contact (
    id INT NOT NULL AUTO_INCREMENT, 
    contactname varchar(25) NOT NULL,
    email varchar(50) NOT NULL,
    cmessage varchar(1000),
    csubject varchar(255),
    PRIMARY KEY (id)  
);

DROP TABLE IF EXISTS enrollment;
CREATE TABLE IF NOT EXISTS enrollment (
    id INT NOT NULL AUTO_INCREMENT, 
    id_student INT NOT NULL,
    id_course INT NOT NULL,
    PRIMARY KEY (id) ,
    FOREIGN KEY (id_student)
    REFERENCES users (id),
    FOREIGN KEY (id_course)
    REFERENCES courses (id)
);

INSERT INTO enrollment
(id,id_student, id_course)
VALUES (1, 5, 1),
(2, 5, 2),
(3, 6, 2);



DROP TABLE IF EXISTS quiz_grades;
CREATE TABLE IF NOT EXISTS quiz_grades (
    grade_id INT NOT NULL AUTO_INCREMENT,
    student_id INT NOT NULL,
    quiz_id INT NOT NULL,
    course_id INT NOT NULL,
    quiz_grade FLOAT NOT NULL,
    PRIMARY KEY (grade_id),
    FOREIGN KEY (student_id)
    REFERENCES users (id), 
    FOREIGN KEY (quiz_id)
    REFERENCES quizzes (id),
    FOREIGN KEY (course_id)
    REFERENCES courses (id)
);


INSERT INTO quiz_grades
(grade_id, student_id, quiz_id, course_id, quiz_grade)
VALUES (1, 5, 1, 1, 25),
(2, 5, 2, 1, 75),
(3, 5, 3, 2, 80),
(4, 5, 4, 2, 30),
(5, 6, 3, 2, 60),
(6, 6, 4, 2, 90);


CREATE TABLE `file` (
  `file_id` int(11) NOT NULL,
  `file` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
