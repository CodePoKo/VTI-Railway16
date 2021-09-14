USE TestingManagement;

-- TẠO HÀM THỦ TỤC LẤY RA DANH SÁCH PHÒNG BAN
-- VỚI THAM SỐ INPUT
DROP PROCEDURE IF EXISTS get_all_department;
DELIMITER $$
CREATE PROCEDURE get_all_department()
	BEGIN 
		SELECT * FROM department;
        
    END $$
DELIMITER ;

CALL get_all_department();


-- VỚI THAM SỐ INPUT VÀ OUTPUT:
DROP PROCEDURE IF EXISTS get_all_department;
DELIMITER $$
CREATE PROCEDURE get_department_name(IN id_dept TINYINT, OUT name_dept NVARCHAR(50))
	BEGIN 
		SELECT DepartmentName INTO name_dept
        FROM department
        WHERE DepartmentID = id_dept;
        
    END $$
DELIMITER ;
set @name_dept = '0';
call get_department_name(5, @name_dept);
select @name_dept;




DROP PROCEDURE IF EXISTS get_all_department2
DELIMITER $$
CREATE PROCEDURE get_department_name2(IN id_dept TINYINT)
	BEGIN 
		DECLARE dept_name VARCHAR(50);
		SELECT DepartmentName INTO dept_name
        FROM department
        WHERE DepartmentID = id_dept;
        
        SELECT dept_name;
        
    END $$
DELIMITER ;

call get_department_name2(1);


-- TẠO HÀM FUNCTION
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS TinhTong
DELIMITER $$
CREATE FUNCTION TinhTong(number1 TINYINT, number2 TINYINT) RETURNS TINYINT
	BEGIN 
		DECLARE tong TINYINT;
		SET tong = number1 + number2;
        RETURN tong;
        
    END $$
DELIMITER ;

SELECT  TinhTong(1,3);

-- ------------------------------------------------------------------------------------------------------------------------------
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS get_all_account_of_department;
DELIMITER $$
CREATE PROCEDURE get_all_account_of_department(IN TenPhongBan NVARCHAR(50))
	BEGIN 
		SELECT * FROM `Account`
        JOIN Department USING(DepartmentID)
        WHERE DepartmentName = TenPhongBan;
    END $$
DELIMITER ;

CALL get_all_account_of_department('Bảo vệ');



-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS get_account_of_group;
DELIMITER $$
CREATE PROCEDURE get_account_of_group()
	BEGIN 
		SELECT GroupID, GroupName, COUNT(AccountID), GROUP_CONCAT(AccountID)
        FROM `Group`
        JOIN GroupAccount USING(GroupID)
        GROUP BY GroupID;
    END $$
DELIMITER ;

CALL get_account_of_group();



-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS get_question_of_type
DELIMITER $$
CREATE PROCEDURE get_question_of_type()
	BEGIN 
		SELECT TypeID, TypeName, COUNT(QuestionID), GROUP_CONCAT(QuestionID)
        FROM Question
        JOIN TypeQuestion USING(TypeID)
        WHERE month(CreateDate) = month(NOW()) && year(CreateDate) = year(NOW())
        GROUP BY TypeID;
    END $$
DELIMITER ;

CALL get_question_of_type();



-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS get_id_of_typeQuestion
DELIMITER $$
CREATE PROCEDURE get_id_of_typeQuestion()
	BEGIN 
		DECLARE out_id TINYINT;
		SELECT TypeID INTO out_id
        FROM Question
        JOIN TypeQuestion USING(TypeID)
        GROUP BY TypeID
        HAVING COUNT(QuestionID) = (SELECT MAX(ques) 
									FROM (SELECT COUNT(QuestionID) AS ques
                                    FROM Question
                                    GROUP BY TypeID) AS MaxQues);
		SELECT out_id;
    END $$
DELIMITER ;

CALL get_id_of_typeQuestion();



-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question





/*
Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
chuỗi của người dùng nhập vào
*/
DROP PROCEDURE IF EXISTS get_name_account_group;
DELIMITER $$
CREATE PROCEDURE get_name_account_group(IN name_group NVARCHAR(50), IN name_user NVARCHAR(50))
BEGIN
	SELECT GroupID, GroupName, AccountID, Username
    FROM `Group`
    INNER JOIN `Account` ON `Group`.CreatorID = `Account`.AccountID
    WHERE GroupName LIKE CONCAT('%', name_group, '%')
    OR Username LIKE CONCAT('%', name_user,'%');
END $$
DELIMITER ;

CALL get_name_account_group('j', '4');  


/*
Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
trong store sẽ tự động gán:
						username sẽ giống email nhưng bỏ phần @..mail đi
                        departmentID: sẽ được cho vào 1 phòng chờ
						positionID: sẽ có default là developer
Sau đó in ra kết quả tạo thành công
*/
DROP PROCEDURE IF EXISTS info_user;
DELIMITER $$
CREATE PROCEDURE info_user(IN out_email VARCHAR(50), IN out_fullname VARCHAR(50))
BEGIN
	DECLARE out_username VARCHAR(50) DEFAULT SUBSTRING_INDEX(out_email, '@', 1);
    DECLARE out_id_department TINYINT UNSIGNED DEFAULT 12;
    DECLARE out_id_position TINYINT UNSIGNED DEFAULT 1;
    INSERT INTO `Account`	(Email,			Username, 		FullName, 		DepartmentID, 			PositionID)
    VALUES					(out_email, 	out_username, 	out_fullname, 	out_id_department, 		out_id_position);
END $$
DELIMITER ;

CALL info_user('ahihi@gmail.com', 'ahihi123');
SELECT * FROM `Account`;

/* Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice 
để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
*/
DROP PROCEDURE IF EXISTS longgest_content_exam;
DELIMITER $$
CREATE PROCEDURE longgest_content_exam( IN nhap_typename_ques VARCHAR(50))
BEGIN
	SELECT Content FROM Question
    INNER JOIN TypeQuestion USING(TypeID)
    WHERE TypeName = nhap_typename_ques AND 
    LENGTH(Content) = (SELECT MAX(LENGTH(Content)) FROM Question);
END $$
DELIMITER ;

CALL longgest_content_exam('Essay');
CALL longgest_content_exam('Multiple-Choice');




-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS delete_exam
DELIMITER $$
CREATE PROCEDURE delete_exam (IN in_examID TINYINT UNSIGNED)
BEGIN
    DELETE FROM Exam 
    WHERE ExamID = in_examID;
END $$
DELIMITER ;

CALL delete_exam(''); -- 1, 2, 3, 4, 5, 6...

SELECT * FROM Exam;



/*
Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
*/


