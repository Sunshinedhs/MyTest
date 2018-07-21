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
		//���涩��
		public Integer save(DinDan dinDan){
			return dinDanDaoImpl.save(dinDan);
		}
		
		//ɾ������
		public void delete(Integer did){
			 dinDanDaoImpl.delete(did);
		}
		
		//���¶�������
		public void update(DinDan dinDan){
			dinDanDaoImpl.update(dinDan);
		}
		
		//��ѯȫ������
		public List<DinDan> findAll(int begin, int limit){
			return dinDanDaoImpl.findByPage(begin, limit);
		}
		
		//�����û�id��ѯ����
		public List<DinDan> findByUID(Integer uid){
			return findByUID(uid);
		}
		
		//���ݶ����Ų�ѯָ������
		public DinDan findByDID(Integer did){
			return dinDanDaoImpl.findByDID(did);
		}
	
		//��ѯ��������
		public List<DDMessage> findDDMessage(Integer did){
			return dinDanDaoImpl.findDDMessage(did);
		}
		// ҵ����ѯ���ж�������
		public PageBean<DinDan> findAll(Integer page) {
			PageBean<DinDan> pageBean = new PageBean<DinDan>();
			// ���ò���
			pageBean.setPage(page);
			// ����ÿҳ��ʾ�ļ�¼��:
			int limit = 10;
			pageBean.setLimit(limit);
			// �����ܼ�¼��
			int totalCount = dinDanDaoImpl.findCount();
			pageBean.setTotalCount(totalCount);
			// ������ҳ��
			int totalPage = 0;
			if(totalCount % limit == 0){
				totalPage = totalCount / limit;
			}else{
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// ����ÿҳ��ʾ���ݼ���
			int begin = (page - 1) * limit;
			List<DinDan> list = dinDanDaoImpl.findByPage(begin,limit);
			pageBean.setList(list);
			return pageBean;
		}
		
		// ҵ�������û�id��ѯ����,����ҳ��ѯ.
		public PageBean<DinDan> findByUid(Integer uid,Integer page) {
			PageBean<DinDan> pageBean = new PageBean<DinDan>();
			// ���õ�ǰҳ��:
			pageBean.setPage(page);
			// ����ÿҳ��ʾ��¼��:
			// ��ʾ5��
			int limit = 5;
			pageBean.setLimit(limit);
			// �����ܼ�¼��:
			int totalCount = 0;
			totalCount = dinDanDaoImpl.findCountByUid(uid);
			pageBean.setTotalCount(totalCount);
			// ������ҳ��
			int totalPage = 0;
			if(totalCount % limit == 0){
				totalPage = totalCount / limit;
			}else{
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// ����ÿҳ��ʾ���ݼ���:
			int begin = (page - 1)*limit;
			List<DinDan> list = dinDanDaoImpl.findPageByUid(uid,begin,limit);
			pageBean.setList(list);
			return pageBean;
		}
}
