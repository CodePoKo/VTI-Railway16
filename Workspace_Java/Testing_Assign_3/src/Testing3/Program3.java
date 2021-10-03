package Testing3;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;


public class Program3 {

	public static void Exersise1() {
    	System.out.println("\n\tEXERSISE 1\n");
         //Question1:
        System.out.println("\t---Question1---");
         // ép kiểu rộng: double -> float
        float luong1 = (float) 5240.5;
        float luong2 = (float) 10970.055;
         // ép kiểu rộng: float -> int
        int newLuong1 = (int) luong1;
        int newLuong2 = (int) luong2;
        System.out.println("Làm tròn lương 1: " + newLuong1);
        System.out.println("Làm tròn lương 2: " + newLuong2);

         //Question2:
        System.out.println("\t---Question2---");
        Random randomNum = new Random();
        int num = randomNum.nextInt(99999);
        if(num < 10000) {
            num *= 10;
        } 
        System.out.println("Số ngẫu nhiên 5 chữ số: " + num);
        
        //Question3:
        System.out.println("\t---Question3---");
        String newNum = String.valueOf(num);
        System.out.println("Hai số cuối: " + newNum.substring(3));

        //Question4:
        // question4();
    }
    
    public static void question4() {
        int a, b;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập a = ");
        a = scanner.nextInt();
        do {
            System.out.println("Nhập b = ");
            b = scanner.nextInt();
            if (b == 0) {
                System.out.println("Vui lòng nhập b khác 0 !");
            }
        } while (b == 0);
        System.out.println("Thương: " + (float) a / (float) b);
    }
    
    public static void Exersise2() {
    	System.out.println("\n\tEXERSISE 2\n");
        //Question1:
        System.out.println("\t---Question1---");
        Account[] accArray = new Account[5];
        for(int i = 0; i < accArray.length; i++) {
            Account acc = new Account(); 
            acc.email = "Email" + (i + 1);
            acc.username = "User name" + (i + 1);
            acc.fullName = "Full name " + (i + 1);
            acc.createDate = LocalDate.now();
            accArray[i] = acc;
            System.out.println("Thông tin acc thứ: " + i + 1 + "\n"
                    + "Email: " + accArray[i].email + "\n"
                    + "Username: " + accArray[i].username + "\n"
                    + "FullName: " + accArray[i].fullName + "\n"
                    + "CreateDate: " + accArray[i].createDate);
        }
    }
    
    public static void Exersise3() {
    	System.out.println("\n\tEXERSISE 3\n");
		//Question1:
        System.out.println("\t---Question1---");
        Integer luong = 5000;
        System.out.printf("%6.2f\n", (float)luong);
        
      //Question2:
        System.out.println("\t---Question2---");
        String val = "1234567";
        int newVal = Integer.parseInt(val);
        System.out.println(newVal);
        
      //Question3:
        System.out.println("\t---Question3---");
        Integer val2 = 1234567;
        int newVal2 = val2.intValue();
        System.out.println(newVal2);
	}
    
    public static void Exersise4() {
    	System.out.println("\n\tEXERSISE 4\n");
    	//Question1:
        System.out.println("\t---Question1---");
        String s1 = "Chuỗi bất kỳ";
		System.out.println(s1.length());;
		
		//Question2:
        System.out.println("\t---Question2---");
		String s2 = "abc";
		System.out.println(s1.concat(s2));
		
		//Question3:
//        System.out.println("\t---Question3---");
//		Scanner scanner = new Scanner(System.in);
//		System.out.println("Moi nhap ten: ");
//		String ten = scanner.nextLine();
//		String S1 = ten.substring(0,1).toUpperCase();
//		System.out.println(S1);
//		String S2 = ten.substring(1);
//		String newName = S1 + S2;
//		System.out.println(newName);
		
		//Question4:
//        System.out.println("\t---Question4---");
//        Scanner scan = new Scanner(System.in);
//        System.out.println("Nhập tên: ");
//        String name = scan.nextLine();
//        for (int i = 0; i < name.length(); i++) {
//			System.out.println("In ra lần lượt: " + name.charAt(i));
//		}
        
      //Question5:
//        System.out.println("\t---Question5---");
//        Scanner sc = new Scanner(System.in);
//        System.out.println("Nhập họ: ");
//        String ho = sc.nextLine();
//        System.out.println("Nhập tên: ");
//        String ten = sc.nextLine();
//        System.out.println("Họ và tên: " + ho + " " + ten);
        
      //Question6:
//        System.out.println("\t---Question6---");
//        Scanner sc1 = new Scanner(System.in);
//        System.out.println("Nhập họ tên: ");
//        String hovaten = sc1.nextLine();
//        String[] words = hovaten.split(" ");
//        for (String word : words) {
//			System.out.println(word);
//		}
		

		//Question7:
//		System.out.println("\t---Question7---");
//     	Scanner sc2 = new Scanner(System.in);
//     	System.out.println("Nhập họ tên: ");
//    	String fullname = sc2.nextLine();
//    	fullname = fullname.trim().replaceAll("\\s+", " ");
////    	System.out.println(fullname);
//   
//    	String[] fullnameCat = fullname.split(" ");
//    	for (String word : fullnameCat) {
//			String w1 = word.substring(0,1).toUpperCase();
//			String w2 = word.substring(1).toLowerCase();
//			word = w1 + w2;
//			fullname += word + " ";
//		}
//    	System.out.println("Chuẩn hóa: " + fullname);
    	
    	//Question8:
    	System.out.println("\t---Question8---");
    	String[] groupsArray = {"Ăn Java", "Học Java", "Ngủ Java"};
    	for (String group : groupsArray) {
			if (group.contains("Java")) {
				System.out.println(group);
			}
		}
    	
    	//Question9:
    	System.out.println("\t---Question9---");
    	String[] groupNames = { "Java", "Java", "MySQL" };
    	for (String groupName : groupNames) {
    		if (groupName.equals("Java")) {
    			System.out.println(groupName);
    		}
    	}
    	
    	//Question10:
    	System.out.println("\t---Question10---");
    	
    	
    	//Question11:
    	System.out.println("\t---Question11---");
    	String Chuoi = "Count special Character";
    	int count = 0;
    	for (int i = 0; i < Chuoi.length(); i++) {
			if(Chuoi.charAt(i) == 'a') {
				count++;
			}
		}
    	System.out.println(count);
    	
    	//Question12:
//    	System.out.println("\t---Question12---");
//    	Scanner scan = new Scanner(System.in);
//     	System.out.println("Nhập chuỗi để reverse: ");
//     	String CHUOI = scan.nextLine();
//     	System.out.println(CHUOI);
//     	String chuoiReverse = "";
//     	for (int i = CHUOI.length() - 1; i >= 0; i--) {
//     		chuoiReverse += CHUOI.charAt(i);
//		}
//     	System.out.println(chuoiReverse);
//     	
     	//Question13:
    	System.out.println("\t---Question13---");
    	
    	//Question14:
//    	System.out.println("\t---Question14---");
//    	Scanner scann = new Scanner(System.in);
//    	System.out.println("Nhập chuỗi: ");
//    	String string = scann.nextLine();
//    	System.out.println("Ký tự muốn chuyển: ");
//    	char a = scann.nextLine().toCharArray()[0];
//    	System.out.println("Ký tự được chuyển: ");
//    	char b = scann.nextLine().toCharArray()[0];
//    	for (int i = 0; i < string.length(); i++) {
//			if(string.charAt(i) == a) {
//				string = string.replace(a, b);
//			}
//		}
//    	System.out.println("Chuỗi sau khi chuyển: " + string);
    	
    	//Question15:
//    	System.out.println("\t---Question15---");
//    	Scanner scanne = new Scanner(System.in);
//    	System.out.println("Nhập chuỗi: ");
//    	String stringg = scanne.nextLine();
//    	
//    	stringg = stringg.trim();
//    	stringg = stringg.replaceAll("\\s+", " ");
//    	String[] stringgArr = stringg.split(" ");
//    	for (int i = stringgArr.length - 1; i >= 0; i--) {
//			System.out.print(stringgArr[i] + " ");
//		}
    	
    	//Question16:
//    	System.out.println("\t---Question16---");
//    	Scanner scanner = new Scanner(System.in);
//    	System.out.println("Nhập chuỗi: ");
//    	String strings = scanner.nextLine();
//    	System.out.println("Nhập ký tự n: ");
//    	int n = scanner.nextInt();
//    	if(strings == "" || strings.isEmpty() || strings.length() % n != 0) {
//    		System.out.println("KO");
//    		return;
//    	}
//    	
//    	for (int i = 0; i < strings.length(); i+= n) {
//			System.out.println(strings.substring(i, i + n));
//		}
    	
    	
    }   
    
    public static void Exersise5() {
    	System.out.println("\n\tEXERSISE 5\n");
    	//Question1:
    	System.out.println("\t---Question1---");
    	Department[] departmentArr = new Department[5];
    	Department department1 = new Department();
    	department1.id = 1;
    	department1.name = "Sale";
    	Department department2 = new Department();
    	department2.id = 2;
    	department2.name = "Marketing";
    	Department department3 = new Department();
    	department3.id = 3;
    	department3.name = "Boss of director";
    	Department department4 = new Department();
    	department4.id = 4;
    	department4.name = "Waiting room";
    	Department department5 = new Department();
    	department5.id = 5;
    	department5.name = "Accounting";
    	departmentArr[0] = department1;
    	departmentArr[1] = department2;
    	departmentArr[2] = department3;
    	departmentArr[3] = department4;
    	departmentArr[4] = department5;
    	
    	
    	//Question2:
        System.out.println("\tQuesstion2");
    	for (Department department : departmentArr) {
			System.out.println(department);
		}
    	
        //Question6:
    	System.out.println("\tQuesstion6");
	}

    public static void main(String[] args) {
        Exersise1();
        Exersise2();
        Exersise3();
        Exersise4();
        Exersise5();
    }
}
