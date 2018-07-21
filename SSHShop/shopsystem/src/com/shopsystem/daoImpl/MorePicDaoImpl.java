package com.shopsystem.daoImpl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.domain.MorePic;

@Transactional
public class MorePicDaoImpl extends HibernateDaoSupport{
	
	public void add(MorePic morePic){
		this.getHibernateTemplate().save(morePic);
	}
	
	
	
}
