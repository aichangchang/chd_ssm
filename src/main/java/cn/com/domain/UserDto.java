package cn.com.domain;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserDto {
	@NotEmpty(message = "请输入账号")
	@Size (min=6, max=12, message="用户名长度只能在6-12之间")
	private String username;
	@NotEmpty(message = "请输入密码")
	@Size (min=6, max=12, message="密码长度只能在6-12之间")
	private String password;
	@NotEmpty(message = "请输入邮箱")
	@Email(message="邮箱格式错误")
	private String email;
	@NotEmpty(message="请输入验证码")
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
