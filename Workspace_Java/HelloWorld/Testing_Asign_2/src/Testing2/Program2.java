package Testing2;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.Scanner;
import Testing2.Position.PositionName;



public class Program2 {
	public static void main(String[] args) {
		// Khởi tạo 3 đối tượng cho Department
		Department dept1 = new Department();
		dept1.id = 1;
		dept1.name = "Kỹ thuật";
		
		Department dept2 = new Department();
		dept2.id = 2;
		dept2.name = "Bảo vệ";
		
		Department dept3 = new Department();
		dept3.id = 3;
		dept3.name = "Thư kí";
		
	// Khởi tạo đối tượng cho Position
		Position po1 = new Position();
		po1.id = 1;
		po1.name = PositionName.Dev;
		
		Position po2 = new Position();
		po2.id = 2;
		po2.name = PositionName.Scrum_Master;
		
		Position po3 = new Position();
		po3.id = 1;
		po3.name = PositionName.PM;
		
	// Khởi tạo đối tượng Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Nhóm 1";
		
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Nhóm 2";
						
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Nhóm 3";	
		
	// Khởi tạo đối tượng Account
		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "vitiai@gmail.com";
		acc1.username = "vitiai";
		acc1.fullname = "Nguyễn Vi Ti Ai";
		acc1.department = dept1;
		acc1.position = po1;
		acc1.createDate = LocalDate.now();
		Group[] groupAcc1 = {group1, group2};
		acc1.groups = groupAcc1;
		
		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "vitiai2@gmail.com";
		acc2.username = "vitiai2";
		acc2.fullname = "Nguyễn Vi Ti Ai Hai";
		acc2.department = dept2;
		acc2.position = po2;
		acc2.createDate = LocalDate.now();
		Group[] groupAcc2 = {group2, group3};
		acc2.groups = groupAcc2;
		
		Account acc3 = new Account();
		acc3.id = 3;
		acc3.email = "vitiai3@gmail.com";
		acc3.username = "vitiai 3";
		acc3.fullname = "Nguyễn Vi Ti Ai Ba";
		acc3.department = dept3;
		acc3.position = po3;
		acc3.createDate = LocalDate.now();
		Group[] groupAcc3 = {group3, group1, group2};
		acc3.groups = groupAcc3;

		Exam exam1 = new Exam();
		exam1.id = 1;
		exam1.code = "E1";
		exam1.title = "Cau Hoi E1";
		exam1.duration = 180;
		exam1.creator = acc1;
		exam1.createDate = new Date(2021/9/25);
		
		Exam exam2 = new Exam();
		exam2.id = 2;
		exam2.code = "E2";
		exam2.title = "Cau Hoi E2";
		exam2.duration = 90;
		exam2.creator = acc2;
		exam2.createDate = new Date(2021/6/15);
		
		Exam exam3 = new Exam();
		exam3.id = 3;
		exam3.code = "E3";
		exam3.title = "Cau Hoi E3";
		exam3.duration = 60;
		exam3.creator = acc3;
		exam3.createDate = new Date(2021/7/19);
		

		Account[] AccArray1 = {acc1, acc3, acc2};
		group1.accounts = AccArray1;
		Account[] AccArray2 = {acc1, acc2};
		group2.accounts = AccArray2;
		Account[] AccArray3 = {acc3, acc2};
		group3.accounts = AccArray3;

		
								
		// Exersise 1:
		System.out.println("\tExersise 1");
		// Question1:
		System.out.println("---Question 1---");
		if (acc1.department == null) {
			System.out.println("Nhân viên này chưa có phòng ban");
		} else {
			System.out.println("Phòng ban của nhân viên này là "
		+ acc1.department.name);
		}

		// Question2:
		System.out.println("---Question 2---");
		if (acc1.groups.length == 0) {
			System.out.println("NV này chưa có group");
		} else if (acc1.groups.length == 1 || acc1.groups.length == 2) {
			System.out.println("Group của NV này là: ");
			for (Group group : acc1.groups) {
				System.out.println(group.name + "");
			}
		} else if (acc1.groups.length == 3) {
			System.out.println("Nhân viên này là người quan trọng"
		+ " tham gia nhiều group");
		} else {
			System.out.println("Nhân viên này là người hóng chuyện,"
		+ "tham gia tất cả các group");
		} 	

		// Question3:
		System.out.println("---Question 3---");
		System.out.println(acc1.department == null 
				? "Nhân viên này chưa có phòng ban"
				: "Phòng ban của nhân viên này là " + acc1.department.name);

		// Question4:
		System.out.println("---Question 4---");
		System.out.println(acc1.position.name.toString() == "Dev"
				? "Đây là Developer"
				: "Người này không phải là Developer");
		
		// Question5:
		System.out.println("---Question 5---");
		switch (group1.accounts.length) {
		case 1:
			System.out.println("Nhóm có một thành viên");
			break;
		case 2:
			System.out.println("Nhóm có hai thành viên");
			break;
		case 3:
			System.out.println("Nhóm có ba thành viên");
			break;
		default:
			System.out.println("Nhóm có nhiều thành viên");
		}
		
		// Question6:
			System.out.println("---Question 6---");
			switch (acc1.groups.length) {
			case 0:
				System.out.println("NV này chưa có group");
				break;
			case 1:
			case 2:
				System.out.println("Group của NV này là: ");
				for (Group group : acc1.groups) {
					System.out.println(group.name + "");
				}
				break;
			case 3:
				System.out.println("Nhân viên này là người quan trọng"
						+ " tham gia nhiều group");
				break;
			default:
				System.out.println("Nhân viên này là người hóng chuyện,"
						+ "tham gia tất cả các group");
				break;
			}	
			
		// Question7:
			System.out.println("---Question 7---");
			String poName = acc1.position.name.toString();
			switch (poName) {
			case "Dev":
				System.out.println("Đây là Developer");
				break;
			default:
				System.out.println("Người này không phải là Developer");
				break;
			}
			
		// Question8:
			System.out.println("---Question 8---");
			Account[] accounts = {acc1, acc2, acc3};
			for (Account account : accounts) {
				System.out.println("--Thông tin của acc " + account.id + ":"
						+ "\n" + "Email: " + account.email + "\n"
						+ "Fullname: " + account.fullname + "\n"
						+ "Department: " + account.department.name);
			}
			
		// Question9:
			System.out.println("---Question 9---");
			Department[] departments = {dept1, dept2, dept3};
			for (Department department : departments) {
				System.out.println("--Thông tin của phòng ban " + department.id 
						+ ":" + "\n" 
						+ "id: " + department.id + "\n"
						+ "Name: " + department.name);
			}
			
		// Question10:
			System.out.println("---Question 10---");
			Account[] accArr = {acc1, acc2};
			for(int i = 0; i < accArr.length; i++) {
				System.out.println("--Thông tin account: " + (i + 1) + ":" + "\n"
						+ "Email: " + accArr[i].email + "\n"
						+ "Fullname: " + accArr[i].fullname + "\n"
						+ "Department: " + accArr[i].department.name);
			}

		// Question11:
			System.out.println("---Question 11---");
			
			for(int i = 0; i < departments.length; i++) {
				System.out.println("Thông tin phòng ban: " + (i+1) + ":" + "\n"
						+ "ID: " + departments[i].id + "\n"
						+ "Name: " + departments[i].name);
			}

		// Question12:
			System.out.println("---Question 12---");
			for(int i = 0; i < 2; i++) {	
				System.out.println("Thông tin phòng ban: " + (i+1) + ":" + "\n"
						+ "ID: " + departments[i].id + "\n"
						+ "Name: " + departments[i].name);
			}

		// Question13:
			System.out.println("---Question 13---");
			for(int i = 0; i < accounts.length; i++) {
				if(i != 1) {
					System.out.println("--Thông tin account: " + (i + 1) + ":\n" 
							+ "Email: " + accounts[i].email + "\n"
							+ "Fullname: " + accounts[i].fullname + "\n"
							+ "Department: " + accounts[i].department.name);
				}
			}

		// Question14:
			System.out.println("---Question 14---");
			for(int i = 0; i < accounts.length; i++) {
				if(accounts[i].id < 4) {
					System.out.println("--Thông tin account " + (i + 1) + ":" 
							+ "\n"
							+ "Email: " + accounts[i].email + "\n"
							+ "Fullname: " + accounts[i].fullname + "\n"
							+ "Department: " + accounts[i].department.name);
				}
			}

		// Question15:
			System.out.println("---Question 15---");
			for(int i = 0; i <= 20; i++) {
				if(i % 2 == 0) {
					System.out.println(i);
				}
			}
		
			
		// Exersise 2:
		System.out.println("\tExersise 2");
		// Question1:
		System.out.println("---Question 1---");
		int i = 5;
		System.out.printf("%d\n", i);

		// Question2:
		System.out.println("---Question 2---");
		int j = 100000000;
		System.out.printf("%,d\n", j);

		// Question3:
		System.out.println("---Question 3---");
		float k = 5.0567098f;
		System.out.printf("%5.4f\n", k);

		// Question4:
		System.out.println("---Question 4---");
		String h = "Nguyễn Văn A";
		System.out.printf("%s\n", "Tôi tên là \"" + h + "\" và tôi đang độc thân");

		// Question5:
		System.out.println("---Question 5---");
		String pattern = "dd/MM/yyyy HH:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		System.out.println(date);
		// Question6:
		System.out.println("---Question 6---");
		
		
		// Exersise 3:
		System.out.println("\tExersise 3");
		// Question1:
		Locale locale = new Locale("vi", "VI");
		DateFormat preformat = DateFormat.getDateInstance(DateFormat.DEFAULT, locale);
		String date1 = preformat.format(exam1.createDate);
		System.out.println("Thông tin Exam1:\n"
			+ "id: " + exam1.id + "\n"
			+ "code: " + exam1.code + "\n"
			+ "title: " + exam1.title + "\n"
			+ "duration: " + exam1.duration + "\n"
			+ "creator: " + exam1.creator.fullname + "\n"
			+ "createDate: " + date1);

		// Question2:	
		// System.out.println("---Question 2---");
		// String pattern2 = "yyyy-MM-dd-HH-mm-ss";
		// SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(pattern2);
		// Exam[] ExamArr = {exam1, exam2, exam3};
		// for (Exam exam : ExamArr) {
		// 	String date2 = simpleDateFormat2.format(exam.createDate);
		// 	System.out.println("Thông tin Exam thứ " + exam + 1 + ":\n"
		// 	+ exam.code + ":" + date2);
		// }

		// Question3:
		// System.out.println("---Question 3---");
		// String pattern3 = "yyyy";
		// simpleDateFormat2 = new SimpleDateFormat(pattern3);
		// for (Exam exam : ExamArr) {
		// 	String date2 = simpleDateFormat2.format(exam.createDate);
		// 	System.out.println("Thông tin Exam thứ " + exam + 1 + ":\n"
		// 	+ exam.code + ":" + date2);
		// }

		// Question4:
		System.out.println("---Question 4---");
		// Question5:
		System.out.println("---Question 5---");

		// Exersise 4:
		System.out.println("\tExersise 4");
		// Question1:
		System.out.println("---Question 1---");
		Random randomInt = new Random();
		int x = randomInt.nextInt();
		System.out.println("Số nguyên ngẫu nhiên: " + x);

		// Question2:
		System.out.println("---Question 2---");
		Random randomFloat = new Random();
		float y = randomFloat.nextFloat();
		System.out.println("Số thực ngẫu nhiên: " + y);

		// Question3:
		System.out.println("---Question 3---");
		String[] stuArray = {"Hoa", "Khoa", "Đang", "Nhung", "Minh"};
		Random randomStudent = new Random();
		int z =  randomStudent.nextInt(stuArray.length);
		System.out.println("Lấy ngẫu nhiên bạn: " + stuArray[z]);

		// Question4:
		System.out.println("---Question 4---");
		Random random_ques4 = new Random();
			// lấy ra khoảng thời gian đầu (mốc)
		int minDay = (int) LocalDate.of(1995,7,24).toEpochDay();
			// lấy ra khoảng thời gian cuối (đích)
		int maxDay = (int) LocalDate.of(1995,12,20).toEpochDay();
		// lấy ra số ngày ngẫu nhiên trong khoảng thời gian trên
		long randomDAYS = minDay + random_ques4.nextInt(maxDay - minDay);
			// lấy ra 1 ngày ngẫu nhiên trong khoảng thời gian ngẫu nhiên vừa lấy
		LocalDate randomDay = LocalDate.ofEpochDay(randomDAYS);
		System.out.println(randomDay);

		// Question5:
		System.out.println("---Question 5---");
		Random yearRollBack = new Random();
		int present = (int) LocalDate.now().toEpochDay();
		// lấy ra ngày ngẫu nhiên trong 1 năm
		int randomDate = yearRollBack.nextInt(365);
		// lấy ra ngẫu nhiên ngày trong 1 năm trở lại
		LocalDate randomOneDay = LocalDate.ofEpochDay(present - randomDate);
		System.out.println(randomOneDay);

		// Question6:
		System.out.println("---Question 6---");
		Random yearPast = new Random();
		int present_ques6 = (int) LocalDate.now().toEpochDay();
		int randomDatePast = yearPast.nextInt(present_ques6);
		// lấy ra ngẫu nhiên 1 ngày trong quá khứ
		LocalDate returnDay = LocalDate.ofEpochDay(randomDatePast);
		System.out.println(returnDay);

		// Question7:
		System.out.println("---Question 7---");
		Random randomNum = new Random();
		// Lấy ra số ngẫu nhiên có n chữ số: (max - min + 1) + min:
		int num = randomNum.nextInt(999 - 100 + 1) + 100;
		System.out.println(num);

		// Exersise 5:
		System.out.println("\tExersise 5"); 
		// Question1:
		// System.out.println("---Question 1---");
		// Scanner scanner = new Scanner(System.in);
		// System.out.println("Nhập vào 3 số nguyên: ");
		// System.out.println("Nhập lần 1: ");
		// int a = scanner.nextInt();
		// System.out.println("Nhập lần 2: ");
		// int b = scanner.nextInt();
		// System.out.println("Nhập lần 3: ");
		// int c = scanner.nextInt();
		// System.out.println("Các số vừa nhập lần lượt là: " + a + "|" + b + "|" + c);

		// Question2:
		// System.out.println("---Question 2---");
		// Scanner scanner2 = new Scanner(System.in);
		// System.out.println("Nhập vào 2 số thực: ");
		// System.out.println("Nhập lần 1: ");
		// float d = scanner2.nextFloat();
		// System.out.println("Nhập lần 2: ");
		// float e = scanner2.nextFloat();
		// System.out.println("Các số vừa nhập lần lượt là: " + d + "|" + e);
		
		// Question3:
		// System.out.println("---Question 3---");
		// Scanner scanner3 = new Scanner(System.in);
		// System.out.println("Nhập họ và tên: ");
		// String f = scanner3.nextLine();
		// System.out.println("Tên đầy đủ: " + f);

		// Question4:
		// System.out.println("---Question 4---");
		// Scanner scanner4 = new Scanner(System.in);
		// System.out.println("Nhập vào năm sinh: ");
		// int year = scanner4.nextInt();
		// System.out.println("Nhập vào tháng sinh: ");
		// int month = scanner4.nextInt();
		// System.out.println("Nhập vào ngày sinh: ");
		// int day = scanner4.nextInt();
		// LocalDate dateBirth = LocalDate.of(year, month, day);
		// System.out.println("Ngày sinh của bạn là: " + dateBirth);
		
		// Question5:
		System.out.println("---Question 5---");
		
		// Question6:
		// System.out.println("---Question 6---");
		// Scanner scc = new Scanner(System.in);
		// System.out.println("Nhập thông tin department cần tạo: ");
		// Department dept = new Department();
		// System.out.println("Nhập ID: ");
		// dept.id = scc.nextInt();
		// System.out.println("Nhập tên: ");
		// dept.name = scc.next();
		// System.out.println("Thông tin dept vừa tạo: " + "\n"
		// 		+ "ID: " + dept.id + "\n" + dept.name);



		// Exersise 6:
		System.out.println("\tExersise 6");
		// Question1:
		System.out.println("---Question 1---");
		for(int soChan = 0; soChan < 10; soChan++) {
			if(soChan % 2 == 0) {
				System.out.println("Số chắn nguyên dương < 10: " + soChan);
			}
		}

		// Question2:
		System.out.println("---Question 2---");

	}
}
