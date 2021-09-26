import java.util.Date;

public class Student {
	Department dept;
	int id;
	float salary;
	String fullName;
	char a;
	Boolean isPassCourse;
	Date birthDay;
	Gender gender;
	int[] diems;

	// Phương thức (hàm)
	void goToSchool() {
		System.out.println(fullName + " going to school");
	}

	void doHomeWork() {
		System.out.println("I'm doing homework");
	}
}
