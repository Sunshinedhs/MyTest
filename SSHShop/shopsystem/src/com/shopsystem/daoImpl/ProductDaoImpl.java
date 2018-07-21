package com.shopsystem.daoImpl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;
import com.shopsystem.dao.ProductDao;
import com.shopsystem.domain.PageHibernateCallback;
import com.shopsystem.domain.Product;

@Transactional
public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {

	@Override
	public List<Product> findHot() {
		// ʹ������������ѯ.
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		// ��ѯ���ŵ���Ʒ,��������is_host = 1
		criteria.add(Restrictions.eq("hot", 1));
		// �����������:
		criteria.addOrder(Order.desc("pdate"));
		// ִ�в�ѯ:
		List<Product> list = (List<Product>) this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}

	@Override
	public List<Product> findNew() {
		// ʹ������������ѯ:
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		// �����ڽ��е�������:
		criteria.addOrder(Order.asc("pdate"));
		// ִ�в�ѯ:
		List<Product> list =(List<Product>)this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}

	@Override
	public Product findByPid(Integer pid) {
		return this.getHibernateTemplate().get(Product.class, pid);
	}
	// ���ݷ���id��ѯ��Ʒ�ĸ���
	@Override
	public int findCountCid(Integer cid) {
		String hql = "select count(*) from Product p where p.categorySecond.category.cid = ?";
		List<Long> list =(List<Long>) this.getHibernateTemplate().find(hql,cid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	// ����һ������id��ѯ��Ʒ�ļ���
	@Override
	public List<Product> findByPageCid(Integer cid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
		// ��ҳ��һ��д��:
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
	// ���ݶ�������id��ѯ��Ʒ����
	@Override
	public int findCountCsid(Integer csid) {
		String hql = "select count(*) from Product p where p.categorySecond.csid = ?";
		List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql, csid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	
	// ���ݶ��������ѯ��Ʒ��Ϣ
	@Override
	public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs where cs.csid = ?";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
	// ��̨ͳ����Ʒ�����ķ���
	@Override
	public int findCount() {
		String hql = "select count(*) from Product";
		List<Long> list =(List<Long>) this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	// ��̨��ѯ������Ʒ�ķ���
	@Override
	public List<Product> findByPage(int begin, int limit) {
		String hql = "from Product order by pdate desc";
		List<Product> list =  this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, null, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
	// DAO�еı�����Ʒ�ķ���
	@Override
	public Integer save(Product product) {
		Serializable id = this.getHibernateTemplate().save(product);
		return (Integer)id;
	}

	@Override
	public void delete(Product product) {
		this.getHibernateTemplate().delete(product);
	}

	@Override
	public void update(Product product) {
		this.getHibernateTemplate().update(product);

	}
//������ʾ
	@Override
	public List<Product> smartTip(String key) {
		String hql="from Product where name like '%"+key+"%'";
		List<Product> list=(List<Product>)this.getHibernateTemplate().find(hql);
		return list;
	}

}
