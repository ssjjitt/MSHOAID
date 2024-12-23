DROP TABLE FACULTY;
DROP TABLE PROFESSION;
DROP TABLE PULPIT;
DROP TABLE TEACHER;
DROP TABLE SUBJECT;
DROP TABLE GROUPS;
DROP TABLE STUDENT;
DROP TABLE PROGRESS;

ALTER TABLE TEACHER
MODIFY GENDER CHAR(2);

ALTER TABLE SUBJECT
MODIFY TEACHER CHAR(10);

CREATE TABLE FACULTY (
    FACULTY CHAR(10) CONSTRAINT FACULTY_PK PRIMARY KEY,
    FACULTY_NAME VARCHAR2(50) DEFAULT '???'
);

CREATE TABLE PROFESSION (
    PROFESSION CHAR(20) CONSTRAINT PROFESSION_PK PRIMARY KEY,
    FACULTY CHAR(10) CONSTRAINT PROFESSION_FACULTY_FK REFERENCES FACULTY(FACULTY),
    PROFESSION_NAME VARCHAR2(100),
    QUALIFICATION VARCHAR2(50)
);

CREATE TABLE PULPIT (
PULPIT CHAR(20) CONSTRAINT PULPIT_PK PRIMARY KEY,
PULPIT_NAME VARCHAR2(100),
FACULTY CHAR(10) CONSTRAINT PULPIT_FACULTY_FK REFERENCES FACULTY(FACULTY)
);

CREATE TABLE TEACHER (
TEACHER CHAR(10) CONSTRAINT TEACHER_PK PRIMARY KEY,
TEACHER_NAME VARCHAR2(100),
TEACHER_SURNAME VARCHAR2(100),
TEACHER_PATRONYMIC VARCHAR2(100),
GENDER CHAR(1) CHECK (GENDER IN ('�', '�')),
START_DATE DATE NOT NULL,
WORK_TIME DECIMAL(10, 2) NOT NULL,
PULPIT CHAR(20) CONSTRAINT TEACHER_PULPIT_FK REFERENCES PULPIT(PULPIT)
);

CREATE TABLE SUBJECT (
SUBJECT CHAR(10) CONSTRAINT SUBJECT_PK PRIMARY KEY,
SUBJECT_NAME VARCHAR2(100) UNIQUE,
TEACHER CHAR(10) CONSTRAINT SUBJECT_TEACHER_FK REFERENCES TEACHER(TEACHER)
);

CREATE TABLE GROUPS (
IDGROUP NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT GROUP_PK PRIMARY KEY,
FACULTY CHAR(10) CONSTRAINT GROUPS_FACULTY_FK REFERENCES FACULTY(FACULTY),
PROFESSION CHAR(20) CONSTRAINT GROUPS_PROFESSION_FK REFERENCES PROFESSION(PROFESSION),
YEAR_FIRST SMALLINT CHECK (YEAR_FIRST <= 9999)
);

CREATE TABLE STUDENT (
IDSTUDENT NUMBER GENERATED BY DEFAULT AS IDENTITY CONSTRAINT STUDENT_PK PRIMARY KEY,
IDGROUP NUMBER CONSTRAINT STUDENT_GROUP_FK REFERENCES GROUPS(IDGROUP),
STUDENT_NAME NVARCHAR2(100),
STUDENT_SURNAME VARCHAR2(100),
STUDENT_PATRONYMIC VARCHAR2(100),
BDAY DATE
);

CREATE TABLE PROGRESS (
SUBJECT CHAR(10) CONSTRAINT PROGRESS_SUBJECT_FK REFERENCES SUBJECT(SUBJECT),
IDSTUDENT NUMBER CONSTRAINT PROGRESS_IDSTUDENT_FK REFERENCES STUDENT(IDSTUDENT),
PDATE DATE,
ESTIMATION INTEGER CHECK (ESTIMATION BETWEEN 1 AND 10),
CONSTRAINT PROGRESS_PK PRIMARY KEY (SUBJECT, IDSTUDENT, PDATE)
);