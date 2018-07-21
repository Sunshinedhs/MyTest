package com.shopsystem.action;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shopsystem.domain.MorePic;
import com.shopsystem.domain.PageBean;
import com.shopsystem.domain.Product;
import com.shopsystem.service.CategoryService;
import com.shopsystem.service.ProductService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class ProductAction extends ActionSupport implements ModelDriven<Product>{
	
	private Product product=new Product();
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}
	
	//注入service层
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	// 注入一级分类的Service
		private CategoryService categoryService;
		public void setCategoryService(CategoryService categoryService) {
			this.categoryService = categoryService;
		}
		

	// 接收一级分类id
	private Integer cid;
	// 接收二级分类id
	private Integer csid;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	
	// 接收当前页数:
	private int page;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
	// 根据商品的ID进行查询商品:执行方法:
		public String findByPid() {
			// 调用Service的方法完成查询.
			product = productService.findByPid(product.getPid());
			 Set<MorePic> morePics = product.getMorePics();
			ActionContext.getContext().getValueStack().push(product);
			for (MorePic morePic : morePics) {
				ActionContext.getContext().getValueStack().push(morePic);
			}
			return "findByPid";
		}

		// 根据分类的id查询商品:
		public String findByCid() {
			// List<Category> cList = categoryService.findAll();
			PageBean<Product> pageBean = productService.findByPageCid(cid, page);// 根据一级分类查询商品,带分页查询
			// 将PageBean存入到值栈中:
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByCid";
		}

		// 根据二级分类id查询商品:
		public String findByCsid() {
			// 根据二级分类查询商品
			PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
			// 将PageBean存入到值栈中:
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByCsid";
		}
		
		//模糊搜索
		public String vagueSearch(){
			List<Product> vagueSearch = productService.smartTip(key);
			ActionContext.getContext().getValueStack().set("vagueSearch", vagueSearch);
			return "vagueSearch";
		}
		//智能提示
		
		private String key;
		public void setKey(String key) {
			this.key = key;
		}
		public void smartTip(){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("utf-8");
			JSONArray jj=new JSONArray();
			List<Product> list = productService.smartTip(key);
			for(Product p:list){
				System.err.println(p.getName());
				JSONObject jsb=new JSONObject();
				jsb.put("pid",p.getPid());
				jsb.put("name",p.getName());
				jj.add(jsb);
			}
			try {
				response.getWriter().print(jj);
			} catch (IOException e) {
				System.out.println("**********************action智能提示出错****************************");
				e.printStackTrace();
			}
			
		}
	
}
