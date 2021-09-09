-- subqueries với toán tử IN, ALL, ANY/SOME
SELECT *
FROM `Account`
WHERE AccountID  > ANY(SELECT AccountID
						FROM `Account`
						WHERE AccountID = 2 || AccountID = 3 || AccountID = 4);
                        
                        
-- subqueries với toán tử EXIST: kiểm tra sự tồn tại của bản ghi trong subqueries
SELECT *
FROM `Account`
WHERE EXISTS(SELECT AccountID
						FROM `Account`
						WHERE AccountID = 2 || AccountID = 3 || AccountID = 4);         

--------------------------------------------------------------------- VIEW ---------------------------------------------------------------------
DROP VIEW IF EXISTS view_account;

CREATE OR REPLACE VIEW view_account AS
SELECT AccountID, Email, FullName, DepartmentName
FROM `Account`
JOIN Department USING(DepartmentID);

SELECT * 
FROM view_account;




-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
-- Dùng view:
DROP VIEW IF EXISTS v_sale;

CREATE OR REPLACE VIEW v_sale AS
SELECT *
FROM `Account`
INNER JOIN Department USING(DepartmentID)
WHERE DepartmentName = 'Sale';

SELECT * 
FROM v_sale;

-- Dùng CTE:
WITH 
CTE_sale AS (
	SELECT *
	FROM `Account`
	INNER JOIN Department USING(DepartmentID)
	WHERE DepartmentName = 'Sale'
)

SELECT * 
FROM CTE_sale;



-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
-- Dùng view:
DROP VIEW IF EXISTS v_group;

CREATE OR REPLACE VIEW v_group AS
SELECT *, COUNT(AccountID), GROUP_CONCAT(GROUPID)
FROM `GroupAccount` 
INNER JOIN `Account` USING(AccountID)
GROUP BY AccountID
HAVING COUNT(AccountID) = ( SELECT COUNT(AccountID)
							FROM `GroupAccount` 
							INNER JOIN `Account` USING(AccountID)
							GROUP BY AccountID
                            ORDER BY COUNT(AccountID) DESC
                            LIMIT 1);

SELECT * 
FROM v_group;

-- Dùng CTE:
WITH 
CTE_group AS(
	SELECT *, COUNT(AccountID), GROUP_CONCAT(GROUPID)
	FROM `GroupAccount` 
	INNER JOIN `Account` USING(AccountID)
	GROUP BY AccountID
	HAVING COUNT(AccountID) = ( SELECT COUNT(AccountID)
								FROM `GroupAccount` 
								INNER JOIN `Account` USING(AccountID)
								GROUP BY AccountID
								ORDER BY COUNT(AccountID) DESC
								LIMIT 1)
)
SELECT * 
FROM CTE_group;



-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 20 từ được coi là quá dài) và xóa nó đi\
-- Dùng VIEW:
DROP VIEW IF EXISTS v_content_dai;

CREATE OR REPLACE VIEW v_content_dai AS
SELECT *
FROM Question
WHERE LENGTH(Content) > 20;

SELECT *
FROM v_content_dai;

-- xóa
SET foreign_key_checks = 0;
DELETE FROM v_content_dai;

SELECT * 
FROM v_content_dai;

-- Dùng CTE
WITH 
CTE_content_dai AS(
	SELECT *
	FROM Question
	WHERE LENGTH(Content) > 20
)
SELECT * 
FROM CTE_content_dai;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
-- DÙNG VIEW:
DROP VIEW IF EXISTS v_max_nv;

CREATE OR REPLACE VIEW v_max_nv AS
SELECT DepartmentName, COUNT(DepartmentID), GROUP_CONCAT(AccountID)
FROM Department
INNER JOIN `Account` USING(DepartmentID)
GROUP BY DepartmentID
HAVING COUNT(DepartmentID) = (	SELECT MAX(nv) 
								FROM (SELECT COUNT(DepartmentID) AS nv 
								FROM `Account`
								GROUP BY DepartmentID) AS max_nv);
                            
SELECT * 
FROM v_max_nv;

-- DÙNG CTE:




-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
-- Dùng VIEW:
DROP VIEW IF EXISTS v_user_nguyen;

CREATE OR REPLACE VIEW v_user_nguyen AS
SELECT Content, CategoryID, FullName
FROM Question
INNER JOIN `Account` ON Question.CreatorID = `Account`.AccountID
WHERE SUBSTRING_INDEX(FullName, ' ', 1) = 'Nguyễn';

SELECT *
FROM v_user_nguyen;

-- Dùng CTE
WITH
CTE_user_nguyen AS (
	SELECT Content, CategoryID, FullName
	FROM Question
	INNER JOIN `Account` ON Question.CreatorID = `Account`.AccountID
	WHERE SUBSTRING_INDEX(FullName, ' ', 1) = 'Nguyễn'
)
SELECT *
FROM CTE_user_nguyen;


--------------------------------------------------------------------- CTE ---------------------------------------------------------------------
-- gần giống với VIEW : có thêm thêm sửa xóa
WITH CTE1(AccountID, Email) AS (
	SELECT AccountID, Email
	FROM `Account`
)
SELECT * 
FROM CTE1;
                    

