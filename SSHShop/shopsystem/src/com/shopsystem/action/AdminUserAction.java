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
	
	// ��̨��¼��ִ�еķ���
		public String login() {
			// ����service������ɵ�¼
			AdminUser existAdminUser = adminUserServiceImpl.login(adminUser);
			// �ж�
			if (existAdminUser == null) {
				// �û������������
				this.addActionError("�û������������!");
				return "loginFail";
			} else {
				// ��¼�ɹ�:
				ServletActionContext.getRequest().getSession()
						.setAttribute("existAdminUser", existAdminUser);
				return "loginSuccess";
			}
		}
		public String quit(){
			// ����session
			ServletActionContext.getRequest().getSession().removeAttribute("existAdminUser");
			return "quit";
		}
}
