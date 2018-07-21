package com.shopsystem.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
public class Product {
	
	public Product() {
		super();
	}
	private Integer pid;
	private String name;
	private Double price;
	private Integer quantity;
	private String pic;
	private String info;	//√Ë ˆ
	private Date pdate;
	private Integer hot;
	private CategorySecond categorySecond;
	private Set<MorePic> morePics=new HashSet<MorePic>();
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	

	public Set<MorePic> getMorePics() {
		return morePics;
	}

	public void setMorePics(Set<MorePic> morePics) {
		this.morePics = morePics;
	}
	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public Integer getHot() {
		return hot;
	}
	public void setHot(Integer hot) {
		this.hot = hot;
	}
	
	
	
	
}
