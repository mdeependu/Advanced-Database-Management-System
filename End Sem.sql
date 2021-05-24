CREATE DATABASE UPESUNIVERSITY

USE UPESUNIVERSITY

--1

CREATE TABLE STUDENT
(NAME CHAR(20) NOT NULL, STUDENT_NUMBER INTEGER NOT NULL, CLASS INTEGER NOT NULL, MAJOR CHAR(10), PRIMARY KEY (STUDENT_NUMBER));

CREATE TABLE COURSE
(COURSE_NAME CHAR(30) NOT NULL, COURSE_NUMBER CHAR(20) NOT NULL, CREDIT_HOURS INTEGER, DEPARTMENT CHAR(10), PRIMARY KEY (COURSE_NUMBER),UNIQUE (COURSE_NAME));

CREATE TABLE PREREQUISITE
(COURSE_NUMBER CHAR(20) NOT NULL, PREREQUISITE_NUMBER CHAR(20) NOT NULL, PRIMARY KEY (COURSE_NUMBER, PREREQUISITE_NUMBER), FOREIGN KEY (COURSE_NUMBER) REFERENCES COURSE (COURSE_NUMBER), FOREIGN KEY (PREREQUISITE_NUMBER) REFERENCES COURSE (COURSE_NUMBER));

CREATE TABLE SECTION
(SECTION_IDENTIFIER INTEGER, COURSE_NUMBER CHAR(20), SEMESTER CHAR(10), YEAR INTEGER, INSTRUCTOR CHAR(20), PRIMARY KEY (SECTION_IDENTIFIER), FOREIGN KEY (COURSE_NUMBER) REFERENCES COURSE (COURSE_NUMBER));

CREATE TABLE GRADE_REPORT
(STUDENT_NUMBER INTEGER, SECTION_IDENTIFIER INTEGER, GRADE CHAR(3), PRIMARY KEY (STUDENT_NUMBER, SECTION_IDENTIFIER), FOREIGN KEY (STUDENT_NUMBER) REFERENCES STUDENT (STUDENT_NUMBER), FOREIGN KEY (SECTION_IDENTIFIER) REFERENCES SECTION (SECTION_IDENTIFIER));


--2

--STUDENT
INSERT INTO STUDENT VALUES ('SMITH',17,1,'CS');
INSERT INTO STUDENT VALUES ('BROWN',8,2,'CS');

--COURSE
INSERT INTO COURSE VALUES ('INTRO_TO_COMPUTER_SCIENCE','CS1310',4,'CS');
INSERT INTO COURSE VALUES ('DATA_STRUCTURES','CS3320',4,'CS');
INSERT INTO COURSE VALUES ('INTRO_TO_COMPUTER_SCIENCE','MATH2410',3,'MATH');
INSERT INTO COURSE VALUES ('INTRO_TO_COMPUTER_SCIENCE','CS3380',3,'CS');

--SECTION
INSERT INTO SECTION VALUES (85,'MATH2410','FALL',07,'KING');
INSERT INTO SECTION VALUES (92,'CS1310','FALL',07,'ANDERSON');
INSERT INTO SECTION VALUES (102,'CS3320','SPRING',08,'KRUTH');
INSERT INTO SECTION VALUES (112,'MATH2410','FALL',08,'CHANG');
INSERT INTO SECTION VALUES (119,'CS1310','FALL',08,'ANDERSON');
INSERT INTO SECTION VALUES (135,'CS3380','FALL',08,'STONE');

--GRADE_REPORT
INSERT INTO GRADE_REPORT VALUES (17,112,'B');
INSERT INTO GRADE_REPORT VALUES (17,119,'C');
INSERT INTO GRADE_REPORT VALUES (8,85,'A');
INSERT INTO GRADE_REPORT VALUES (8,92,'A');
INSERT INTO GRADE_REPORT VALUES (8,102,'B');
INSERT INTO GRADE_REPORT VALUES (8,135,'A');

--PREREQUISITES
INSERT INTO PREREQUISITE VALUES ('CS3380','CS3320');
INSERT INTO PREREQUISITE VALUES ('CS3380','MATH2410');
INSERT INTO PREREQUISITE VALUES ('CS3320','CS1310');

--3
 
SELECT NAME
FROM STUDENT
WHERE MAJOR='CS'

SELECT COURSE_NAME
FROM COURSE, SECTION
WHERE COURSE.COURSE_NUMBER=SECTION.COURSE_NUMBER AND Instructor='KING'
AND (YEAR=07 OR YEAR=08)

SELECT COURSE_NUMBER, SEMESTER, YEAR, COUNT(*)
FROM SECTION, GRADE_REPORT
WHERE INSTRUCTOR='KING' AND SECTION.SECTION_IDENTIFIER=GRADE_REPORT.SECTION_IDENTIFIER
GROUP BY Course_Number, Semester, Year

SELECT NAME, COURSE_NAME, C.COURSE_NUMBER, CREDIT_HOURS, SEMESTER, YEAR, GRADE
FROM STUDENT ST, COURSE C, SECTION S, GRADE_REPORT G
WHERE CLASS=4 AND MAJOR='CS' AND ST.STUDENT_NUMBER=G.STUDENT_NUMBER

INSERT INTO STUDENT
VALUES ('JOHNSON', 25, 1, 'MATH')

UPDATE STUDENT
SET CLASS = 2
WHERE NAME='SMITH'

INSERT INTO COURSE
VALUES ('KNOWLEDGE ENGINEERING','CS4390', 3,'CS')

DELETE FROM STUDENT
WHERE NAME='SMITH' AND STUDENT_NUMBER=17