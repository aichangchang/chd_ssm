package cn.com.bean;

public class Employee {
	private Integer id;
	private String username;
	private String name;
	private String password;
	private String gender;
	private Integer age;
	private Integer salary;
	private String phone;
	private String email;
	private Integer isJob;
	private Integer departmentId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getIsJob() {
		return isJob;
	}

	public void setIsJob(Integer isJob) {
		this.isJob = isJob;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", username=" + username + ", name=" + name + ", password=" + password
				+ ", gender=" + gender + ", age=" + age + ", salary=" + salary + ", phone=" + phone + ", email=" + email
				+ ", isJob=" + isJob + ", departmentId=" + departmentId + "]";
	}

}
