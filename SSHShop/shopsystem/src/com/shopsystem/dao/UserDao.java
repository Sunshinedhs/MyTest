package com.shopsystem.dao;

import java.util.List;

import com.shopsystem.domain.User;

public interface UserDao {
	 User findByUsername(String username);
	 void save(User user);
	 User findByCode(String code);
	 void update(User existUser);
	 User login(User user);
	 int findCount();
	 List<User> findByPage(int begin, int limit);
	 User findByUid(Integer uid);
	 void delete(User existUser);
}
