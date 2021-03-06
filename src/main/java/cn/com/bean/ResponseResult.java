package cn.com.bean;

public class ResponseResult<T> {
	
	public static final int STATE_OK = 1;
	public static final int STATE_ERROR = -1;
	
	private Integer code;
	private String message;
	private T data;

	public ResponseResult() {
	};

	public ResponseResult(Integer code, String message) {
		super();
		this.code = code;
		this.message = message;
	}

	public ResponseResult(Integer code, T data) {
		super();
		this.code = code;
		this.data = data;
	}

	public ResponseResult(Integer code, String message, T data) {
		super();
		this.code = code;
		this.message = message;
		this.data = data;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "ResponseResult [code=" + code + ", message=" + message + ", data=" + data + "]";
	}

}
