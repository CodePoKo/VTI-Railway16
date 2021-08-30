-- insetDATA
USE TestingManagement;
-- thêm mới dữ liệu vào table department
INSERT INTO Department(DepartmentName)
VALUES						(N'Marketing'),
							(N'Sale'),
                            (N'Bảo vệ'),
                            (N'Kỹ thuật'),
                            (N'Nhân sự');
-- lấy tất cả dữ liệu từ department
SELECT * FROM Department;

-- thêm mới dữ liệu vào table position
INSERT INTO `Position`(PositionName)
VALUES					('Dev'),
						('Test'),
						('Scrum Master'),
						('PM');
-- lấy tất cả dữ liệu từ position
SELECT * FROM `Position`;

-- thêm mới dữ liệu vào table Account
INSERT INTO `Account`	(		Email,			Username, 		FullName, 		DepartmentID, 		PositionID)
VALUES					('email1@gmail.com',	'username1',	'fullname1',			1,				1),
						('email2@gmail.com',	'username2',	'fullname2',			2,				2),
						('email3@gmail.com',	'username3',	'fullname3',			3,				3),
						('email4@gmail.com',	'username4',	'fullname4',			4,				4),
                        ('email5@gmail.com',	'username5',	'fullname5',			5,				1);
                        
-- lấy tất cả dữ liệu từ Account
SELECT * FROM `Account`;


-- thêm mới dữ liệu vào table Group
INSERT INTO `Group`(GroupName, 	CreatorID)
VALUES				(N'Nhóm 1', 		1),
					(N'Nhóm 2', 		2),
					(N'Nhóm 3', 		3),
					(N'Nhóm 4', 		4),
					(N'Nhóm 5', 		5);
				
-- lấy tất cả dữ liệu từ Group
SELECT * FROM `Group`;

-- thêm mới dữ liệu vào table GroupAccount
INSERT INTO GroupAccount(GroupID, 	AccountID)
VALUES					(1, 			1),
						(2, 			2),
						(3, 			3),
						(4, 			4),
						(5, 			5);
-- lấy tất cả dữ liệu từ GroupAccount
SELECT * FROM GroupAccount;

-- thêm mới dữ liệu vào table TypeQuestion
INSERT INTO TypeQuestion(TypeName)
VALUES					('Essay'),
						('Multiple-Choice');
                       
-- lấy tất cả dữ liệu từ TypeQuestion
SELECT * FROM TypeQuestion;

-- thêm mới dữ liệu vào table CategoryQuestion
INSERT INTO CategoryQuestion(CategoryName)
VALUES						('Java'),
							('.NET'),
                            ('SQL'),
                            ('Postman'),
                            ('Ruby');
-- lấy tất cả dữ liệu từ CategoryQuestion
SELECT * FROM CategoryQuestion;

-- thêm mới dữ liệu vào table Question
INSERT INTO Question(Content,				CategoryID,			TypeID, 		CreatorID)
VALUES				('Hỏi đáp Java',			1,					1,					1),
					('Hỏi đáp .NET',			2,					2,					5),
					('Hỏi đáp SQL',				3,					2,					4),
					('Hỏi đáp Postman',			4,					2,					3),
					('Hỏi đáp Ruby',			5,					1,					2);
-- lấy tất cả dữ liệu từ Question
SELECT * FROM Question;

-- thêm mới dữ liệu vào table Answer
INSERT INTO Answer	(Content,				QuestionID,		isCorrect)
VALUES				('Dap an: Java',			1,			TRUE),
					('Dap an: .NET',			2,			FALSE),
					('Dap an: SQL',				3,			FALSE),
					('Dap an: Postman',			4,			TRUE),
					('Dap an: Ruby',			5,			FALSE);
-- lấy tất cả dữ liệu từ Answer
SELECT * FROM Answer;

-- thêm mới dữ liệu vào table Exam
INSERT INTO Exam	(`Code`,	Title,			CategoryID, 	Duration, 		CreatorID)
VALUES				('De1',		'Đề Java',			1,				90,				1),
					('De2',		'Đề .NET',			2,				90,				2),
					('De3',		'Đề SQL',			3,				120,			3),
					('De4',		'Đề Postman',		4,				60,				4),
					('De5',		'Đề Ruby',			5,				150,			5);
-- lấy tất cả dữ liệu từ Exam
SELECT * FROM Exam;

-- thêm mới dữ liệu vào table ExamQuestion
INSERT INTO ExamQuestion(ExamID,	QuestionID)
VALUES					(1,				1),
						(2,				2),
						(3,				3),
						(4,				4),
						(5,				5);
-- lấy tất cả dữ liệu từ ExamQuestion
SELECT * FROM ExamQuestion;




