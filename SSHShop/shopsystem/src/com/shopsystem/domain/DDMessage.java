package com.shopsystem.domain;
/**
 * ��������
 * @author ����˧
 *
 */
public class DDMessage {
	private Integer dmid;
	private Integer count;
	private Double subtotal;
	// ��Ʒ���:����
	private Product product;
	// �������:����
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
