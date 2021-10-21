DROP DATABASE IF EXISTS PointManagement;
CREATE DATABASE PointManagement;
USE PointManagement;

DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
	StuID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`			NVARCHAR(30)  NOT NULL,
    Age				TINYINT UNSIGNED NOT NULL,
    Gender			ENUM('0', '1', 'null') NOT NULL
);

DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject` (
	sID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sName			NVARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS StudentSubject;
CREATE TABLE StudentSubject (
	StuID			TINYINT UNSIGNED,
    sID				TINYINT UNSIGNED,
    Mark			DOUBLE,
    `Date`			DATE,
    PRIMARY KEY(StuID, sID),
    FOREIGN KEY(StuID) REFERENCES Student(StuID),
    FOREIGN KEY(sID) REFERENCES `Subject`(sID)
);

INSERT INTO Student 	(`Name`,			Age, 			Gender)
VALUES					('Nguyễn Văn A',	18,				'0'),
						('Trần Thị B',		23,				'1'),
                        ('Đinh Thị C',		22,				'1'),
                        ('Lê Văn D',		17,				'0'),
                        ('Vũ Văn F',		17,				'null');
                        
                        
INSERT INTO `Subject` 	(sName	)
VALUES					('Toán học'),
						('Vật lý'),
                        ('Hóa học'),
                        ('Lịch Sử'),
                        ('Địa lý');
                
		
INSERT INTO StudentSubject 	(StuID,		sID,		Mark,		`Date`)
VALUES						(1	,		1,			8.5,		'2021-02-11'),
							(2	,		2,			9.75,		'2021-12-17'),
                            (3	,		3,			6.00,		'2021-06-25'),
                            (4	,		2,			7.25,		'2021-09-30'),
                            (5	,		5,			7.75,		'2021-01-01');





