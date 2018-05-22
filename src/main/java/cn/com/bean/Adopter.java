package cn.com.bean;

import java.util.Date;

public class Adopter {
	private Integer id;
	private Integer number;
	private Integer cage;
	private Date cbirthday;
	private Date reach;
	private String cname;
	private String cgender;
	private String cCaseHistory;
	private String cagree;
	private String cMessage;
	private String uname;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getCage() {
		return cage;
	}

	public void setCage(Integer cage) {
		this.cage = cage;
	}

	public Date getCbirthday() {
		return cbirthday;
	}

	public void setCbirthday(Date cbirthday) {
		this.cbirthday = cbirthday;
	}

	public Date getReach() {
		return reach;
	}

	public void setReach(Date reach) {
		this.reach = reach;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCgender() {
		return cgender;
	}

	public void setCgender(String cgender) {
		this.cgender = cgender;
	}

	public String getcCaseHistory() {
		return cCaseHistory;
	}

	public void setcCaseHistory(String cCaseHistory) {
		this.cCaseHistory = cCaseHistory;
	}

	public String getCagree() {
		return cagree;
	}

	public void setCagree(String cagree) {
		this.cagree = cagree;
	}

	public String getcMessage() {
		return cMessage;
	}

	public void setcMessage(String cMessage) {
		this.cMessage = cMessage;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "Adopter [id=" + id + ", number=" + number + ", cage=" + cage + ", cbirthday=" + cbirthday + ", reach="
				+ reach + ", cname=" + cname + ", cgender=" + cgender + ", cCaseHistory=" + cCaseHistory + ", cagree="
				+ cagree + ", cMessage=" + cMessage + ", uname=" + uname + "]";
	}

}
