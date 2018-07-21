package com.shopsystem.service;

import java.util.List;

import com.shopsystem.domain.Category;

public interface CategoryService {
	List<Category> findAll();
	void save(Category category);
	Category findByCid(Integer cid);
	void delete(Category category);
	void update(Category category);
}
