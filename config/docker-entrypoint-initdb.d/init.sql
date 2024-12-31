CREATE DATABASE IF NOT EXISTS db_educambi;
USE db_educambi;

CREATE TABLE IF NOT EXISTS tb_user_type (
    id INT AUTO_INCREMENT,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tb_user (
    id INT AUTO_INCREMENT,
    fk_user_type_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    photo VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (fk_user_type_id) REFERENCES tb_user_type(id),
    CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

CREATE TABLE IF NOT EXISTS tb_class (
    id INT AUTO_INCREMENT,
    fk_teacher_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    video_link VARCHAR(255),
    fk_course_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_teacher_id) REFERENCES tb_user(id)
);

CREATE TABLE IF NOT EXISTS tb_comment (
    id INT AUTO_INCREMENT,
    fk_class_id INT NOT NULL,
    fk_user_id INT NOT NULL,
    title VARCHAR(255),
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    has_verified_reply BOOLEAN DEFAULT FALSE,
    text TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_class_id) REFERENCES tb_class(id),
    FOREIGN KEY (fk_user_id) REFERENCES tb_user(id)
);

CREATE TABLE IF NOT EXISTS tb_reply (
    id INT AUTO_INCREMENT,
    fk_comment_id INT NOT NULL,
    fk_user_id INT NOT NULL,
    type INT NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    text TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_comment_id) REFERENCES tb_comment(id),
    FOREIGN KEY (fk_user_id) REFERENCES tb_user(id)
);

CREATE TABLE IF NOT EXISTS tb_support_material (
    id INT AUTO_INCREMENT,
    fk_class_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_class_id) REFERENCES tb_class(id)
);

CREATE TABLE IF NOT EXISTS tb_category (
    id INT AUTO_INCREMENT,
    fk_parent_category INT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_parent_category) REFERENCES tb_category(id)
);

CREATE TABLE IF NOT EXISTS tb_subjects (
    id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    fk_category_id INT NOT NULL,
    fk_parent_subject INT,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_category_id) REFERENCES tb_category(id),
    FOREIGN KEY (fk_parent_subject) REFERENCES tb_subjects(id)
);

CREATE TABLE IF NOT EXISTS tb_course (
    id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    fk_subject_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_subject_id) REFERENCES tb_subjects(id)
);

CREATE TABLE IF NOT EXISTS tb_favorited_courses (
    fk_course_id INT NOT NULL,
    fk_student_id INT NOT NULL,
    PRIMARY KEY (fk_course_id, fk_student_id),
    FOREIGN KEY (fk_course_id) REFERENCES tb_course(id), -- Corrected reference
    FOREIGN KEY (fk_student_id) REFERENCES tb_user(id)
);

CREATE TABLE IF NOT EXISTS tb_courses_in_progress (
    fk_course_id INT NOT NULL,
    fk_student_id INT NOT NULL,
    PRIMARY KEY (fk_course_id, fk_student_id),
    FOREIGN KEY (fk_course_id) REFERENCES tb_course(id), -- Corrected reference
    FOREIGN KEY (fk_student_id) REFERENCES tb_user(id)
);

CREATE TABLE IF NOT EXISTS tb_completed_courses (
    fk_course_id INT NOT NULL,
    fk_student_id INT NOT NULL,
    PRIMARY KEY (fk_course_id, fk_student_id),
    FOREIGN KEY (fk_course_id) REFERENCES tb_course(id), -- Corrected reference
    FOREIGN KEY (fk_student_id) REFERENCES tb_user(id)
);

-- Inserts
INSERT INTO tb_user_type (description)
VALUES ("Estudante"),("Professor"), ("Admin");

INSERT INTO tb_category (name, fk_parent_category)
VALUES
    ("Humanas", NULL),
    ("Exatas", NULL),
    ("Linguagens", 1),
    ("Biológicas", NULL);

INSERT INTO tb_subjects (title, fk_category_id, fk_parent_subject)
VALUES
    ("Matemática", 2, NULL),
    ("Português", 1, NULL),
    ("Gramática", 1, 2),
    ("Redação", 1, 2),
    ("Literatura", 1, 2),
    ("Ciências", 4, NULL),
    ("Física", 2, 6),
    ("Química", 2, 6),
    ("Biologia", 4, 6),
    ("História", 1, NULL),
    ("Filosofia", 1, NULL),
    ("Sociologia", 1, NULL),
    ("Geografia", 1, NULL),
    ("Educação Física", 4, NULL),
    ("Arte", 1, NULL);


-- Example

INSERT INTO tb_user (fk_user_type_id, first_name, last_name, email, password, date_of_birth, photo)
VALUES
    (1, "John", "Doe", "john.doe@example.com", "password123", "1990-05-15", "path/to/photo.jpg"),
    (2, "Jane", "Smith", "jane.smith@example.com", "securePass456", "1985-10-22", "path/to/photo2.jpg"),
    (1, "Alice", "Johnson", "alice.johnson@example.com", "mypassword789", "1992-03-30", NULL);
