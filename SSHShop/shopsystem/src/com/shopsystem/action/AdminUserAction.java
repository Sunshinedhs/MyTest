package com.shopsystem.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shopsystem.domain.AdminUser;
import com.shopsystem.serviceImpl.AdminUserServiceImpl;

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser>{
	private AdminUser adminUser =new AdminUser();

	@Override
	public AdminUser getModel() {
		return adminUser;
	}
	
	private AdminUserServiceImpl adminUserServiceImpl;

	public void setAdminUserServiceImpl(AdminUserServiceImpl adminUserServiceImpl) {
		this.adminUserServiceImpl = adminUserServiceImpl;
	}
	
	// 后台登录的执行的方法
		public String login() {
			// 调用service方法完成登录
			AdminUser existAdminUser = adminUserServiceImpl.login(adminUser);
			// 判断
			if (existAdminUser == null) {
				// 用户名或密码错误
				this.addActionError("用户名或密码错误!");
				return "loginFail";
			} else {
				// 登录成功:
				ServletActionContext.getRequest().getSession()
						.setAttribute("existAdminUser", existAdminUser);
				return "loginSuccess";
			}
		}
		public String quit(){
			// 销毁session
			ServletActionContext.getRequest().getSession().removeAttribute("existAdminUser");
			return "quit";
		}
}
