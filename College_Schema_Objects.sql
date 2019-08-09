
CREATE DATABASE COLLEGE;

CREATE TABLE STUDENT (
    STUD_NUMBER NUMERIC(5) NOT NULL,
    STUD_LNAME  VARCHAR(30) NOT NULL,
    STUD_FNAME  VARCHAR(30) NOT NULL,
    STUD_SALUTATION VARCHAR(5),
    STUD_ADDRESS    VARCHAR(100),
    STUD_POSTAL_CODE    CHAR(3),
    STUD_DOB_YEAR   NUMERIC(4),
    HALL_NUMBER VARCHAR(5) NOT NULL,
    PROG_NUMBER CHAR(5) NOT NULL,
    CONSTRAINT STUDENT_PK PRIMARY KEY(STUD_NUMBER),
    CONSTRAINT DOB_CHECK CHECK(STUD_DOB_YEAR > 1900),
    CONSTRAINT SALUTATION_CHECK CHECK(STUD_SALUTATION IN ('Mr.','Mrs.', 'Miss.', 'Hon.', 'Rev.', 'Prof.', 'Dr.'))
);

CREATE TABLE PROGRAM (
    PROG_NUMBER CHAR(5) NOT NULL,
    PROG_NAME   VARCHAR(100) NOT NULL,
    CONSTRAINT PROGRAM_PK PRIMARY KEY (PROG_NUMBER),
    CONSTRAINT PROG_NAME_UN UNIQUE (PROG_NAME)
);

CREATE TABLE HALL (
    HALL_NUMBER VARCHAR(5) NOT NULL,
    HALL_NAME   VARCHAR(100) NOT NULL,
    CONSTRAINT HALL_PK PRIMARY KEY (HALL_NUMBER),
    CONSTRAINT HALL_NAME_UN UNIQUE (HALL_NAME)
);

CREATE TABLE DEPARTMENT (
    DEPT_NUMBER CHAR(3) NOT NULL,
    DEPT_NAME   VARCHAR(100) NOT NULL,
    DEPT_HEAD   CHAR(3) NOT NULL,
    DEPT_DIV_NUMBER CHAR(3) NOT NULL,
    CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DEPT_NUMBER)
);

CREATE TABLE STAFF (
    STAFF_NUMBER    CHAR(3) NOT NULL,
    STAFF_SALUTATION    VARCHAR(5),
    STAFF_LNAME VARCHAR(30) NOT NULL,
    STAFF_FNAME VARCHAR(30) NOT NULL,
    CONSTRAINT STAFF_PK PRIMARY KEY(STAFF_NUMBER),
    CONSTRAINT STAFF_SALUTATION_CHECK CHECK(STAFF_SALUTATION IN ('Mr.','Mrs.', 'Miss.', 'Hon.', 'Rev.', 'Prof.', 'Dr.')),
    CONSTRAINT STAFF_NUMBER_CHECK CHECK(STAFF_NUMBER LIKE 'S%')
);

CREATE TABLE COURSE (
    CRS_CODE CHAR(5) NOT NULL,
    CRS_NAME    VARCHAR(50) NOT NULL,
    CONSTRAINT COURSE_PK PRIMARY KEY (CRS_CODE),
    CONSTRAINT CRS_NAME_UN UNIQUE(CRS_NAME)
);

CREATE TABLE DIVISION (
    DIV_NUMBER  CHAR(3) NOT NULL,
    DIV_NAME    VARCHAR(50) NOT NULL,
    DIV_HEAD    CHAR(3) DEFAULT NULL, 
    CONSTRAINT DIVISION_PK PRIMARY KEY(DIV_NUMBER),
    CONSTRAINT DIV_NAME_UN UNIQUE(DIV_NAME)

);

CREATE TABLE PROGRAM_STRUCTURE(
    PS_PROG_NUMBER CHAR(4) NOT NULL,
    PS_COURSE_CODE CHAR(5) NOT NULL,
    PS_CODE_SEQ_NUMBER NUMERIC(3) NOT NULL,
    CONSTRAINT PROGRAM_STRUCTURE_PK PRIMARY KEY(PS_PROG_NUMBER,PS_COURSE_CODE)
);

CREATE TABLE ADDRESS (
    POSTAL_CODE CHAR(3) NOT NULL,
    PLACE_NAME  VARCHAR(200) DEFAULT NULL,
    PROVINCE    VARCHAR(30) DEFAULT NULL,
    CONSTRAINT ADDRESS_PK PRIMARY KEY(POSTAL_CODE),
    CONSTRAINT POSTAL_CODE_CHECK CHECK(POSTAL_CODE LIKE '___')
);

