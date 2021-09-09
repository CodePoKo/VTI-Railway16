DROP DATABASE IF EXISTS assignment_4;
CREATE DATABASE assignment_4;
USE assignment_4;

-- Tạo bảng Department
DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
	Department_Number 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Department_Name		NVARCHAR(50) UNIQUE KEY NOT NULL
);

-- Tạo bảng Employee_Table
DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE IF NOT EXISTS Employee_Table(
	Employee_Number 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Employee_Name		NVARCHAR(50) NOT NULL,
    Department_Number	TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(Department_Number) REFERENCES Department(Department_Number)
);

-- Tạo bảng Employee_Skill_Table
DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE IF NOT EXISTS Employee_Skill_Table(
	Employee_Number 	TINYINT UNSIGNED AUTO_INCREMENT,
    Skill_Code			NVARCHAR(30) NOT NULL,
    Date_Registered		DATETIME DEFAULT NOW(),
    FOREIGN KEY(Employee_Number) REFERENCES Employee_Table(Employee_Number)
);


-- 			-----------------------------------INSERT-------------------------------------------------

INSERT INTO Department (Department_Name)
VALUES					(N'Marketing'),
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
                        

INSERT INTO Employee_Table (Employee_Name,			Department_Number)
VALUES						(N'Nguyễn Văn Ây',					9	),
							(N'Trần Văn Pi',					9	),
                            (N'Tạ Văn Xi',						5	),
                            (N'Phạm Văn Đi',					3	),
                            (N'Lại Thị Ép',						7	),
                            (N'Đinh Thị Ết',					4	),
                            (N'Lê Văn Gi',						9	),
                            (N'Lý Thị Âu',						5	),
                            (N'Mạc Văn Oai',					9	),
                            (N'Ngô Văn Kây',					10	);


INSERT INTO Employee_Skill_Table 	(Employee_Number,		Skill_Code,			Date_Registered)
VALUES								('1',						'iOS',				'2021-09-18'),
									('2',						'C#',				'2021-07-20'),
                                    ('2',						'Ruby',				'2021-05-05'),
                                    ('5',						'PHP',				'2021-07-30'),
                                    ('8',						'Python',			'2021-12-11'),
                                    ('2',						'C++',				'2021-08-09'),
                                    ('9',						'Java',				'2021-12-15'),
                                    ('1',						'MySQL',			'2021-04-22'),
                                    ('4',						'JQuery',			'2021-03-26'),
                                    ('10',						'JS',				'2021-09-14');


-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java (SD: UNION)
SELECT Employee_Number, Employee_Name, Skill_Code
FROM Employee_Table
INNER JOIN Employee_Skill_Table USING(Employee_Number)
WHERE Skill_Code = 'Java';


-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT *, COUNT(Employee_Number)
FROM Department
INNER JOIN Employee_Table USING(Department_Number)
GROUP BY Department_Number
HAVING COUNT(Employee_Number) > 3;


-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT Department_name, Employee_Name 
FROM Department
INNER JOIN Employee_Table USING(Department_Number)
ORDER BY Department_Number ASC;


-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT Employee_Name, COUNT(Employee_Number)
FROM Employee_Table
INNER JOIN Employee_Skill_Table USING(Employee_Number)
GROUP BY Employee_Number
HAVING COUNT(Employee_Number) > 1;



