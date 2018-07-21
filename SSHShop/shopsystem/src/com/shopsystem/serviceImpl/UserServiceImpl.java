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
		// 将数据存入到数据库
		user.setState(1); 
		String code=System.currentTimeMillis()+user.getUsername()+"code";
		user.setCode(code);
		userDao.save(user);
		// 发送激活邮件;
		
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
	// 业务层用户查询所有
	@Override
	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		// 显示5个
		int limit = 5;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合:
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
