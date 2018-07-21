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
		// 接收pid
		private Integer pid;
		// 接收数量count
		private Integer count;
		
		private ProductService productService;
		
		public void addCart() {
			// 封装一个CartItem对象.
			CartItem cartItem = new CartItem();
			// 设置数量:
			cartItem.setCount(count);
			// 根据pid进行查询商品:
			Product product = productService.findByPid(pid);
			// 设置商品:
			cartItem.setProduct(product);
			// 将购物项添加到购物车.
			// 购物车应该存在session中.
			Cart cart = getCart();
			cart.addCart(cartItem);
			try {
				ServletActionContext.getResponse().getWriter().print("1");
			} catch (IOException e) {
				System.err.println(e.getMessage());
			}
		}
		// 清空购物车的执行的方法:
		public String clearCart(){
			System.err.println("**************运行***********");
			// 获得购物车对象.
			Cart cart = getCart();
			// 调用购物车中清空方法.
			cart.clearCart();
			return "clearok";
		}
		// 从购物车中移除购物项的方法:
		public String removeCart(){
			// 获得购物车对象
			Cart cart = getCart();
			// 调用购物车中移除的方法:
			cart.removeCart(pid);
			// 返回页面:
			return "removeCart";
		}
		
		// 我的购物车:执行的方法
		public String myCart(){
			return "myCart";
		}
		/**
		 * 获得购物车的方法:从session中获得购物车.
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
