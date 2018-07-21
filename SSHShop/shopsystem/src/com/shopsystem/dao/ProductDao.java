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
	int findCount();	// 后台统计商品个数的方法
	List<Product> findByPage(int begin, int limit);	// 后台查询所有商品的方法
	Integer save(Product product);
	void delete(Product product);
	void update(Product product);
	List<Product> smartTip(String key);
}
