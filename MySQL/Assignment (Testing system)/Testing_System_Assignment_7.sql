-- --------- TRIGGER

-- BEFORE INSERT
DROP TRIGGER IF EXISTS trigger_1;
DELIMITER $$
CREATE TRIGGER trigger_1
BEFORE INSERT ON Question
FOR EACH ROW
BEGIN
	IF(NEW.CreateDate > NOW()) THEN
    SET NEW.CreateDate = NOW();
    END IF;
END $$
DELIMITER ;

INSERT INTO Question(Content,				CategoryID,			TypeID, 		CreatorID,			CreateDate)
VALUES				(N'Câu Hỏi Java 1',			1,				1,				1,					'2030-04-05');
SELECT * FROM Question;

DROP TRIGGER IF EXISTS trigger_1;




DROP TRIGGER IF EXISTS trigger_2;
DELIMITER $$
CREATE TRIGGER trigger_2
BEFORE INSERT ON Question
FOR EACH ROW
BEGIN
	IF(NEW.CreateDate > NOW()) THEN
    SIGNAL SQLSTATE '12344' -- đặt giá trị từ 10000 -> 99999 (SIGNAL SQLSTATE: là mã lỗi)
    SET MESSAGE_TEXT = "Lỗi CreateDate Không thể lớn hơn thời gian hiện tại"; -- MESSAGE_TEXT: message thông báo lỗi
    END IF;
END $$
DELIMITER ;

INSERT INTO Question(Content,				CategoryID,			TypeID, 		CreatorID,			CreateDate)
VALUES				(N'Câu Hỏi Java 1',			1,				1,				1,					'2030-04-05');
SELECT * FROM Question;



-- BEFORE DELETE
DROP TRIGGER IF EXISTS trigger_3;
DELIMITER $$
CREATE TRIGGER trigger_3
BEFORE DELETE ON Question
FOR EACH ROW
BEGIN
	DELETE FROM Answer
    WHERE QuestionID = OLD.QuestionID;
END $$
DELIMITER ;
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM Question
WHERE QuestionID = 2;
SELECT * FROM Answer;



-- BEFORE UPDATE
DROP TRIGGER IF EXISTS trigger_4;
DELIMITER $$
CREATE TRIGGER trigger_4
BEFORE UPDATE ON Question
FOR EACH ROW
BEGIN
	IF OLD.TypeID = 1 THEN
	SIGNAL SQLSTATE '12344' 
    SET MESSAGE_TEXT = "Không cho phép update";
    END IF;
END $$
DELIMITER ;

UPDATE Question
SET Content = 'test123'
WHERE QuestionID = 1;

SELECT * FROM Question;




-- -------INDEXES
/* Question 12: Lấy ra thông tin exam trong đó:
Duration <= 60 thì sẽ đổi thành giá trị "Short time"
60 < Duration <= 90 thì sẽ đổi thành giá trị "Medium time"
Duration > 90 thì sẽ đổi thành giá trị "Long time"
*/
SELECT * ,
CASE
	WHEN Duration <= 60 THEN "Short time"
    WHEN 60 < Duration <= 90 THEN "Medium time"
    WHEN Duration > 90 THEN "Long time"
    ELSE "Khong xac dinh"
    END AS Duration
FROM EXAM;

-- ---------------------------------------------------------------------------------------------------------------------------
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
-- Cách 1:
DROP TRIGGER IF EXISTS trigger_group;
DELIMITER $$
CREATE TRIGGER trigger_group
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
	IF YEAR(NEW.CreateDate) < YEAR(NOW()) - 1 THEN
    SIGNAL SQLSTATE '12345' 
    SET MESSAGE_TEXT = "Lỗi CreateDate: Không thể nhập thông tin vào Group";
    END IF;
END $$
DELIMITER ;

INSERT INTO `Group`	(GroupName, 		CreatorID, 		CreateDate)
VALUES				(N'Nhóm 1', 		1, 				'2019-09-19');
SELECT * FROM `Group`;

-- Cách 2:
DROP TRIGGER IF EXISTS trigger_1year_ago;
DELIMITER $$
		CREATE TRIGGER trigger_1year_ago
        BEFORE INSERT ON Question
        FOR EACH ROW
        BEGIN
			DECLARE v_Timestamp DATETIME;
            SET v_Timestamp = (DATE_SUB(NOW(), INTERVAL 1 YEAR));
			IF NEW.CreateDate < v_Timestamp THEN
			   SIGNAL SQLSTATE '12344' --
               SET MESSAGE_TEXT = " Time Input Error "; 
            END IF;
        END $$
DELIMITER ;



/* Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
"Sale" cannot add more user"
*/
DROP TRIGGER IF EXISTS question_2;
DELIMITER $$
CREATE TRIGGER question_2
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
	DECLARE out_DepartmentID TINYINT;
	SELECT DepartmentID INTO out_DepartmentID
	FROM Department
	WHERE DepartmentName = 'Sale';
	IF NEW.DepartmentID = out_DepartmentID THEN
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
	END IF;
END $$
DELIMITER ;

INSERT INTO `Account`	(		Email,							Username, 			FullName, 		DepartmentID, 		PositionID)
VALUES					('lms1.vti12345.edu.vn@gmail.com',	'username1234',			'fullname123',			2,					1);



-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS question_3;
DELIMITER $$
		CREATE TRIGGER question_3
        BEFORE INSERT ON GroupAccount
        FOR EACH ROW
        BEGIN
			DECLARE out_Count_GroupID TINYINT;
            SELECT COUNT(GroupID) INTO out_Count_GroupID
            FROM GroupAccount
            WHERE NEW.GroupID = GroupID;
            IF out_Count_GroupID > 5 THEN
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'Can not add more than 5 users';
            END IF;
        END $$
DELIMITER ;
INSERT INTO GroupAccount(GroupID, 		AccountID, 				JoinDate)
VALUES 					(1, 				4,				'2021-09-11');


-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS question_4;
DELIMITER $$
	CREATE TRIGGER question_4
	BEFORE INSERT ON ExamQuestion
	FOR EACH ROW
	BEGIN 
		DECLARE out_Count_ExamID TINYINT;
		SELECT COUNT(ExamID) INTO out_Count_ExamID
		FROM ExamQuestion
		WHERE NEW.ExamID = ExamID;
		IF out_Count_ExamID >= 10 THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Can not add more than 10 question in 1 exam';
		END IF;
	END $$
DELIMITER ;
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUE					(1,  		5);



/*
Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com 
(đây là tài khoản admin, không cho phép user xóa), còn lại các tài khoản khác thì 
cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó
*/

DROP TRIGGER IF EXISTS question_5;
DELIMITER $$
CREATE TRIGGER question_5
BEFORE DELETE ON `Account`
FOR EACH ROW
BEGIN
	DECLARE out_email VARCHAR(30);
    SET out_email = 'admin@gmail.com';
    IF OLD.Email = out_email THEN 
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'can not delete account have email is admin@gmail.com';
    END IF;
END $$
DELIMITER ;

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM `Account`
WHERE Email = 'admin@gmail.com';



/*
Question 6: Không sử dụng cấu hình default cho field DepartmentID của table Account, 
hãy tạo trigger cho phép người dùng khi tạo account không điền vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
*/
DROP TRIGGER IF EXISTS question_6;
DELIMITER $$
CREATE TRIGGER question_6
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
	DECLARE waitingRoom TINYINT;
    SELECT DepartmentID INTO waitingRoom FROM Department
    WHERE DepartmentName = 'waitingRoom';
    IF NEW.DepartmentID IS NULL THEN
    SET NEW.DepartmentID = waitingRoom;
    END IF;
END $$
DELIMITER ;

INSERT INTO `Account`	(		Email,						Username, 			FullName, 		 		PositionID)
VALUES					('lms1.vti1234.edu.vn@gmail.com',	'username1234',		'fullname1234',					1);
SELECT * FROM `Account`;



-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.
DROP TRIGGER IF EXISTS question_7;
DELIMITER $$
CREATE TRIGGER question_7
BEFORE INSERT ON Answer
FOR EACH ROW
BEGIN
	-- khai báo biến đếm xem question đang có bao nhiêu answer
	DECLARE countAnswer  TINYINT UNSIGNED;
    
    -- khai báo biến đếm xem question đang có bao nhiêu answer là đáp án đúng
    DECLARE countAnswerTrue  TINYINT UNSIGNED;
    
	-- đếm xem question có bao nhieu answer
	SELECT COUNT(QuestionID) INTO countAnswer FROM Answer
	WHERE NEW.QuestionID = QuestionID
    GROUP BY QuestionID;
    
    -- đếm xem question đang có bao nhiêu answer là đáp án đúng
	SELECT COUNT(QuestionID)  INTO countAnswerTrue FROM Answer
    WHERE isCorrect = TRUE AND NEW.QuestionID = QuestionID
    GROUP BY QuestionID;
    
	IF countAnswer >= 4 THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'question không thể quá 4 đáp án';
    ELSEIF (countAnswerTrue >= 2 && NEW.isCorrect = TRUE) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'question không thể quá 2 đáp án đúng';
    END IF;
END $$
DELIMITER ;

INSERT INTO Answer	(Content,				QuestionID,		isCorrect)
VALUES				('Dap an: Java aaa',		10,			TRUE);

SELECT * FROM Answer;


/*
Question 8: Viết trigger sửa lại dữ liệu cho đúng:
Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
*/
DROP TRIGGER IF EXISTS question_8;
DELIMITER $$
CREATE TRIGGER question_8
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
	CASE NEW.Gender
    WHEN 'Nam' THEN
		SET NEW.Gender = 'M';
	WHEN 'Nữ' THEN
		SET NEW.Gender = 'F';
	ELSE 
		SET NEW.Gender = 'U';
    END CASE;
END $$
DELIMITER ;



-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS question_9;
DELIMITER $$
CREATE TRIGGER question_9
BEFORE DELETE ON Exam
FOR EACH ROW
BEGIN
	IF DAY(OLD.CreateDate) = DAY(NOW()) - 2 THEN
	-- IF OLD.CreateDate = DATE_SUB(NOW(), INTERVAL 2 DAY) THEN
    SIGNAL SQLSTATE '12345'
    SET MESSAGE_TEXT = 'could not remove the new exam that create 2 days before';
    END IF;
END $$
DELIMITER ;

DELETE FROM Exam
WHERE DAY(CreateDate) = DAY(NOW()) - 2;



-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào
DROP TRIGGER IF EXISTS question_10;
DELIMITER $$
CREATE TRIGGER question_10
BEFORE UPDATE ON Question
FOR EACH ROW
BEGIN
 -- cách 1:
	-- đếm xem question đã nằm trong đề thi nào hay chưa
	DECLARE countQuestionInExam INT;
    SET countQuestionInExam = -2; -- set countQuestionInExam với giá trị khác 0 (không nằm trong exam nào)
    SELECT COUNT(QuestionID) INTO countQuestionInExam FROM ExamQuestion 
    WHERE QuestionID = OLD.QuestionID
    GROUP BY QuestionID;
    
    IF countQuestionInExam > -2 THEN
    SIGNAL SQLSTATE '12345'
    SET MESSAGE_TEXT = 'question đã tồn tại trong đề thi';
    END IF;
 
/* cách 2:
 IF OLD.QuestionID IN (SELECT DISTINCT QuestionID FROM examquestion) THEN
 SIGNAL SQLSTATE '12345' 
 SET MESSAGE_TEXT = 'question đã tồn tại trong đề thi';
 END IF;
  */  
END $$
DELIMITER ;



/* Question 12: Lấy ra thông tin exam trong đó:
Duration <= 60 thì sẽ đổi thành giá trị "Short time"
60 < Duration <= 90 thì sẽ đổi thành giá trị "Medium time"
Duration > 90 thì sẽ đổi thành giá trị "Long time"
*/
SELECT * ,
CASE
	WHEN Duration <= 60 THEN "Short time"
    WHEN 60 < Duration <= 90 THEN "Medium time"
    WHEN Duration > 90 THEN "Long time"
    ELSE "Khong xac dinh"
    END AS Duration
FROM EXAM;




/* Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa 
có tên là the_number_user_amount và mang giá trị được quy định như sau:

Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
*/

SELECT GroupID, COUNT(GroupID),
CASE 
	WHEN COUNT(GroupID) <= 5 THEN "few"
    WHEN 5 < COUNT(GroupID) <= 20 THEN "normal"
    ELSE "higher"
    END AS the_number_user_amount
FROM GroupAccount
GROUP BY GroupID;



-- Question 14: Thống kê mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
SELECT *,
CASE
	WHEN COUNT(A.DepartmentID) = 0 THEN "Không có User"
    ELSE COUNT(A.DepartmentID)
    END AS Soluong_account
FROM Department D
LEFT JOIN `Account` A USING(DepartmentID)
GROUP BY D.DepartmentID;






