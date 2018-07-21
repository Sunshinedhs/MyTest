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
	
	// ����page����
		private Integer page;

		public void setPage(Integer page) {
			this.page = page;
		}

		// ע��ProductService
		private ProductService productService;

		public void setProductService(ProductService productService) {
			this.productService = productService;
		}

		// ע��CategorySecondService
		private CategorySecondServiceImpl categorySecondServiceImpl;
		
		public void setCategorySecondServiceImpl(CategorySecondServiceImpl categorySecondServiceImpl) {
			this.categorySecondServiceImpl = categorySecondServiceImpl;
		}

		//ע��morepic
		private MorePicServiceImpl morePicServiceImpl;

		public void setMorePicServiceImpl(MorePicServiceImpl morePicServiceImpl) {
			this.morePicServiceImpl = morePicServiceImpl;
		}

		// �ļ��ϴ���Ҫ����������:
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

		// ��ѯ���е���Ʒ:
		public String findAll() {
			PageBean<Product> pageBean = productService.findByPage(page);
			// ��PageBean���ݴ��뵽ֵջ��.
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			// ҳ����ת
			return "findAll";
		}

		// ��ת�����ҳ��ķ���:
		public String addPage() {
			// ��ѯ���еĶ�������:
			List<CategorySecond> csList =categorySecondServiceImpl.findAll();
			// �����������������ʾ��ҳ����
			ActionContext.getContext().getValueStack().set("csList", csList);
			// ҳ����ת
			return "addPageSuccess";
		}

		// ������Ʒ�ķ���:
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
			// ���ύ��������ӵ����ݿ���.
			morePic.setProduct(product);
			morePicServiceImpl.add(morePic);
			product.getMorePics().add(morePic);
			product.setPdate(new Date());
			productService.save(product);
			return "saveSuccess";
		}

		// ɾ����Ʒ�ķ���:
		public void delete() {
			// ����id��ѯ��Ʒ��Ϣ
			product = productService.findByPid(product.getPid());
			// ɾ����Ʒ��ͼƬ:
			String path = ServletActionContext.getServletContext().getRealPath(
					"/" + product.getPic());
			File file = new File(path);
			file.delete();
			// ɾ�����ݿ�����Ʒ��¼:
			productService.delete(product);
		}

		// �༭��Ʒ�ķ���
		public String edit() {
			// ������Ʒid��ѯ��Ʒ��Ϣ
			product = productService.findByPid(product.getPid());
			// ��ѯ���ж�������
			List<CategorySecond> csList = categorySecondServiceImpl.findAll();
			ActionContext.getContext().getValueStack().set("csList", csList);
			// ҳ����ת���༭ҳ��:
			return "editSuccess";
		}

		// �޸���Ʒ�ķ���
		public String update() throws IOException {
			System.err.println("**************����*************");
			// ����Ϣ�޸ĵ����ݿ�
			product.setPdate(new Date());
			
			productService.update(product);
			// ҳ����ת
			return "updateSuccess";
		}

}
