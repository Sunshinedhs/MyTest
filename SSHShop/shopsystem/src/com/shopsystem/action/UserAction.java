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
	
	//��ת��ע��ҳ���ִ�з���
	public String registPage() {
		return "registPage";
	}
	
	//AJAX�����첽У���û�����ִ�з���
	public void findByName() throws IOException {
		// ����Service���в�ѯ:
		User existUser = userService.findByUsername(user.getUsername());
		
		// ���response����,��ҳ�����:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// �ж�
		if (existUser != null) {
			// ��ѯ�����û�:�û����Ѿ�����
			response.getWriter().print(1);
		} else {
			// û��ѯ�����û�:�û�������ʹ��
			response.getWriter().print(0);
		}
	}
	
	//�û�ע��ķ���
	public void regist() {
		user.setState(1); //�������伤��
		userService.save(user);
	}
	
	/**
	 * ��ת����¼ҳ��
	 */
	public String loginPage() {
		return "loginPage";
	}
	
	/**
	 * ��¼�ķ���
	 * @throws IOException 
	 */
	public void login() throws IOException {
		System.err.println("**************dsadsadsadsa***********************");
		User existUser = userService.login(user);
		// �ж�
		if (existUser == null) {
			// ��¼ʧ��
			ServletActionContext.getResponse().getWriter().print("0");
		} else {
			// ��¼�ɹ�
			// ���û�����Ϣ���뵽session��
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			ServletActionContext.getResponse().getWriter().print("1");
		
		}
	
	}

	/**
	 * �û��˳��ķ���
	 */
	public String quit(){
		// ����session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
	
}
