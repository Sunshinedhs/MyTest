package com.shopsystem.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.dao.UserDao;
import com.shopsystem.domain.PageBean;
import com.shopsystem.domain.User;
import com.shopsystem.service.UserService;

@Transactional
public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public void save(User user) {
		// �����ݴ��뵽���ݿ�
		user.setState(1); 
		String code=System.currentTimeMillis()+user.getUsername()+"code";
		user.setCode(code);
		userDao.save(user);
		// ���ͼ����ʼ�;
		
	}

	@Override
	public User findByCode(String code) {
		return userDao.findByCode(code);
	}

	@Override
	public void update(User existUser) {
		userDao.update(existUser);

	}

	@Override
	public User login(User user) {
		return userDao.login(user);
	}
	// ҵ����û���ѯ����
	@Override
	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		// ���õ�ǰҳ��:
		pageBean.setPage(page);
		// ����ÿҳ��ʾ��¼��:
		// ��ʾ5��
		int limit = 5;
		pageBean.setLimit(limit);
		// �����ܼ�¼��:
		int totalCount = 0;
		totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		// ������ҳ��
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// ����ÿҳ��ʾ���ݼ���:
		int begin = (page - 1)*limit;
		List<User> list = userDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public User findByUid(Integer uid) {
		return userDao.findByUid(uid);
	}

	@Override
	public void delete(User existUser) {
		userDao.delete(existUser);
	}

}
