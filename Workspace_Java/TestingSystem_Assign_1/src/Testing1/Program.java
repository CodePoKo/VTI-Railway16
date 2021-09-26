/*
Question 2:
Tạo file Program.java có chứa main() method và khởi tạo ít nhất 3 đối tượng
đối với mỗi table trong java
*/

package Testing1;

import Testing1.Position.PositionName;

import java.time.LocalDate;

public class Program {

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
		Group[] groupAcc3 = {group3, group1};
		acc3.groups = groupAcc3;
		
		
		System.out.println("Thông tin account: ");
		
		System.out.println("-Account 1: \n" + "+ID: " + acc1.id + "\n"
		+ "+Department: " + acc1.department.name + "\n");
		
		System.out.println("-Account 2: \n" + "+Email: " + acc2.email + "\n"
				+ "+Position: " + acc2.position.name + "\n");
		
		System.out.println("-Account 3: \n" + "+Fullname: " + acc3.fullname 
				+ "\n" + "+CreateDate: " + acc3.createDate
				+ "\n" + "+Group: " + acc3.groups[0].name);
	}
}
