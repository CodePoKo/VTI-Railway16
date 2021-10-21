package Testing2;

import java.time.LocalDate;

public class Question {
	@Override
	public String toString() {
		return "Question [id=" + id + ", content=" + content + ", category=" + category + ", type=" + type
				+ ", creator=" + creator + ", createDate=" + createDate + "]";
	}
	int id;
	String content;
	CategoryQuestion category;
	TypeQuestion type;
	Account creator;
	LocalDate createDate;
}
