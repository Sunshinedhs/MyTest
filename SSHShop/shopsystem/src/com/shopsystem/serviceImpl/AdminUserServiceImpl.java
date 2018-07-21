package com.shopsystem.serviceImpl;

import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.daoImpl.AdminUserDaoImpl;
import com.shopsystem.domain.AdminUser;

@Transactional
public class AdminUserServiceImpl {
	private AdminUserDaoImpl adminUserDaoImpl;

	public void setAdminUserDaoImpl(AdminUserDaoImpl adminUserDaoImpl) {
		this.adminUserDaoImpl = adminUserDaoImpl;
	}

	public AdminUser login(AdminUser adminUser) {
		return adminUserDaoImpl.login(adminUser);
	}
}
