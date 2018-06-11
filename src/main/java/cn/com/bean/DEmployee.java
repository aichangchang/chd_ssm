package cn.com.bean;

public class DEmployee {
	private Integer id;
	private String dname;
	private String username;
	private String uname;

	public Integer getId() {
		return id;
	}

	public void setId(Integer did) {
		this.id = did;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "DEmployee [id=" + id + ", dname=" + dname + ", username=" + username + ", uname=" + uname + "]";
	}

}
