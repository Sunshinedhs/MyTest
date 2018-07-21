package com.shopsystem.domain;

public class MorePic {
	
	public MorePic() {
		super();
		
	}
	private Integer mid;
	private String path1;
	private String path2;
	private String path3;
	private Product product=new Product();
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getPath1() {
		return path1;
	}
	public void setPath1(String path1) {
		this.path1 = path1;
	}
	public String getPath2() {
		return path2;
	}
	public void setPath2(String path2) {
		this.path2 = path2;
	}
	public String getPath3() {
		return path3;
	}
	public void setPath3(String path3) {
		this.path3 = path3;
	}
	
}
