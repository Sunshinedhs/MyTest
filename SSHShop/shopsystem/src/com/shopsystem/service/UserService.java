package com.shopsystem.service;

import com.shopsystem.domain.PageBean;
import com.shopsystem.domain.User;



public interface UserService {
	User findByUsername(String username);
	void save(User user);
	User findByCode(String code); 	// 业务层根据激活码查询用户
	void update(User existUser);	// 修改用户的状态的方法
	User login(User user);
	PageBean<User> findByPage(Integer page);	// 业务层用户查询所有
	User findByUid(Integer uid);
	void delete(User existUser);
	
}
