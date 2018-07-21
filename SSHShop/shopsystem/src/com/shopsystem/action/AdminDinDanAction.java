package com.shopsystem.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shopsystem.domain.DDMessage;
import com.shopsystem.domain.DinDan;
import com.shopsystem.domain.PageBean;
import com.shopsystem.serviceImpl.DinDanServiceImpl;

public class AdminDinDanAction extends ActionSupport implements ModelDriven<DinDan>{
	private DinDan dinDan =new DinDan();

	@Override
	public DinDan getModel() {
		
		return dinDan;
	}
	
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	
	public Integer getPage() {
		return page;
	}

	//注入订单service
	private DinDanServiceImpl dinDanServiceImpl;
	public void setDinDanServiceImpl(DinDanServiceImpl dinDanServiceImpl) {
		this.dinDanServiceImpl = dinDanServiceImpl;
	}

	// 提供后台查询所有订单的方法:
		public String findAll() {
			// 订单的分页查询
			PageBean<DinDan> pageBean = dinDanServiceImpl.findAll(page);
			// 将数据存入到值栈中保存到页面
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			// 页面跳转:
			return "findAll";
		}

		// 修改订单状态
		public String updateState() {
			// 根据id查询订单
			DinDan currOrder = dinDanServiceImpl.findByDID(dinDan.getDid());
			currOrder.setState(3);
			dinDanServiceImpl.update(currOrder);
			// 页面跳转
			return "updateStateSuccess";
		}

		// 根据订单的id查询订单项:
		public String findDDMessage() {
			// 根据订单id查询订单项:
			List<DDMessage> list = dinDanServiceImpl.findDDMessage(dinDan.getDid());
			// 显示到页面:
			ActionContext.getContext().getValueStack().set("list", list);
			// 页面跳转
			return "findDDMessageSuccess";
		}

	
}
