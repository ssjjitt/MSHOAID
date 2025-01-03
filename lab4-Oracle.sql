-- ������� ������ � ������� FACULTY
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('F01', '��������� ������������ ����');
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('F02', '��������� ���������');
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('F03', '��������� �����');

-- ������� ������ � ������� PROFESSION
INSERT INTO PROFESSION (PROFESSION, FACULTY, PROFESSION_NAME, QUALIFICATION, PARENT_PROFESSION) VALUES ('P01', 'F01', '�����������', '��������', NULL);
INSERT INTO PROFESSION (PROFESSION, FACULTY, PROFESSION_NAME, QUALIFICATION, PARENT_PROFESSION) VALUES ('P02', 'F01', '��������� ��������', '��������', 'P01');
INSERT INTO PROFESSION (PROFESSION, FACULTY, PROFESSION_NAME, QUALIFICATION, PARENT_PROFESSION) VALUES ('P03', 'F02', '���������', '��������', NULL);
INSERT INTO PROFESSION (PROFESSION, FACULTY, PROFESSION_NAME, QUALIFICATION, PARENT_PROFESSION) VALUES ('P04', 'F03', '�����', '��������', NULL);

-- ������� ������ � ������� PULPIT
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('P01', '������� ����������������', 'F01');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('P02', '������� ���������', 'F02');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('P03', '������� �����', 'F03');

-- ������� ������ � ������� TEACHER
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, TEACHER_SURNAME, TEACHER_PATRONYMIC, GENDER, START_DATE, WORK_TIME, PULPIT) VALUES ('T01', '����', '������', '��������', '�', TO_DATE('2010-09-01', 'YYYY-MM-DD'), 40.0, 'P01');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, TEACHER_SURNAME, TEACHER_PATRONYMIC, GENDER, START_DATE, WORK_TIME, PULPIT) VALUES ('T02', '�����', '�������', '���������', '�', TO_DATE('2015-09-01', 'YYYY-MM-DD'), 40.0, 'P02');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, TEACHER_SURNAME, TEACHER_PATRONYMIC, GENDER, START_DATE, WORK_TIME, PULPIT) VALUES ('T03', '����', '�������', '�������������', '�', TO_DATE('2018-09-01', 'YYYY-MM-DD'), 40.0, 'P03');

-- ������� ������ � ������� SUBJECT
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, TEACHER) VALUES ('S01', '����������������', 'T01');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, TEACHER) VALUES ('S02', '���������', 'T02');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, TEACHER) VALUES ('S03', '�����', 'T03');

-- ������� ������ � ������� GROUPS
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('F01', 'P01', 2021);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('F02', 'P03', 2022);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('F03', 'P04', 2023);

-- ������� ������ � ������� STUDENT
INSERT INTO STUDENT (IDGROUP, STUDENT_NAME, STUDENT_SURNAME, STUDENT_PATRONYMIC, BDAY) VALUES (1, '�������', '�������', '����������', TO_DATE('2000-05-15', 'YYYY-MM-DD'));
INSERT INTO STUDENT (IDGROUP, STUDENT_NAME, STUDENT_SURNAME, STUDENT_PATRONYMIC, BDAY) VALUES (1, '����', '��������', '����������', TO_DATE('2001-10-20', 'YYYY-MM-DD'));
INSERT INTO STUDENT (IDGROUP, STUDENT_NAME, STUDENT_SURNAME, STUDENT_PATRONYMIC, BDAY) VALUES (2, '�����', '��������', '�������������', TO_DATE('2002-02-05', 'YYYY-MM-DD'));

-- ������� ������ � ������� PROGRESS
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, ESTIMATION) VALUES ('S01', 1, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 9);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, ESTIMATION) VALUES ('S01', 2, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 8);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, ESTIMATION) VALUES ('S02', 3, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 10);