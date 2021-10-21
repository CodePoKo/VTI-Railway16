package Testing1;

import java.time.LocalDate;
import java.util.Arrays;

public class Group {
	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", creator=" + creator + ", createDate=" + createDate
				+ ", accounts=" + Arrays.toString(accounts) + "]";
	}
	int id;
	String name;
	Account creator;
	LocalDate createDate;
	Account[] accounts;
}
