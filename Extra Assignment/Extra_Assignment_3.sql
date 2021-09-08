-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT * 
FROM Trainee
GROUP BY Birth_Date;



-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản
SELECT *
FROM Trainee
WHERE LENGTH(Full_name) = (	SELECT MAX(LENGTH(Full_name))
							FROM Trainee)
ORDER BY Full_name DESC;



/* Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh 
là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
																		ET_IQ + ET_Gmath>=20
																		ET_IQ>=8
																		ET_Gmath>=8
																		ET_English>=18
*/

SELECT *
FROM Trainee
WHERE ET_IQ + ET_Gmath>=20 && ET_IQ>=8 && ET_Gmath>=8 && ET_English>=18;



-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE FROM Trainee
WHERE TraineeID = 3;

SELECT * FROM Trainee;



-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE Trainee
SET   Training_Class = 'V002'
WHERE TraineeID = 5;

SELECT * FROM Trainee;

