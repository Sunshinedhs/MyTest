package com.shopsystem.service;

import java.util.List;

import com.shopsystem.domain.PageBean;
import com.shopsystem.domain.Product;



public interface ProductService {
	List<Product> findHot();
	List<Product> findNew();
	Product findByPid(Integer pid);
	PageBean<Product> findByPageCid(Integer cid, int page);
	PageBean<Product> findByPageCsid(Integer csid, int page);
	// 后台查询所有商品带分页
	PageBean<Product> findByPage(Integer page);
	
	Integer save(Product product);
	void delete(Product product);
	void update(Product product);
	List<Product> smartTip(String key);
	
}
