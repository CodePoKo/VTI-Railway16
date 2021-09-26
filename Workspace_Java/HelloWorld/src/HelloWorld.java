// import thư viện java.util.Date khi khai báo Date
import java.util.Date;
// import thư viện java.time.LocalTime khi khai báo LocalTime
import java.time.LocalTime;

public class HelloWorld { // Class HelloWorld để chạy chương trình
	// static int test;

	public static void main(String[] args) { // khai báo hàm main để chạy
		System.out.println("Hello World !");

		int test = 0;
		System.out.println(test);

		Date date = new Date();
		System.out.println(date);

		LocalTime datetime = LocalTime.now();
		System.out.println(datetime);

		Gender gender = Gender.FEMALE;
		System.out.println(gender);

		int[] diems = { 12, 2, 4 }; // Mảng với datatype: số nguyên
		System.out.println(diems); // lấy ra mảng gồm các giá trị
		System.out.println(diems[1]); // lấy ra phần tử thứ 2 trong mảng
		System.out.println(diems[0] + " " + diems[1] + " " + diems[2]);
	}
}























