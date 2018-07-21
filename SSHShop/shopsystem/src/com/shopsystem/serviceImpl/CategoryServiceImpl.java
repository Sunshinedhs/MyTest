package com.shopsystem.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.shopsystem.daoImpl.CategoryDaoImpl;
import com.shopsystem.domain.Category;
import com.shopsystem.service.CategoryService;
@Transactional
public class CategoryServiceImpl implements CategoryService{
	
	private CategoryDaoImpl categoryDaoImpl;
	

	
	public void setCategoryDaoImpl(CategoryDaoImpl categoryDaoImpl) {
		this.categoryDaoImpl = categoryDaoImpl;
	}

	// 业务层查询所有一级分类的方法
	@Override
	public List<Category> findAll() {
		return categoryDaoImpl.findAll();
	}

	@Override
	public void save(Category category) {
		categoryDaoImpl.save(category);
	}

	@Override
	public Category findByCid(Integer cid) {
		return categoryDaoImpl.findByCid(cid);
	}

	@Override
	public void delete(Category category) {
		categoryDaoImpl.delete(category);
	}

	@Override
	public void update(Category category) {
		categoryDaoImpl.update(category);
	}

}
