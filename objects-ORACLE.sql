CREATE INDEX IX_Teacher_Surname ON TEACHER(TEACHER_SURNAME);
CREATE INDEX IX_Student_Surname ON STUDENT(STUDENT_SURNAME);
CREATE INDEX IX_Profession_Name ON PROFESSION(PROFESSION_NAME);

CREATE OR REPLACE VIEW vw_SubjectsWithTeachers AS
SELECT 
    SUB.SUBJECT,
    SUB.SUBJECT_NAME,
    T.TEACHER_NAME,
    T.TEACHER_SURNAME,
    P.PULPIT_NAME
FROM 
    SUBJECT SUB
LEFT JOIN 
    TEACHER T ON SUB.TEACHER = T.TEACHER
LEFT JOIN 
    PULPIT P ON T.PULPIT = P.PULPIT;
    
CREATE OR REPLACE VIEW vw_StudentProgress AS
SELECT 
    S.IDSTUDENT,
    S.STUDENT_NAME,
    S.STUDENT_SURNAME,
    P.SUBJECT,
    P.ESTIMATION
FROM 
    PROGRESS P
JOIN 
    STUDENT S ON P.IDSTUDENT = S.IDSTUDENT;
    
CREATE OR REPLACE VIEW vw_SubjectEstimation AS
SELECT 
    SUB.SUBJECT,
    SUB.SUBJECT_NAME,
    AVG(P.ESTIMATION) AS AverageEstimation
FROM 
    PROGRESS P
JOIN 
    SUBJECT SUB ON P.SUBJECT = SUB.SUBJECT
GROUP BY 
    SUB.SUBJECT, SUB.SUBJECT_NAME;
    
    
 CREATE OR REPLACE FUNCTION GetStudentsByGroup(
    GroupId IN NUMBER
) RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT 
        S.IDSTUDENT,
        S.STUDENT_NAME,
        S.STUDENT_SURNAME,
        S.STUDENT_PATRONYMIC,
        S.BDAY
    FROM 
        STUDENT S
    WHERE 
        S.IDGROUP = GroupId;
    RETURN result_cursor;
END;   


CREATE OR REPLACE PROCEDURE AddTeacher(
    Teacher IN CHAR,
    TeacherName IN NVARCHAR2,
    TeacherSurname IN NVARCHAR2,
    TeacherPatronymic IN NVARCHAR2,
    Gender IN CHAR,
    StartDate IN DATE,
    WorkTime IN NUMBER,
    Pulpit IN CHAR
) AS
BEGIN
    INSERT INTO TEACHER (TEACHER, TEACHER_NAME, TEACHER_SURNAME, TEACHER_PATRONYMIC, GENDER, START_DATE, WORK_TIME, PULPIT)
    VALUES (Teacher, TeacherName, TeacherSurname, TeacherPatronymic, Gender, StartDate, WorkTime, Pulpit);
END;

CREATE OR REPLACE PROCEDURE UpdateTeacher(
    Teacher IN CHAR,
    TeacherName IN NVARCHAR2,
    TeacherSurname IN NVARCHAR2,
    TeacherPatronymic IN NVARCHAR2,
    Gender IN CHAR,
    StartDate IN DATE,
    WorkTime IN NUMBER,
    Pulpit IN CHAR
) AS
BEGIN
    UPDATE TEACHER
    SET TEACHER_NAME = TeacherName,
        TEACHER_SURNAME = TeacherSurname,
        TEACHER_PATRONYMIC = TeacherPatronymic,
        GENDER = Gender,
        START_DATE = StartDate,
        WORK_TIME = WorkTime,
        PULPIT = Pulpit
    WHERE TEACHER = Teacher;
END;

CREATE OR REPLACE PROCEDURE DeleteTeacher(
    Teacher IN CHAR
) AS
BEGIN
    DELETE FROM TEACHER WHERE TEACHER = Teacher;
END;


CREATE OR REPLACE PROCEDURE AddGroup(
    Faculty IN CHAR,
    Profession IN CHAR,
    YearFirst IN SMALLINT
) AS
BEGIN
    INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST)
    VALUES (Faculty, Profession, YearFirst);
END;

CREATE OR REPLACE PROCEDURE UpdateGroup(
    IdGroup IN NUMBER,
    Faculty IN CHAR,
    Profession IN CHAR,
    YearFirst IN SMALLINT
) AS
BEGIN
    UPDATE GROUPS
    SET FACULTY = Faculty, PROFESSION = Profession, YEAR_FIRST = YearFirst
    WHERE IDGROUP = IdGroup;
END;

CREATE OR REPLACE PROCEDURE DeleteGroup(
    IdGroup IN NUMBER
) AS
BEGIN
    DELETE FROM GROUPS WHERE IDGROUP = IdGroup;
END;

CREATE OR REPLACE PROCEDURE AddStudent(
    IdGroup IN NUMBER,
    StudentName IN NVARCHAR2,
    StudentSurname IN NVARCHAR2,
    StudentPatronymic IN NVARCHAR2,
    Bday IN DATE
) AS
BEGIN
    INSERT INTO STUDENT (IDGROUP, STUDENT_NAME, STUDENT_SURNAME, STUDENT_PATRONYMIC, BDAY)
    VALUES (IdGroup, StudentName, StudentSurname, StudentPatronymic, Bday);
END;

CREATE OR REPLACE PROCEDURE UpdateStudent(
    IdStudent IN NUMBER,
    IdGroup IN NUMBER,
    StudentName IN NVARCHAR2,
    StudentSurname IN NVARCHAR2,
    StudentPatronymic IN NVARCHAR2,
    Bday IN DATE
) AS
BEGIN
    UPDATE STUDENT
    SET IDGROUP = IdGroup,
        STUDENT_NAME = StudentName,
        STUDENT_SURNAME = StudentSurname,
        STUDENT_PATRONYMIC = StudentPatronymic,
        BDAY = Bday
    WHERE IDSTUDENT = IdStudent;
END;

CREATE OR REPLACE PROCEDURE DeleteStudent(
    IdStudent IN NUMBER
) AS
BEGIN
    DELETE FROM STUDENT WHERE IDSTUDENT = IdStudent;
END;

CREATE OR REPLACE PROCEDURE AddProgress(
    Subject IN CHAR,
    IdStudent IN NUMBER,
    PDate IN DATE,
    Estimation IN NUMBER
) AS
BEGIN
    INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, ESTIMATION)
    VALUES (Subject, IdStudent, PDate, Estimation);
END;

CREATE OR REPLACE PROCEDURE UpdateProgress(
    Subject IN CHAR,
    IdStudent IN NUMBER,
    PDate IN DATE,
    Estimation IN NUMBER
) AS
BEGIN
    UPDATE PROGRESS
    SET ESTIMATION = Estimation
    WHERE SUBJECT = Subject AND IDSTUDENT = IdStudent AND PDATE = PDate;
END;

CREATE OR REPLACE PROCEDURE DeleteProgress(
    Subject IN CHAR,
    IdStudent IN NUMBER,
    PDate IN DATE
) AS
BEGIN
    DELETE FROM PROGRESS WHERE SUBJECT = Subject AND IDSTUDENT = IdStudent AND PDATE = PDate;
END;
