package com.shopsystem.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shopsystem.domain.Cart;
import com.shopsystem.domain.CartItem;
import com.shopsystem.domain.DDMessage;
import com.shopsystem.domain.DinDan;
import com.shopsystem.domain.PageBean;
import com.shopsystem.domain.User;
import com.shopsystem.serviceImpl.DinDanServiceImpl;
public class DinDanAction extends ActionSupport implements ModelDriven<DinDan>{

	private DinDan dinDan=new DinDan();
	@Override
	public DinDan getModel() {
		// TODO Auto-generated method stub
		return dinDan;
	}
	
	private DinDanServiceImpl dinDanServiceImpl;
	public void setDinDanServiceImpl(DinDanServiceImpl dinDanServiceImpl) {
		this.dinDanServiceImpl = dinDanServiceImpl;
	}
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}
	
	private Integer currentdid;
	
	
	public Integer getCurrentdid() {
		return currentdid;
	}

	public void setCurrentdid(Integer currentdid) {
		this.currentdid = currentdid;
	}

	//��������
	public String saveOrder(){
		
		User user =(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if (user== null){
			this.addActionMessage("��!����û�е�¼!");
			return "msg";
		}
		Cart cart = (Cart) ServletActionContext.getRequest().getSession()
				.getAttribute("cart");
		if (cart == null) {
			this.addActionMessage("��!����û�й���!");
			return "msg";
		}
		dinDan.setOrdertime(new Date());
		dinDan.setAddr(user.getAddr());
		dinDan.setName(user.getName());
		dinDan.setPhone(user.getPhone());
		dinDan.setState(1);
		dinDan.setUser(user);
		dinDan.setTotal(cart.getTotal());
		for (CartItem cartItem : cart.getCartItems()) {
			// ���������Ϣ�ӹ������õ�.
			DDMessage ddMessage =new DDMessage();
			ddMessage.setCount(cartItem.getCount());
			ddMessage.setSubtotal(cartItem.getSubtotal());
			ddMessage.setProduct(cartItem.getProduct());
			ddMessage.setDinDan(dinDan);
			ddMessage.getProduct().setQuantity(ddMessage.getProduct().getQuantity()-cartItem.getCount());
			dinDan.getDdMessages().add(ddMessage);
		}
		 currentdid = dinDanServiceImpl.save(dinDan);
		cart.clearCart();
		return "saveOrder";
		
	}
	
	// ��ѯ�ҵĶ���:
		public String findByUid() {
			// ����û���id.
			User existUser = (User) ServletActionContext.getRequest().getSession()
					.getAttribute("existUser");
			// ����û���id
			Integer uid = existUser.getUid();
			// �����û���id��ѯ����:
			PageBean<DinDan> pageBean = dinDanServiceImpl.findByUid(uid, page);
			// ��PageBean���ݴ���ҳ����.
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByUid";
		}
		// ���ݶ���id��ѯ����:
		public String findByDID() {
			dinDan = dinDanServiceImpl.findByDID(dinDan.getDid());
			return "findByDID";
		}
		// �޸Ķ�����״̬:
		public String updateState(){
			DinDan currOrder = dinDanServiceImpl.findByDID(dinDan.getDid());
			currOrder.setState(dinDan.getState());
			dinDanServiceImpl.update(currOrder);
			currentdid=currOrder.getDid();
			return "updateStateSuccess";
		}
}
