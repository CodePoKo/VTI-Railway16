package Testing1;

import java.time.LocalDate;

public class GroupAccount {
	@Override
	public String toString() {
		return "GroupAccount [group=" + group + ", account=" + account + ", JoinDate=" + JoinDate + "]";
	}
	Group group;
	Account account;
	LocalDate JoinDate;
}
