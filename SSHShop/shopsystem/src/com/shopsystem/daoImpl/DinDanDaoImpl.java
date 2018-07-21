package com.shopsystem.daoImpl;

import java.io.Serializable;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;
import com.shopsystem.domain.DDMessage;
import com.shopsystem.domain.DinDan;
import com.shopsystem.domain.PageHibernateCallback;
@Transactional
public class DinDanDaoImpl extends HibernateDaoSupport {
	//���涩��
	public Integer save(DinDan dinDan){
		Serializable did = this.getHibernateTemplate().save(dinDan);
		return (Integer)did;
	}
	
	//ɾ������
	public void delete(Integer did){
		DinDan findByDID = this.findByDID(did);
		if(findByDID!=null){
			this.getHibernateTemplate().delete(findByDID);
		}
	}
	
	//���¶�������
	public void update(DinDan dinDan){
		this.getHibernateTemplate().update(dinDan);
	}
	
	//��ѯȫ������
	public List<DinDan> findByPage(int begin, int limit){
		String hql="from DinDan order by ordertime desc";
		List<DinDan> allDinDan = this.getHibernateTemplate().execute(new PageHibernateCallback<DinDan>(hql, null, begin, limit));
		return allDinDan;
	}
	
	//�����û�id��ѯ����
	public List<DinDan> findByUID(Integer uid){
		DetachedCriteria criteria = DetachedCriteria.forClass(DinDan.class);
		criteria.add(Restrictions.eq("user.uid", uid));
		List<DinDan> findByUid =(List<DinDan>) this.getHibernateTemplate().findByCriteria(criteria);
		/*
		String hql = "select d from DinDan d where d.user.uid = ?";
		List<DinDan> finByUid = this.getHibernateTemplate().find(hql, uid);
		*/
		return findByUid;
	}
	
	//���ݶ����Ų�ѯָ������
	public DinDan findByDID(Integer did){
		/*DetachedCriteria criteria = DetachedCriteria.forClass(DinDan.class);
		criteria.add(Restrictions.eq("did", did));
		List<?> findByCriteria = this.getHibernateTemplate().findByCriteria(criteria);
		*/
		return this.getHibernateTemplate().get(DinDan.class,did);
	}
	// Dao���ѯ�ҵĶ�����ҳ��ѯ:ͳ�Ƹ���
		public int findCountByUid(Integer uid) {
			String hql = "select count(*) from DinDan d where d.user.uid = ?";
			List<Long> list =(List<Long>)this.getHibernateTemplate().find(hql, uid);
			if (list != null && list.size() > 0) {
				return list.get(0).intValue();
			}
			return 0;
		}
		
		// Dao���ѯ�ҵĶ�����ҳ��ѯ:��ѯ����
		public List<DinDan> findPageByUid(Integer uid, int begin, int limit) {
			String hql = "from DinDan d where d.user.uid = ? order by d.ordertime desc";
			List<DinDan> list = this.getHibernateTemplate().execute(
					new PageHibernateCallback<DinDan>(hql, new Object[] { uid },
							begin, limit));
			if (list != null && list.size() > 0) {
				return list;
			}
			return null;
		}
		
		// DAO��ͳ�ƶ��������ķ���
		public int findCount() {
			String hql = "select count(*) from DinDan";
			List<Long> list =(List<Long>) this.getHibernateTemplate().find(hql);
			if (list != null && list.size() > 0) {
				return list.get(0).intValue();
			}
			return 0;
		}
		// ���ݶ���id��ѯ��������
		public List<DDMessage> findDDMessage(Integer did) {
			String hql = "from DDMessage dd where dd.dinDan.did = ?";
			List<DDMessage> list =(List<DDMessage>)this.getHibernateTemplate().find(hql, did);
			if (list != null && list.size() > 0) {
				return list;
			}
			return null;
		}
}
