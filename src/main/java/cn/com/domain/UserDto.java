package cn.com.domain;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserDto {
	@NotEmpty(message = "�������˺�")
	@Size (min=6, max=12, message="�û�������ֻ����6-12֮��")
	private String username;
	@NotEmpty(message = "����������")
	@Size (min=6, max=12, message="���볤��ֻ����6-12֮��")
	private String password;
	@NotEmpty(message = "����������")
	@Email(message="�����ʽ����")
	private String email;
	@NotEmpty(message="��������֤��")
	private String securityCode;
	@AssertTrue
	private boolean autoFlag;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public boolean isAutoFlag() {
		return autoFlag;
	}

	public void setAutoFlag(boolean autoFlag) {
		this.autoFlag = autoFlag;
	}

	@Override
	public String toString() {
		return "UserDto [username=" + username + ", password=" + password + ", email=" + email + ", securityCode="
				+ securityCode + ", autoFlag=" + autoFlag + "]";
	}

}
