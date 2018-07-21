package com.shopsystem.serviceImpl;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.shopsystem.daoImpl.DinDanDaoImpl;
import com.shopsystem.domain.DDMessage;
import com.shopsystem.domain.DinDan;
import com.shopsystem.domain.PageBean;
@Transactional
public class DinDanServiceImpl {

	private DinDanDaoImpl dinDanDaoImpl;

	public void setDinDanDaoImpl(DinDanDaoImpl dinDanDaoImpl) {
		this.dinDanDaoImpl = dinDanDaoImpl;
	}
		//保存订单
		public Integer save(DinDan dinDan){
			return dinDanDaoImpl.save(dinDan);
		}
		
		//删除订单
		public void delete(Integer did){
			 dinDanDaoImpl.delete(did);
		}
		
		//跟新订单进度
		public void update(DinDan dinDan){
			dinDanDaoImpl.update(dinDan);
		}
		
		//查询全部订单
		public List<DinDan> findAll(int begin, int limit){
			return dinDanDaoImpl.findByPage(begin, limit);
		}
		
		//根据用户id查询订单
		public List<DinDan> findByUID(Integer uid){
			return findByUID(uid);
		}
		
		//根据订单号查询指定订单
		public DinDan findByDID(Integer did){
			return dinDanDaoImpl.findByDID(did);
		}
	
		//查询订单详情
		public List<DDMessage> findDDMessage(Integer did){
			return dinDanDaoImpl.findDDMessage(did);
		}
		// 业务层查询所有订单方法
		public PageBean<DinDan> findAll(Integer page) {
			PageBean<DinDan> pageBean = new PageBean<DinDan>();
			// 设置参数
			pageBean.setPage(page);
			// 设置每页显示的记录数:
			int limit = 10;
			pageBean.setLimit(limit);
			// 设置总记录数
			int totalCount = dinDanDaoImpl.findCount();
			pageBean.setTotalCount(totalCount);
			// 设置总页数
			int totalPage = 0;
			if(totalCount % limit == 0){
				totalPage = totalCount / limit;
			}else{
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// 设置每页显示数据集合
			int begin = (page - 1) * limit;
			List<DinDan> list = dinDanDaoImpl.findByPage(begin,limit);
			pageBean.setList(list);
			return pageBean;
		}
		
		// 业务层根据用户id查询订单,带分页查询.
		public PageBean<DinDan> findByUid(Integer uid,Integer page) {
			PageBean<DinDan> pageBean = new PageBean<DinDan>();
			// 设置当前页数:
			pageBean.setPage(page);
			// 设置每页显示记录数:
			// 显示5个
			int limit = 5;
			pageBean.setLimit(limit);
			// 设置总记录数:
			int totalCount = 0;
			totalCount = dinDanDaoImpl.findCountByUid(uid);
			pageBean.setTotalCount(totalCount);
			// 设置总页数
			int totalPage = 0;
			if(totalCount % limit == 0){
				totalPage = totalCount / limit;
			}else{
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// 设置每页显示数据集合:
			int begin = (page - 1)*limit;
			List<DinDan> list = dinDanDaoImpl.findPageByUid(uid,begin,limit);
			pageBean.setList(list);
			return pageBean;
		}
}
