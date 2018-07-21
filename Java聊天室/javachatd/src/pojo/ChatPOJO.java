package pojo;

public class ChatPOJO {
	public ChatPOJO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ChatPOJO(int num, String content, String send, String receive, String time) {
		super();
		this.num = num;
		this.content = content;
		this.send = send;
		this.receive = receive;
		this.time = time;
	}


	private int num;
	private String content;
	private String send;
	private String receive;
	private String time;
	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getSend() {
		return send;
	}


	public void setSend(String send) {
		this.send = send;
	}


	public String getReceive() {
		return receive;
	}


	public void setReceive(String receive) {
		this.receive = receive;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}
	
	
}
