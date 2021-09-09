USE fresher_management;

INSERT INTO Trainee
(Full_Name,			Birth_Date,	 	Gender, 	ET_IQ, 		ET_Gmath, 	ET_English, 	Training_Class,		Evaluation_Notes,  			VTI_Account)
VALUES	
(N'Nguyễn Văn A', 	'1998-10-07',	'male', 	14.5, 		12, 			28,			'V001',			N'Đánh giá 1 Đánh giá 1 ',	'vti.a.nguyenvan98'),
(N'Trần Thị B', 	'2002-12-01',	'female', 	6.52, 		18, 			43,			'V002',			N'Đánh giá 2 Đánh giá 2 ',	'vti.b.thitran02'),
(N'Hoàng Văn F', 	'1995-02-25',	'female', 	3.27, 		8, 				49,			'V003',			N'Đánh giá 3 Đánh giá 3 ',	'vti.f.vanhoang95'),
(N'Đỗ Văn Z', 		'2001-10-28',	'unknown', 	9.97, 		3, 				28,			'V004',			N'Đánh giá 4 Đánh giá 4 ',	'vti.z.vando01'),
(N'Hồng Thị 8', 	'1993-01-31',	'male', 	12.22, 		15, 			31,			'V005',			N'Đánh giá 5 Đánh giá 5 ',	'vti.8.thihong93'),
(N'Ba Năm Bảy', 	'1994-12-12',	'unknown', 	5.589, 		20, 			36,			'V006',			N'Đánh giá 6 Đánh giá 6 ',	'vti.bay.namba94'),
(N'Nguyễn Ka L', 	'1987-04-15',	'male', 	8.032, 		19, 			35,			'V007',			N'Đánh giá 7 Đánh giá 7 ',	'vti.l.kanguyen87'),
(N'Lê Thị ...', 	'2000-04-30',	'female', 	18.14, 		7, 				44,			'V008',			N'Đánh giá 8 Đánh giá 8 ',	'vti.lethi00'),
(N'T Hi Kh', 		'1999-08-17',	'male', 	20, 		4, 				27,			'V009',			N'Đánh giá 9 Đánh giá 9 ',	'vti.kh.thi99'),
(N'Mười ... Một', 	'1990-02-27',	'unknown', 	11.69, 		18, 			13,			'V010',			N'Đánh giá 10 Đánh giá 10',	'vti.motmuoi.90');



INSERT INTO Data_types_1 (`Name`, 							`Code`,						ModifiedDate)
VALUES					('How long', 						'T001',						'2000-04-29'),
						('No Promise', 						'T002',						'2000-11-13'),
                        ('Why don\'t why', 					'T003',						'1999-03-27'),
                        ('Take me to your heart', 			'T004',						'2000-11-12'),
                        ('Beautiful In White', 				'T005',						'2002-05-05'),
                        ('My Love', 						'T006',						'2004-12-09'),
						('Until you', 						'T007',						'1998-11-25'),
                        ('Sugar', 							'T008',						'2001-08-11'),
                        ('Shape of you', 					'T009',						'2000-07-21'),
                        ('Attention', 						'T010',						'2003-10-25'),
                        ('One call away', 					'T011',						'1999-01-30');



INSERT INTO Data_types_2 (`Name`, 						BirthDate,			Gender,			IsDeletedFlag)
VALUES					('See you again', 				'2003-04-29',		0,					0),
						('Perfect', 					'1985-05-09',		0,					1),
                        ('Something jusst like this', 	'1988-06-22',		1,					0),
                        ('I\'m Your', 					'2001-06-22',		1,					1),
                        ('I do', 						'2003-01-13',		null,				0),
                        ('If i let you go', 			'1995-09-08',		1,					0),
						('Girls like you',				'2000-11-12',		1,					0),
                        ('Lemon tree', 					'1992-10-11',		null,				1),
                        ('Titanium', 					'1999-07-24',		null,				1),
                        ('Let me love you', 			'1997-11-13',		0,					0),
                        ('Faded', 						'1998-12-29',		0,					1);

