package cn.com.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AddUser {
	private String name;
	private String gender;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private String education;
	private String maritalStatus;
	private String caseHistory;
	private String evidence;
	private String phone;
	private String  assess;
	private Integer  agree;
	
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEvidence() {
		return evidence;
	}
	public void setEvidence(String evidence) {
		this.evidence = evidence;
	}
	public String getAssess() {
		return assess;
	}
	public void setAssess(String assess) {
		this.assess = assess;
	}
	public Integer getAgree() {
		return agree;
	}
	public void setAgree(Integer agree) {
		this.agree = agree;
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
	public String getCaseHistory() {
		return caseHistory;
	}
	public void setCaseHistory(String caseHistory) {
		this.caseHistory = caseHistory;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "AddUser [name=" + name + ", gender=" + gender + ", birthday=" + birthday + ", education=" + education
				+ ", maritalStatus=" + maritalStatus + ", caseHistory=" + caseHistory + ", evidence=" + evidence
				+ ", phone=" + phone + ", assess=" + assess + ", agree=" + agree + "]";
	}
	
}
