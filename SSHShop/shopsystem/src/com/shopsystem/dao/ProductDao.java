package com.shopsystem.dao;

import java.util.List;

import com.shopsystem.domain.Product;


public interface ProductDao {
	List<Product> findHot();
	List<Product> findNew();
	Product findByPid(Integer pid);
	int findCountCid(Integer cid);
	List<Product> findByPageCid(Integer cid, int begin, int limit);
	int findCountCsid(Integer csid);
	List<Product> findByPageCsid(Integer csid, int begin, int limit);
	int findCount();	// ��̨ͳ����Ʒ�����ķ���
	List<Product> findByPage(int begin, int limit);	// ��̨��ѯ������Ʒ�ķ���
	Integer save(Product product);
	void delete(Product product);
	void update(Product product);
	List<Product> smartTip(String key);
}
