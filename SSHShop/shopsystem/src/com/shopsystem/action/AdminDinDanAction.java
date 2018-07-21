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

	//ע�붩��service
	private DinDanServiceImpl dinDanServiceImpl;
	public void setDinDanServiceImpl(DinDanServiceImpl dinDanServiceImpl) {
		this.dinDanServiceImpl = dinDanServiceImpl;
	}

	// �ṩ��̨��ѯ���ж����ķ���:
		public String findAll() {
			// �����ķ�ҳ��ѯ
			PageBean<DinDan> pageBean = dinDanServiceImpl.findAll(page);
			// �����ݴ��뵽ֵջ�б��浽ҳ��
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			// ҳ����ת:
			return "findAll";
		}

		// �޸Ķ���״̬
		public String updateState() {
			// ����id��ѯ����
			DinDan currOrder = dinDanServiceImpl.findByDID(dinDan.getDid());
			currOrder.setState(3);
			dinDanServiceImpl.update(currOrder);
			// ҳ����ת
			return "updateStateSuccess";
		}

		// ���ݶ�����id��ѯ������:
		public String findDDMessage() {
			// ���ݶ���id��ѯ������:
			List<DDMessage> list = dinDanServiceImpl.findDDMessage(dinDan.getDid());
			// ��ʾ��ҳ��:
			ActionContext.getContext().getValueStack().set("list", list);
			// ҳ����ת
			return "findDDMessageSuccess";
		}

	
}
