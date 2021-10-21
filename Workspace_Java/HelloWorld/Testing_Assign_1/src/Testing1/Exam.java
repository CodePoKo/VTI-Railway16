package Testing1;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;

public class Exam {
	
	@Override
	public String toString() {
		return "Exam [categories=" + Arrays.toString(categories) + ", code=" + code + ", createDate=" + createDate
				+ ", creator=" + creator + ", duration=" + duration + ", id=" + id + ", questions="
				+ Arrays.toString(questions) + ", title=" + title + "]";
	}
	int id;
	String code;
	String title;
	int duration;
	Account creator;
	Date createDate;
	CategoryQuestion[] categories;
	Question[] questions;
}
