-- Exercise 1:

-- Tạo table với các ràng buộc và kiểu dữ liệu:
DROP DATABASE IF EXISTS fresher_management;

CREATE DATABASE IF NOT EXISTS fresher_management;
USE fresher_management;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE IF NOT EXISTS Trainee (
	TraineeID				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_Name				NVARCHAR(20) NOT NULL UNIQUE KEY,
    Birth_Date				DATE NOT NULL,
    Gender					ENUM('male', 'female', 'unknown') NOT NULL,
    ET_IQ					TINYINT	UNSIGNED NOT NULL CHECK(ET_IQ <= 20),
    ET_Gmath				TINYINT	UNSIGNED NOT NULL CHECK(ET_Gmath <= 20),
    ET_English				TINYINT	UNSIGNED NOT NULL CHECK(ET_English <= 50),
    Training_Class			TINYINT	UNSIGNED NOT NULL UNIQUE KEY,
    Evaluation_Notes		TEXT NOT NULL
);
-- thêm trường VTI_Account:
ALTER TABLE Trainee ADD COLUMN VTI_Account VARCHAR(20) NOT NULL UNIQUE KEY;

-- Exercise 2:
DROP TABLE IF EXISTS Data_types_1;
CREATE TABLE IF NOT EXISTS Data_types_1 (
	ID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`					VARCHAR(20) NOT NULL,
    `Code`					VARCHAR(5) NOT NULL,
    ModifiedDate			DATETIME NOT NULL
);

-- Exercise 2:
DROP TABLE IF EXISTS Data_types_2;
CREATE TABLE IF NOT EXISTS Data_types_2 (
	ID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`					VARCHAR(20) NOT NULL,
    BirthDate				DATE NOT NULL,
    Gender					ENUM('0', '1', 'null'),
    IsDeletedFlag			ENUM('0', '1')
);