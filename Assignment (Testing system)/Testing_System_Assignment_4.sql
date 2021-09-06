-- Inner Join
-- Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ (question 1)
SELECT * FROM `Account`;
SELECT * FROM Department;
-- cách 1:
SELECT * 
FROM `Account` a1
INNER JOIN department d1 ON a1.DepartmentID = d1.DepartmentID;

-- cách 2:
SELECT * 
FROM `Account` a1
INNER JOIN Department d1 USING (DepartmentID); -- bỏ trùng lặp cột DepartmentID của 2 bảng Account,department



-- Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 (question 2)
SELECT * 
FROM `Account`
WHERE CreateDate > '2010-12-20';



-- Viết lệnh để lấy ra tất cả các developer (question 3)
SELECT *
FROM `Account`
JOIN `Position` USING (PositionID)
WHERE Positionname = 'Dev';


-- Viết lệnh để lấy ra phòng ban lớn hơn 3 nhân viên (question 4)
SELECT D.DepartmentName, A.DepartmentID, COUNT(A.DepartmentID) AS soluong_nhanvien
FROM `Account` A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID
HAVING soluong_nhanvien > 3;


-- Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất (question 5)
-- xác định  table examquestion được sử dụng vì có examID, questionID
-- xem dữ liệu có questionID 10 xuất hiện nhiều nhất trong các đề thi là 3 lần
-- tìm câu hỏi xuất hiện trong đề thi nhiều nhất là bao nhiều lần (dùng câu lệnh truy vẫn con để tìm) = 3 lần
-- lấy ra danh sách câu hỏi được sử dụng trong đề thi 3 lần
-- CÁCH 1:
SELECT QuestionID, COUNT(QuestionID), Content
FROM Examquestion
JOIN Question USING(QuestionID)
GROUP BY QuestionID
HAVING COUNT(QuestionID) = (SELECT COUNT(QuestionID) FROM Examquestion
							GROUP BY QuestionID
							ORDER BY COUNT(QuestionID) DESC
							LIMIT 1);
                                               
-- CÁCH 2:
SELECT QuestionID, COUNT(QuestionID), Content
FROM Examquestion
JOIN Question USING(QuestionID)
GROUP BY QuestionID
HAVING COUNT(QuestionID) = ( SELECT MAX(MyCount)
							FROM (SELECT COUNT(QuestionID) AS MyCount FROM Examquestion
                            GROUP BY QuestionID) AS maxcount
							);



-- thống kê mỗi Category Question được sử dụng trong bao nhiêu Question(question 6)
SELECT CategoryID, COUNT(CategoryID)
FROM Question
GROUP BY CategoryID
ORDER BY COUNT(CategoryID);


-- thống kê mỗi Question được sử dụng trong bao nhiêu Exam (question 7)
SELECT ExamID, COUNT(ExamID)
FROM ExamQuestion
GROUP BY ExamID
ORDER BY COUNT(ExamID);


-- Lấy ra Question có nhiều câu trả lời nhất (question 8)
SELECT QuestionID, COUNT(AnswerID) AS soluong_cautl
FROM Answer
GROUP BY QuestionID
ORDER BY soluong_cautl DESC
LIMIT 1;


-- Thống kê số lượng account trong mỗi group (question 9)
SELECT AccountID, GroupID, COUNT(AccountID)
FROM GroupAccount
GROUP BY GroupID;



-- Tìm chức vụ có ít người nhất (question 10)
SELECT p.PositionName, p.PositionID, COUNT(a.PositionID)
FROM `Account` a
INNER JOIN `Position` p USING(PositionID)
GROUP BY a.PositionID 
ORDER BY COUNT(a.PositionID) ASC
LIMIT 2;



-- Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM (question 11)
SELECT DepartmentID, PositionID, COUNT(PositionID)
FROM `Account`
GROUP BY DepartmentID;



-- CROSS JOIN
-- Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì (question 12)
SELECT q.*, a1.Fullname, a2.Content
FROM Question q
LEFT JOIN `Account` a1 ON q.CreatorID = a1.AccountID
LEFT JOIN Answer a2 USING(QuestionID)
ORDER BY QuestionID;



-- Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm (question 13)
SELECT TypeID AS loai_cauhoi, COUNT(TypeID) AS soluong_cauhoi
FROM Question
GROUP BY loai_cauhoi;


-- Lấy ra group không có account nào (question 14) (LEFT EXCLUDING JOIN)
SELECT g.GroupID, g.GroupName, ga.AccountID
FROM `Group` g
LEFT JOIN `GroupAccount` ga USING(GroupID)
WHERE  ga.AccountID IS NULL;


-- Lấy ra question không có answer nào (question 16)
SELECT q.QuestionID, q.Content, a.AnswerID
FROM Question q
LEFT JOIN Answer a USING(QuestionID)
WHERE a.AnswerID IS NULL;


/*Question 17:
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
*/
SELECT a.AccountID , a.Email, a.FullName, ga.GroupID
FROM groupaccount ga
JOIN `Account` a ON ga.AccountID = a.AccountID
WHERE ga.GroupID = 1
UNION
SELECT a.AccountID , a.Email, a.FullName, ga.GroupID
FROM groupaccount ga
JOIN `Account` a ON ga.AccountID = a.AccountID
WHERE ga.GroupID = 2;

/*
Question 18:
a) Lấy các group có ... lớn hơn 5 thành viên
b) Lấy các group có ... nhỏ hơn 7 thành viên
c) Ghép 2 kết quả từ câu a) và câu b)
*/
SELECT ga.GroupID, g.GroupName, COUNT(ga.AccountID)
FROM GroupAccount ga
INNER JOIN `Group` g USING(GroupID)
GROUP BY ga.GroupID
HAVING COUNT(ga.AccountID) > 5
UNION ALL
SELECT ga.GroupID, g.GroupName, COUNT(ga.AccountID)
FROM GroupAccount ga
INNER JOIN `Group` g USING(GroupID)
GROUP BY ga.GroupID
HAVING COUNT(ga.AccountID) < 7;







-- lấy ra các question và người tạo ra question đó
SELECT * 
FROM Question q1
INNER JOIN `Account` a1 ON q1.CreatorID = a1. AccountID;

SELECT * 
FROM `Account` a1
LEFT JOIN department d1 ON a1.DepartmentID = d1.DepartmentID;

SELECT * 
FROM department a1
LEFT JOIN `Account` d1 ON a1.DepartmentID = d1.DepartmentID;

-- lấy ra tất cả các câu trả lời và câu hỏi tương ứng của câu trả lời đó
SELECT * 
FROM Answer a2
LEFT JOIN Question q1 USING(QuestionID);



-- LEFT EXCLUDING JOIN: THÊM ĐIỀU KIỆN WHERE B.key is null
-- thống kê các phòng ban không có Account nào: dùng LEFT EXCLUDING JOIN:
SELECT * 
FROM department d1
LEFT JOIN `Account` a1 ON d1.DepartmentID = a1.DepartmentID
WHERE a1.DepartmentID IS NULL;




-- UNION : lấy ra tất cả các giá trị không trùng lặp lại từ 2 câu lệnh select
-- UNION ALL: lấy ra tất cả các giá trị (cả giá trị trùng lặp) lại từ 2 câu lệnh select
SELECT AccountID
FROM `Account`
WHERE AccountID IN (1,2,3)
UNION
SELECT AccountID
FROM `Account`
WHERE AccountID IN (2,3,4,5);

