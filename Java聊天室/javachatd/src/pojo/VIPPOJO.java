package pojo;

public class VIPPOJO {
	
	public VIPPOJO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public VIPPOJO(String nickname, String password, String info) {
		super();
		this.nickname = nickname;
		this.password = password;
		this.info = info;
	}

	private String nickname;
	private String password;
	private String info;
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
}
