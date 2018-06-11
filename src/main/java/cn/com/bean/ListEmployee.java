package cn.com.bean;

public class ListEmployee {
	private Integer id;
	private String username;
	private String name;
	private String gender;
	private Integer salary;
	private String dname;

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	@Override
	public String toString() {
		return "ListEmployee [id=" + id + ", username=" + username + ", name=" + name + ", gender=" + gender
				+ ", salary=" + salary + ", dname=" + dname + "]";
	}

}
