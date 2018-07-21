package com.shopsystem.action;

import java.util.List;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shopsystem.domain.Category;
import com.shopsystem.domain.CategorySecond;
import com.shopsystem.domain.PageBean;
import com.shopsystem.service.CategoryService;
import com.shopsystem.serviceImpl.CategorySecondServiceImpl;



public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
	
	private CategorySecond categorySecond=new CategorySecond();

	@Override
	public CategorySecond getModel() {
		// TODO Auto-generated method stub
		return categorySecond;
	}

	// 接收page参数:
		private Integer page;
		// 注入二级Service
		private CategorySecondServiceImpl categorySecondServiceImpl;
		// 注入一级分类的Service
		private CategoryService categoryService;

		public void setPage(Integer page) {
			this.page = page;
		}
		public void setCategorySecondServiceImpl(CategorySecondServiceImpl categorySecondServiceImpl) {
			this.categorySecondServiceImpl = categorySecondServiceImpl;
		}
		public void setCategoryService(CategoryService categoryService) {
			this.categoryService = categoryService;
		}
		
		// 带有分页的查询所有二级分类的操作:
		public String findAll() {
			// 调用Service进行查询.
			PageBean<CategorySecond> pageBean = categorySecondServiceImpl
					.findByPage(page);
			// 将pageBean的数据存入到值栈中.
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findAll";
		}

		// 跳转到添加页面的方法:
		public String addPage() {
			// 查询所有一级分类.
			List<Category> cList = categoryService.findAll();
			// 将集合存入到值栈中.
			ActionContext.getContext().getValueStack().set("cList", cList);
			// 页面跳转:
			return "addPage";
		}

		// 添加二级分类的方法:
		public String save() {
			categorySecondServiceImpl.save(categorySecond);
			List<Category> cList = categoryService.findAll();
			// 将集合存入到值栈中.
			ActionContext.getContext().getValueStack().set("cList", cList);
			this.addActionMessage("添加二级成功！");
			return "saveSuccess";
		}

		// 删除二级分类的方法:
		public String delete() {
			categorySecondServiceImpl.delete(categorySecond);
			return "deleteSuccess";
		}

		// 编辑二级分类的方法:
		public String edit() {
			// 根据id查询二级分类:
			categorySecond = categorySecondServiceImpl.findByCsid(categorySecond
					.getCsid());
			// 查询所有一级分类:
			List<Category> cList = categoryService.findAll();
			// 将集合存入到值栈中.
			ActionContext.getContext().getValueStack().set("cList", cList);
			// 页面跳转:
			return "editSuccess";
		}
		
		// 修改二级分类的方法:
		public String update(){
			categorySecondServiceImpl.update(categorySecond);
			return "updateSuccess";
		}
}
