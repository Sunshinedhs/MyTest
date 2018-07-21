package com.shopsystem.action;

import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.ActionMessage;

import com.opensymphony.xwork2.ActionSupport;
import com.shopsystem.domain.Cart;
import com.shopsystem.domain.CartItem;
import com.shopsystem.domain.Product;
import com.shopsystem.service.ProductService;

public class CartAction extends ActionSupport{
		// ����pid
		private Integer pid;
		// ��������count
		private Integer count;
		
		private ProductService productService;
		
		public void addCart() {
			// ��װһ��CartItem����.
			CartItem cartItem = new CartItem();
			// ��������:
			cartItem.setCount(count);
			// ����pid���в�ѯ��Ʒ:
			Product product = productService.findByPid(pid);
			// ������Ʒ:
			cartItem.setProduct(product);
			// ����������ӵ����ﳵ.
			// ���ﳵӦ�ô���session��.
			Cart cart = getCart();
			cart.addCart(cartItem);
			try {
				ServletActionContext.getResponse().getWriter().print("1");
			} catch (IOException e) {
				System.err.println(e.getMessage());
			}
		}
		// ��չ��ﳵ��ִ�еķ���:
		public String clearCart(){
			System.err.println("**************����***********");
			// ��ù��ﳵ����.
			Cart cart = getCart();
			// ���ù��ﳵ����շ���.
			cart.clearCart();
			return "clearok";
		}
		// �ӹ��ﳵ���Ƴ�������ķ���:
		public String removeCart(){
			// ��ù��ﳵ����
			Cart cart = getCart();
			// ���ù��ﳵ���Ƴ��ķ���:
			cart.removeCart(pid);
			// ����ҳ��:
			return "removeCart";
		}
		
		// �ҵĹ��ﳵ:ִ�еķ���
		public String myCart(){
			return "myCart";
		}
		/**
		 * ��ù��ﳵ�ķ���:��session�л�ù��ﳵ.
		 * @return
		 */
		private Cart getCart() {
			Cart cart = (Cart) ServletActionContext.getRequest().getSession()
					.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
				ServletActionContext.getRequest().getSession()
						.setAttribute("cart", cart);
			}
			return cart;
		}
		
		
		public void setProductService(ProductService productService) {
			this.productService = productService;
		}
		public Integer getPid() {
			return pid;
		}
		public void setPid(Integer pid) {
			this.pid = pid;
		}
		public Integer getCount() {
			return count;
		}
		public void setCount(Integer count) {
			this.count = count;
		}
		
}
