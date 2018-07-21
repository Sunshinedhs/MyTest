package com.shopsystem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.shopsystem.domain.User;
import com.shopsystem.service.UserService;
import com.opensymphony.xwork2.*;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	private User user=new User();
	@Override
	public User getModel() {
		return user;
	}

	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//跳转到注册页面的执行方法
	public String registPage() {
		return "registPage";
	}
	
	//AJAX进行异步校验用户名的执行方法
	public void findByName() throws IOException {
		// 调用Service进行查询:
		User existUser = userService.findByUsername(user.getUsername());
		
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().print(1);
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().print(0);
		}
	}
	
	//用户注册的方法
	public void regist() {
		user.setState(1); //用于邮箱激活
		userService.save(user);
	}
	
	/**
	 * 跳转到登录页面
	 */
	public String loginPage() {
		return "loginPage";
	}
	
	/**
	 * 登录的方法
	 * @throws IOException 
	 */
	public void login() throws IOException {
		System.err.println("**************dsadsadsadsa***********************");
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			ServletActionContext.getResponse().getWriter().print("0");
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			ServletActionContext.getResponse().getWriter().print("1");
		
		}
	
	}

	/**
	 * 用户退出的方法
	 */
	public String quit(){
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
	
}
