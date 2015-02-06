package com.bmj.entity;

public class CompanyPerson {
	private int memberId;
	private Company company;
	private Users user;
	private int salary;
	private String hireDate;
	
	public CompanyPerson() {}
	
	public CompanyPerson(int memberId, Company company, Users user, int salary,
			String hireDate) {
		this.company = company;
		this.user = user;
		this.salary = salary;
		this.hireDate = hireDate;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	@Override
	public String toString() {
		return "CompanyPerson [memberId=" + memberId + ", company=" + company
				+ ", user=" + user + ", salary=" + salary + ", hireDate="
				+ hireDate + "]";
	}
}
