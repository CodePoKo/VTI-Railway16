
public class Program {

	public static void main(String[] args) {
		Department department1 = new Department(); // Hàm khởi tạo rỗng
		department1.id = 1;
		department1.name = "Sale";

		Student student1 = new Student();
		student1.fullName = "Le Hieu";
		student1.dept = department1;

		student1.goToSchool();
		System.out.println("Phòng ban: " + student1.dept.name);

	}

}
