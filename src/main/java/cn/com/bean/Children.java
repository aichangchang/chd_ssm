package cn.com.bean;

import java.util.Date;

public class Children {
	private Integer id;
	private Integer number;
	private Integer cage;
	private Date cbirthday;
	private Date reach;
	private String cname;
	private String cgender;
	private String cphone;
	private String email;
	private String cidNumber;
	private String caddress;
	private String cCaseHistory;
	private String cagree;
	private String uname ;
	private String cMessage;
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getCagree() {
		return cagree;
	}

	public void setCagree(String cagree) {
		this.cagree = cagree;
	}

	public Date getReach() {
		return reach;
	}

	public void setReach(Date reach) {
		this.reach = reach;
	}

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

	public String getCidNumber() {
		return cidNumber;
	}

	public void setCidNumber(String cidNumber) {
		this.cidNumber = cidNumber;
	}

	public String getCaddress() {
		return caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
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

	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getcCaseHistory() {
		return cCaseHistory;
	}

	public void setcCaseHistory(String cCaseHistory) {
		this.cCaseHistory = cCaseHistory;
	}

	public String getcMessage() {
		return cMessage;
	}

	public void setcMessage(String cMessage) {
		this.cMessage = cMessage;
	}

	@Override
	public String toString() {
		return "Children [id=" + id + ", number=" + number + ", cage=" + cage + ", cbirthday=" + cbirthday + ", reach="
				+ reach + ", cname=" + cname + ", cgender=" + cgender + ", cphone=" + cphone + ", email=" + email
				+ ", cidNumber=" + cidNumber + ", caddress=" + caddress + ", cCaseHistory=" + cCaseHistory + ", cagree="
				+ cagree + ", cMessage=" + cMessage + "]";
	}

}
