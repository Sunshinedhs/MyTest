package data.access.obj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pojo.ChatPOJO;

public class ChatDAO {
	
	
	public static List<ChatPOJO> receiveMessage(String send,String receive){
		String s="select * from chat where send='"+send+"' and receive='"+receive+"' or send='"+receive+"' and receive='"+send+"';";
		List<ChatPOJO> arr= new ArrayList<ChatPOJO>();
		PreparedStatement pre;
		try {
			pre = sqlcon().prepareStatement(s);
			ResultSet res=pre.executeQuery();
			while(res.next()){
				ChatPOJO pojo =new ChatPOJO();
				pojo.setContent(res.getString("content"));
				pojo.setNum(res.getInt("num"));
				pojo.setSend(res.getString("send"));
				pojo.setReceive(res.getString("receive"));
				pojo.setTime(res.getString("time"));
				arr.add(pojo);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}
	public static int sendMessage(String content,String send,String receive,String time){
		String s="insert into chat(content,send,receive,time) value('"+content+"','"+send+"','"+receive+"','"+time+"');";
		PreparedStatement pre;
		int i=0;
		try {
			pre = sqlcon().prepareStatement(s);
			i=pre.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("ChatDAO≤„∑¢ÀÕ–≈œ¢¥ÌŒÛ");
			e.printStackTrace();
		}
		return i;
	}
	public static Connection sqlcon() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/javachat";
		String username="root";
		String password="123456";
		Connection con= DriverManager.getConnection(url, username, password);
		return  con;
	}
	
	public static void main(String[] args) {
		
		
		//List<ChatPOJO> arr=receiceMessage("sunshine", "dsds");
		//System.out.println(arr.get(0).getContent());
	}
}
