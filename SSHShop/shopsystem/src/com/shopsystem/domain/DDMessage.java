package com.shopsystem.domain;
/**
 * 订单详情
 * @author 代红帅
 *
 */
public class DDMessage {
	private Integer dmid;
	private Integer count;
	private Double subtotal;
	// 商品外键:对象
	private Product product;
	// 订单外键:对象
	private DinDan dinDan;
	
	public Integer getDmid() {
		return dmid;
	}
	public void setDmid(Integer dmid) {
		this.dmid = dmid;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public DinDan getDinDan() {
		return dinDan;
	}
	public void setDinDan(DinDan dinDan) {
		this.dinDan = dinDan;
	}
	
}
