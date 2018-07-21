package com.shopsystem.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shopsystem.domain.CategorySecond;
import com.shopsystem.domain.MorePic;
import com.shopsystem.domain.PageBean;
import com.shopsystem.domain.Product;
import com.shopsystem.service.ProductService;
import com.shopsystem.serviceImpl.CategorySecondServiceImpl;
import com.shopsystem.serviceImpl.MorePicServiceImpl;

public class AdminProductAction extends ActionSupport implements ModelDriven<Product>{
	private Product product = new Product();
	
	@Override
	public Product getModel() {
		return product;
	}
	
	// 接收page参数
		private Integer page;

		public void setPage(Integer page) {
			this.page = page;
		}

		// 注入ProductService
		private ProductService productService;

		public void setProductService(ProductService productService) {
			this.productService = productService;
		}

		// 注入CategorySecondService
		private CategorySecondServiceImpl categorySecondServiceImpl;
		
		public void setCategorySecondServiceImpl(CategorySecondServiceImpl categorySecondServiceImpl) {
			this.categorySecondServiceImpl = categorySecondServiceImpl;
		}

		//注入morepic
		private MorePicServiceImpl morePicServiceImpl;

		public void setMorePicServiceImpl(MorePicServiceImpl morePicServiceImpl) {
			this.morePicServiceImpl = morePicServiceImpl;
		}

		// 文件上传需要的三个属性:
		private File[] upload;
		private String[] uploadFileName;
		private String[] uploadContentType;

		

		public void setUpload(File[] upload) {
			this.upload = upload;
		}

		public void setUploadFileName(String[] uploadFileName) {
			this.uploadFileName = uploadFileName;
		}

		public void setUploadContentType(String[] uploadContentType) {
			this.uploadContentType = uploadContentType;
		}

		// 查询所有的商品:
		public String findAll() {
			PageBean<Product> pageBean = productService.findByPage(page);
			// 将PageBean数据存入到值栈中.
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			// 页面跳转
			return "findAll";
		}

		// 跳转到添加页面的方法:
		public String addPage() {
			// 查询所有的二级分类:
			List<CategorySecond> csList =categorySecondServiceImpl.findAll();
			// 将二级分类的数据显示到页面上
			ActionContext.getContext().getValueStack().set("csList", csList);
			// 页面跳转
			return "addPageSuccess";
		}

		// 保存商品的方法:
		public String save() throws IOException {
			String path = ServletActionContext.getServletContext().getRealPath("/products");
			//String path="D:\\work sapcedai\\shopsystem\\WebContent\\products";
			System.err.println(path);
			MorePic morePic =new MorePic();
			for (int i = 0; i < upload.length; i++) {
				String ext = uploadContentType[i].substring(6);
				String name = System.currentTimeMillis() + product.getName()+i + "." + ext;
				File file = new File(new File(path), name);
				if (!file.getParentFile().exists()) {
					file.mkdir();
				}
				try {
					FileUtil.copyFile(upload[i], file);
					if(i==0){
						product.setPic("products/"+name);
						
					}else if(i==2){
						morePic .setPath1("products/"+name);
						
					}else if(i==3){
						morePic.setPath2("products/"+name);
					}else {
						morePic.setPath3("products/"+name);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			// 将提交的数据添加到数据库中.
			morePic.setProduct(product);
			morePicServiceImpl.add(morePic);
			product.getMorePics().add(morePic);
			product.setPdate(new Date());
			productService.save(product);
			return "saveSuccess";
		}

		// 删除商品的方法:
		public void delete() {
			// 根据id查询商品信息
			product = productService.findByPid(product.getPid());
			// 删除商品的图片:
			String path = ServletActionContext.getServletContext().getRealPath(
					"/" + product.getPic());
			File file = new File(path);
			file.delete();
			// 删除数据库中商品记录:
			productService.delete(product);
		}

		// 编辑商品的方法
		public String edit() {
			// 根据商品id查询商品信息
			product = productService.findByPid(product.getPid());
			// 查询所有二级分类
			List<CategorySecond> csList = categorySecondServiceImpl.findAll();
			ActionContext.getContext().getValueStack().set("csList", csList);
			// 页面跳转到编辑页面:
			return "editSuccess";
		}

		// 修改商品的方法
		public String update() throws IOException {
			System.err.println("**************运行*************");
			// 将信息修改到数据库
			product.setPdate(new Date());
			
			productService.update(product);
			// 页面跳转
			return "updateSuccess";
		}

}
