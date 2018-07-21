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

	// ����page����:
		private Integer page;
		// ע�����Service
		private CategorySecondServiceImpl categorySecondServiceImpl;
		// ע��һ�������Service
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
		
		// ���з�ҳ�Ĳ�ѯ���ж�������Ĳ���:
		public String findAll() {
			// ����Service���в�ѯ.
			PageBean<CategorySecond> pageBean = categorySecondServiceImpl
					.findByPage(page);
			// ��pageBean�����ݴ��뵽ֵջ��.
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findAll";
		}

		// ��ת�����ҳ��ķ���:
		public String addPage() {
			// ��ѯ����һ������.
			List<Category> cList = categoryService.findAll();
			// �����ϴ��뵽ֵջ��.
			ActionContext.getContext().getValueStack().set("cList", cList);
			// ҳ����ת:
			return "addPage";
		}

		// ��Ӷ�������ķ���:
		public String save() {
			categorySecondServiceImpl.save(categorySecond);
			List<Category> cList = categoryService.findAll();
			// �����ϴ��뵽ֵջ��.
			ActionContext.getContext().getValueStack().set("cList", cList);
			this.addActionMessage("��Ӷ����ɹ���");
			return "saveSuccess";
		}

		// ɾ����������ķ���:
		public String delete() {
			categorySecondServiceImpl.delete(categorySecond);
			return "deleteSuccess";
		}

		// �༭��������ķ���:
		public String edit() {
			// ����id��ѯ��������:
			categorySecond = categorySecondServiceImpl.findByCsid(categorySecond
					.getCsid());
			// ��ѯ����һ������:
			List<Category> cList = categoryService.findAll();
			// �����ϴ��뵽ֵջ��.
			ActionContext.getContext().getValueStack().set("cList", cList);
			// ҳ����ת:
			return "editSuccess";
		}
		
		// �޸Ķ�������ķ���:
		public String update(){
			categorySecondServiceImpl.update(categorySecond);
			return "updateSuccess";
		}
}
