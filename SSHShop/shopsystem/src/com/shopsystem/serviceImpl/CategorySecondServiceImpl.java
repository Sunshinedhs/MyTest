package com.shopsystem.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.daoImpl.CategorySecondDaoImpl;
import com.shopsystem.domain.CategorySecond;
import com.shopsystem.domain.PageBean;
@Transactional
public class CategorySecondServiceImpl {
	// ע��Dao
		private CategorySecondDaoImpl categorySecondDaoImpl;
		public void setCategorySecondDaoImpl(CategorySecondDaoImpl categorySecondDaoImpl) {
			this.categorySecondDaoImpl = categorySecondDaoImpl;
		}

		// ����������з�ҳ�Ĳ�ѯ����:
		public PageBean<CategorySecond> findByPage(Integer page) {
			PageBean<CategorySecond> pageBean = new PageBean<CategorySecond>();

			// ���ò���:
			pageBean.setPage(page);
			// ����ÿҳ��ʾ��¼��:
			int limit = 10;
			pageBean.setLimit(limit);
			// �����ܼ�¼��:
			int totalCount = categorySecondDaoImpl.findCount();
			pageBean.setTotalCount(totalCount);
			// ������ҳ��:
			int totalPage = 0;
			if (totalCount % limit == 0) {
				totalPage = totalCount / limit;
			} else {
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// ����ҳ����ʾ���ݵļ���:
			int begin = (page - 1) * limit;
			List<CategorySecond> list = categorySecondDaoImpl.findByPage(begin,limit);
			pageBean.setList(list);
			return pageBean;
		}

		// ҵ���ı����������Ĳ���
		public void save(CategorySecond categorySecond) {
			categorySecondDaoImpl.save(categorySecond);
		}

		// ҵ����ɾ����������Ĳ���
		public void delete(CategorySecond categorySecond) {
			categorySecondDaoImpl.delete(categorySecond);
		}

		// ҵ������id��ѯ��������
		public CategorySecond findByCsid(Integer csid) {
			return categorySecondDaoImpl.findByCsid(csid);
		}

		// ҵ����޸Ķ�������ķ���
		public void update(CategorySecond categorySecond) {
			categorySecondDaoImpl.update(categorySecond);
		}

		// ҵ����ѯ���ж�������(������ҳ)
		public List<CategorySecond> findAll() {
			return categorySecondDaoImpl.findAll();
		}
}
