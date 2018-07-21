package com.shopsystem.service;

import com.shopsystem.domain.PageBean;
import com.shopsystem.domain.User;



public interface UserService {
	User findByUsername(String username);
	void save(User user);
	User findByCode(String code); 	// ҵ�����ݼ������ѯ�û�
	void update(User existUser);	// �޸��û���״̬�ķ���
	User login(User user);
	PageBean<User> findByPage(Integer page);	// ҵ����û���ѯ����
	User findByUid(Integer uid);
	void delete(User existUser);
	
}
