DROP DATABASE TestingManagement;

CREATE DATABASE	 IF NOT EXISTS TestingManagement;
USE TestingManagement;

CREATE TABLE Department (
	DepartmentID			INT,
    DepartmentName 			VARCHAR(20)
);

CREATE TABLE Position (
	PositionID				INT,
    PositionName 			VARCHAR(20)
);

CREATE TABLE Account (
	AccountID 				INT,
	Email					VARCHAR(20),
	Username				VARCHAR(10),
	FullName				VARCHAR(20),
 	DepartmentID 			INT,
 	PositionID 				INT,
 	CreateDate 				DATE
);

CREATE TABLE `Group` (
	GroupID					INT,
	GroupName				VARCHAR(20),
	CreatorID				INT,
	CreateDate				DATE
);

CREATE TABLE GroupAccount (
	GroupID					INT,
    AccountID 				INT,
    JoinDate				DATE
);

CREATE TABLE TypeQuestion (
	TypeID					INT,
    TypeName				VARCHAR(20)
);

CREATE TABLE CategoryQuestion (
	CategoryID				INT,
    CategoryName 			VARCHAR(30)
);

CREATE TABLE Question (
	QuestionID				INT,
	Content					VARCHAR(200),
	CategoryID				INT,
	TypeID					INT,
	CreatorID				INT,
	CreateDate				DATE
);

CREATE TABLE Answer (
	AnswerID				INT,
	Content					LONGTEXT,
	QuestionID				INT,
	isCorrect				ENUM('TRUE','FALSE')
);

CREATE TABLE Exam (
	ExamID					INT,
	`Code`					VARCHAR(10),
	Title					VARCHAR(40),
	CategoryID				INT,
	Duration				TIME,
	CreatorID				INT,
	CreateDate				DATE
);

CREATE TABLE ExamQuestion (
	ExamID					INT,
	QuestionID				INT
);

