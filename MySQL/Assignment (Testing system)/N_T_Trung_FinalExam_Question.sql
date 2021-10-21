USE PointManagement;

-- 2) Viết lệnh để
-- a. Lấy tất cả các môn học không có bất kì điểm nào
SELECT sName, sID
FROM `Subject`
WHERE sID NOT IN (SELECT sID FROM StudentSubject);

-- b. Lấy danh sách các môn học có ít nhất 2 điểm
SELECT sName, COUNT(sID)
FROM StudentSubject
INNER JOIN `Subject` USING(sID)
GROUP BY sID
HAVING COUNT(sID) >= 2;


/* 3) Tạo view có tên là "StudentInfo" lấy các thông tin về học sinh bao gồm:
Student ID,Subject ID, Student Name, Student Age, Student Gender,
Subject Name, Mark, Date
(Với cột Gender show 'Male' để thay thế cho 0, 'Female' thay thế cho 1 và
'Unknow' thay thế cho null)
*/
DROP VIEW IF EXISTS StudentInfo;
CREATE OR REPLACE VIEW StudentInfo AS
SELECT *, 
CASE Gender
	WHEN '0' THEN 'Male'
    WHEN '1' THEN 'Female'
    ELSE 'Unknown'
    END AS GioiTinh
FROM Student
INNER JOIN StudentSubject USING(StuID)
INNER JOIN `Subject` USING(sID)
WHERE Student.StuID = StudentSubject.StuID AND `Subject`.sID = StudentSubject.sID;

SELECT * FROM StudentInfo;


/*
4) Không sử dụng On Update Cascade & On Delete Cascade
*/
-- a. Tạo trigger cho table Subject có tên là SubjectUpdateID:
-- Khi thay đổi data của cột ID của table Subject, thì giá trị tương
-- ứng với cột SubjectID của table StudentSubject cũng thay đổi
-- theo
DROP TRIGGER IF EXISTS SubjectUpdateID;
DELIMITER $$
CREATE TRIGGER SubjectUpdateID
AFTER UPDATE ON `Subject`
FOR EACH ROW
BEGIN
	UPDATE StudentSubject
    SET sID = NEW.sID
    WHERE sID = OLD.sID;
END $$
DELIMITER ;

SET FOREIGN_KEY_CHECKS = 0;
UPDATE `Subject`
SET sID = 6
WHERE sID = 3;

SELECT * FROM `Subject`;
SELECT * FROM StudentSubject;

-- b. Tạo trigger cho table StudentSubject có tên là StudentDeleteID:
-- Khi xóa data của cột ID của table Student, thì giá trị tương ứng với
-- cột StudentID của table StudentSubject cũng bị xóa theo
DROP TRIGGER IF EXISTS StudentDeleteID;
DELIMITER $$
CREATE TRIGGER StudentDeleteID
AFTER DELETE ON Student
FOR EACH ROW
BEGIN
	DELETE FROM  StudentSubject
    WHERE StuID = OLD.StuID;
END $$
DELIMITER ;

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM Student
WHERE StuID = 1;

SELECT * FROM Student;
SELECT * FROM StudentSubject;


/*
	5) Viết 1 store procedure (có 2 parameters: student name) sẽ xóa tất cả các
thông tin liên quan tới học sinh có cùng tên như parameter
Trong trường hợp nhập vào student name = "*" thì procedure sẽ xóa tất cả
các học sinh
*/
DROP PROCEDURE IF EXISTS del_students;
DELIMITER $$
CREATE PROCEDURE del_students(IN in_name_stu1 NVARCHAR(20), IN in_name_stu2 NVARCHAR(20))
BEGIN
    SET FOREIGN_KEY_CHECKS = 0;
    CASE 
	WHEN in_name_stu1 = '*' OR in_name_stu2 ='*' THEN
    DELETE FROM Student;
    DELETE FROM StudentSubject;
	END CASE;
    
END $$
DELIMITER ;

CALL del_students('*', '*');

SELECT * FROM Student;
SELECT * FROM StudentSubject;


