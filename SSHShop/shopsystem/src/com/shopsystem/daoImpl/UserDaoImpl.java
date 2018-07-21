package com.shopsystem.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.dao.UserDao;
import com.shopsystem.domain.PageHibernateCallback;
import com.shopsystem.domain.User;

@Transactional
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Override
	public User findByUsername(String username) {
		String hql = "from User where username = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	@Override
	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	@Override
	public User login(User user) {
		String hql = "from User where username = ? and password = ? and state = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, user.getUsername(), user.getPassword(), 1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int findCount() {
		String hql = "select count(*) from User";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<User> findByPage(int begin, int limit) {
		String hql = "from User";
		List<User> list = (List<User>) this.getHibernateTemplate()
				.execute(new PageHibernateCallback<User>(hql, null, begin, limit));
		return list;
	}

	@Override
	public User findByUid(Integer uid) {
		return this.getHibernateTemplate().get(User.class, uid);
	}

	@Override
	public void delete(User existUser) {
		this.getHibernateTemplate().delete(existUser);
	}

}
