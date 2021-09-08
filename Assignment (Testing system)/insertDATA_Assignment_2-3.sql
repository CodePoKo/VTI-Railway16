-- insetDATA
USE TestingManagement;
-- thêm mới dữ liệu vào table department
INSERT INTO Department(DepartmentName)
VALUES						(N'Marketing' ),
							(N'Sale'),
							(N'Bảo vệ'),
							(N'Nhân sự'),
							(N'Kỹ thuật'),
							(N'Tài chính'),
							(N'Phó giám đốc'),
							(N'Giám đốc'),
							(N'Thư kí'),
							(N'No person'),
							(N'Bán hàng');
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
INSERT INTO `Account`	(		Email,					Username, 		FullName, 		DepartmentID, 		PositionID)
VALUES					('lms1.vti.edu.vn@gmail.com',	'username1',	'fullname1',			null,				1),
						('lms2.vti.edu.vn@gmail.com',	'username2',	'fullname2',			null,				2),
						('lms3.vti.edu.vn@gmail.com',	'username3',	'fullname3',			null,				3),
						('lms4.vti.edu.vn@gmail.com',	'username4',	'Nguyễn fullname4',		null,				4),
                        ('lms5.vti.edu.vn@gmail.com',	'username5',	'fullname5',			null,				3),
                        ('lms6.vti.edu.vn@gmail.com',	'username6',	'fullname6',			null,				3),
                        ('lms7.vti.edu.vn@gmail.com',	'username7',	'fullname7',			3,					2),
                        ('lms8.vti.edu.vn@gmail.com',	'username8',	'Nguyễn fullname8',		4,					1),
                        ('lms9.vti.edu.vn@gmail.com',	'username9',	'D fullname9 o',		6,					1),
                        ('lms10.vti.edu.vn@gmail.com',	'username10',	'Nguyễn fullname10',	3,					4),
                        ('lms11.vti.edu.vn@gmail.com',	'username11',	'fullname11',			2,					3);
-- lấy tất cả dữ liệu từ Account
SELECT * FROM `Account`;


-- thêm mới dữ liệu vào table Group
INSERT INTO `Group`(GroupName, 		CreatorID, 		CreateDate)
VALUES				(N'Nhóm 1', 		1, 			'2021-8-30'),
					(N'Nhóm 2', 		2, 			'2021-8-30'),
					(N'Nhóm 3', 		7, 			'2021-5-05'),
					(N'Nhóm 4', 		6, 			'2019-03-07'),
					(N'Nhóm 5', 		9, 			'2021-8-30'),
                    (N'Nhóm 6', 		10, 		'2018-8-09'),
                    (N'Nhóm 7', 		5, 			'2020-6-30'),
                    (N'Nhóm 8', 		4, 			'2019-11-01'),
                    (N'Nhóm 9', 		3, 			'2021-02-02'),
                    (N'Nhóm 10', 		8, 			'2021-05-23');
-- lấy tất cả dữ liệu từ Group
SELECT * FROM `Group`;

-- thêm mới dữ liệu vào table GroupAccount
INSERT INTO GroupAccount(GroupID, 	AccountID)
VALUES					(1, 			1),
						(2, 			2),
						(3, 			1),
						(4, 			1),
						(5, 			5),
                        (6, 			3),
                        (7, 			7),
                        (8, 			3),
                        (9, 			9),
                        (10, 			3);
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
                            ('Ruby'),
                            ('ASP.NET' ),
                            ('C++'),
                            ('NodeJS'),
                            ('ReactJS'),
                            ('PHP');
-- lấy tất cả dữ liệu từ CategoryQuestion
SELECT * FROM CategoryQuestion;

-- thêm mới dữ liệu vào table Question
INSERT INTO Question(Content,				CategoryID,			TypeID, 		CreatorID)
VALUES				('Hỏi Java',				7,					1,					5),
					('Câu hỏi .NET',			4,					2,					8),
					('Câu hỏi SQL',				10,					1,					4),
					('Câu hỏi Postmannnnn
						nnnnnnnnnnn',			6,					2,					3),
					('Câu hỏi Ruby',			8,					1,					2),
                    ('Hỏi ASP.NET',				7,					2,					2),
                    ('Câu hỏi C++',				3,					2,					7),
                    ('Câu hỏi NodeJS',			4,					1,					6),
                    ('Câu hỏi ReactJS',			9,					1,					8),
                    ('Câu hỏi PHP',				1,					1,					9);
-- lấy tất cả dữ liệu từ Question
SELECT * FROM Question;

-- thêm mới dữ liệu vào table Answer
INSERT INTO Answer	(Content,				QuestionID,		isCorrect)
VALUES				('Dap an: Java',			1,			TRUE),
					('Dap an: .NET',			2,			FALSE),
					('Dap an: SQL',				3,			FALSE),
					('Dap an: Postman',			4,			TRUE),
					('Dap an: Ruby',			5,			FALSE),
                    ('Dap an: ASP.NET',			10,			FALSE),
                    ('Dap an: C++',				7,			FALSE),
                    ('Dap an: NodeJS',			10,			FALSE),
                    ('Dap an: ReactJS',			9,			FALSE),
                    ('Dap an: PHP',				10,			FALSE);
-- lấy tất cả dữ liệu từ Answer
SELECT * FROM Answer;

-- thêm mới dữ liệu vào table Exam
INSERT INTO Exam	(`Code`,	Title,			CategoryID, 	Duration, 		CreatorID, 			CreateDate)
VALUES				('De1',		N'Đề Java',			5,				90,				5,				'2010-09-12'),
					('De2',		N'Đề .NET',			6,				90,				2,				'2021-07-05'),
					('De3',		N'Đề SQL',			2,				120,			2,				'2021-07-05'),
					('De4',		N'Đề Postman',		10,				60,				6,				'2016-07-05'),
					('De5',		N'Đề Ruby',			9,				150,			1,				'2021-07-05'),
                    ('De6',		N'Đề ASP.NET',		5,				180,			4,				'2021-07-05'),
                    ('De7',		N'Đề C++',			7,				150,			7,				'2021-07-05'),
                    ('De8',		N'Đề NodeJS',		1,				150,			3,				'2021-06-28'),
                    ('De9',		N'Đề ReactJS',		3,				60,				10,				'2021-07-05'),
                    ('De10',	N'Đề PHP',			4,				30,				7,				'2020-05-19');
-- lấy tất cả dữ liệu từ Exam
SELECT * FROM Exam;

-- thêm mới dữ liệu vào table ExamQuestion
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUE					(1,  		5),
						(2, 		10),
						(3, 		5),
                        (4,  		5),
                        (5,  		1),
                        (6,  		10),
                        (7,  		4),
                        (8,  		10),
                        (9,  		6),
                        (10,  		6);
-- lấy tất cả dữ liệu từ ExamQuestion
SELECT * FROM ExamQuestion;

