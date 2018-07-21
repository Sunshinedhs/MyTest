package data.access.obj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.VIPPOJO;

public class DAO {
	//查询用户信息
	public static VIPPOJO  selectVIP(String nickname){
		VIPPOJO pojo=new VIPPOJO();
		String s="select * from vip where nickname='"+nickname+"';";
		PreparedStatement pre;
		try {
			pre = sqlcon().prepareStatement(s);
			ResultSet res=pre.executeQuery();
			while(res.next()){
				pojo.setNickname(res.getString("nickname"));
				pojo.setPassword(res.getString("password"));
				pojo.setInfo(res.getString("info"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DAO层查询用户信息失败");
			e.printStackTrace();
		}
		
		return pojo;
	}
	//用户注册
	public static int insertVIP(String nickname,String password){
		String s="insert into vip(nickname,password,info) value('"+nickname+"','"+password+"','5.1.jpg')";
		int a=0;
		PreparedStatement pre;
		try {
			pre = sqlcon().prepareStatement(s);
			a=pre.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DAO层 注册用户错误");
			e.printStackTrace();
		}
		return a;
	}
	
	public static List<VIPPOJO> selectAll(){
		List<VIPPOJO> arr =new ArrayList<VIPPOJO>();
		String s="select * from vip";
		PreparedStatement pre;
		try {
			pre = sqlcon().prepareStatement(s);
			ResultSet res=pre.executeQuery();
			while(res.next()){
				VIPPOJO pojo=new VIPPOJO();
				pojo.setNickname(res.getString("nickname"));
				pojo.setPassword(res.getString("password"));
				pojo.setInfo(res.getString("info"));
				arr.add(pojo);
			}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DAO层查询所有vip失败");
			e.printStackTrace();
		}
		return arr;
	}
	
	public static void updatePassword(String nickname,String newpassword){
		String s="update vip set password='"+newpassword+"' where nickname='"+nickname+"';";
		PreparedStatement pre;
		try {
			pre = sqlcon().prepareStatement(s);
			pre.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DAO层修改密码错误");
			e.printStackTrace();
		}
	}
	
	public static void updateInfo(String nickname,String info){
		String s="update vip set info='"+info+"' where nickname='"+nickname+"';";
		PreparedStatement pre;
		try {
			pre = sqlcon().prepareStatement(s);
			pre.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("DAO层修改头像错误");
			e.printStackTrace();
		}
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
		//System.out.println(selectVIP("sunshine").getPassword());
		//List<VIPPOJO> arr=selectAll();
		//updatePassword("sunshine", "654321");
	}
}
