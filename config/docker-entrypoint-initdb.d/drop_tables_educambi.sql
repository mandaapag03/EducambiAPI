USE db_educambi;

-- Drop tables in reverse order of dependencies
DROP TABLE IF EXISTS tb_completed_courses;
DROP TABLE IF EXISTS tb_courses_in_progress;
DROP TABLE IF EXISTS tb_favorited_courses;
DROP TABLE IF EXISTS tb_support_material;
DROP TABLE IF EXISTS tb_reply;
DROP TABLE IF EXISTS tb_comment;
DROP TABLE IF EXISTS tb_class;
DROP TABLE IF EXISTS tb_course;
DROP TABLE IF EXISTS tb_subjects;
DROP TABLE IF EXISTS tb_category;
DROP TABLE IF EXISTS tb_user;
DROP TABLE IF EXISTS tb_auth;
DROP TABLE IF EXISTS tb_user_type;

DROP DATABASE IF EXISTS db_educambi;