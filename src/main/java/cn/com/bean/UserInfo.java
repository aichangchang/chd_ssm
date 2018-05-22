package cn.com.bean;

import java.util.Date;

public class UserInfo {
	private Integer id;
	private String username;
	private String password;
	private String name;
	private String gender;
	private Integer age;
	private Date birthday;
	private String nation;
	private String education;
	private String maritalStatus;
	private String phone;
	private String email;
	private String family;
	private String idNumber;
	private String address;
	private String caseHistory;
	private Integer agree;
	private String assess;
	private Integer childrenId;
	private String cname;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
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
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCaseHistory() {
		return caseHistory;
	}
	public void setCaseHistory(String caseHistory) {
		this.caseHistory = caseHistory;
	}
	
	public Integer getAgree() {
		return agree;
	}
	public void setAgree(Integer agree) {
		this.agree = agree;
	}
	public String getAssess() {
		return assess;
	}
	public void setAssess(String assess) {
		this.assess = assess;
	}
	public Integer getChildrenId() {
		return childrenId;
	}
	public void setChildrenId(Integer childrenId) {
		this.childrenId = childrenId;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", age=" + age + ", birthday=" + birthday + ", nation=" + nation
				+ ", education=" + education + ", maritalStatus=" + maritalStatus + ", phone=" + phone + ", email="
				+ email + ", family=" + family + ", idNumber=" + idNumber + ", address=" + address + ", caseHistory="
				+ caseHistory + ", agree=" + agree + ", assess=" + assess + ", childrenId=" + childrenId + ", cname="
				+ cname + "]";
	}
}
