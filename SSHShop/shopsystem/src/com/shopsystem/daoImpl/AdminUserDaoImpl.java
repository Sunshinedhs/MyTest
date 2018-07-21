package com.shopsystem.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.domain.AdminUser;

@Transactional
public class AdminUserDaoImpl extends HibernateDaoSupport {
	// Dao完成登录的代码
	public AdminUser login(AdminUser adminUser) {
		String hql = "from AdminUser where username = ? and password = ?";
		List<AdminUser> list = (List<AdminUser>) this.getHibernateTemplate().find(hql, adminUser.getUsername(),
				adminUser.getPassword());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
