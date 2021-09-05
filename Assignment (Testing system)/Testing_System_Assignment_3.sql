USE TestingManagement;

-- lấy ra tất cả các phòng ban (question 2)
SELECT *
FROM Department;


-- lấy ra id của phòng ban sale (question 3)
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'Sale';


-- lấy ra thông tin account có full name dài nhất (question 4)
SELECT *
FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)
ORDER BY Fullname DESC;


-- lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3 (question 5)
SELECT *
FROM	`Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account` ) && DepartmentID = 3
ORDER BY Fullname DESC;


-- lấy ra tên group đã tham gia trước ngày 20/12/2019 (question 6)
SELECT GroupName 
FROM `Group`
WHERE CreateDate < '2019-12-20';


-- lấy ra ID của question có số câu trả lời >= 4 (question 7)
SELECT QuestionID , COUNT(QuestionID) AS soluong_cautraloi
FROM Answer
GROUP BY QuestionID
HAVING soluong_cautraloi >= 4;


-- lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 (question 8)
SELECT `Code`
FROM Exam
WHERE Duration >= 60 && CreateDate < '2019-12-20';


-- lấy ra 5 group được tạo gần đây nhất (question 9)
SELECT * 
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;


-- đếm số nhân viên thuộc department có id = 2 (question 10)
SELECT DepartmentID, COUNT(AccountID) AS soluong_nhanvien
FROM `Account`
WHERE DepartmentID = 2;


-- lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" (question 11)



-- xóa tất cả các exam được tạo trước ngày 20/12/2019 (question 12)
ALTER TABLE Exam DROP CONSTRAINT fk_cat_ID;
ALTER TABLE Exam DROP CONSTRAINT fk_cre_ID;
DELETE
FROM Exam
WHERE CreateDate < '2019-12-20';

SELECT * 
FROM Exam
WHERE CreateDate < '2019-12-20';


-- xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" (question 13)



-- update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn (question 14)
UPDATE  `Account`
SET		Fullname = 'Nguyễn Bá Lộc',
		Email 	=	'loc.nguyenba@vti.com.vn'
WHERE 	AccountID = 5;

SELECT * FROM `Account`;

-- update account có id = 5 sẽ thuộc group có id = 4 (question 15)
UPDATE GroupAccount
SET		AccountID = 5
WHERE	GroupID = 4;

SELECT * FROM GroupAccount;


