package hj.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class GroupDao {
	Logger logger = Logger.getLogger(BoardDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//���� ���� ��Ͽ� �ѷ��� �׷�� ��ü��� list
		public List<Map<String, Object>> listSelect() {
			logger.info("listSelect");
			List<Map<String, Object>> bangList = null;
			bangList = sqlSessionTemplate.selectList("groupMapper.listSelect");
			logger.info("bangList:"+bangList);
			return bangList;
		}
		//�˻����ǿ� ���� ����Ʈ ��ȸ
		public List<Map<String, Object>> searchSelect(String value) {
			logger.info("searchSelect");
			List<Map<String, Object>> searchList = null;
			searchList = sqlSessionTemplate.selectList("groupMapper.searchSelect", value);
			logger.info("searchList:"+searchList);
			return searchList;
		}
		//���� �� �з� ���Ϳ� ���� �˻� - ����üũ�� ��� keyword ���� ���� �������ݰ�
		public List<Map<String, Object>> filterSelect(Map<String, Object> pMap) {
			logger.info("filterSelect");
			List<Map<String, Object>> filterList = null;
			filterList = sqlSessionTemplate.selectList("groupMapper.filterSelect", pMap);
			logger.info("filterList:"+filterList);
			return filterList;
		}
		//���� �� ��Ͽ��� �� ���ý� �������� store_no, bang_no ����
		public List<Map<String, Object>> groupSelect(Map<String, Object> pMap) {
			logger.info("groupSelect");
			List<Map<String, Object>> groupInfoList = null;
			groupInfoList = sqlSessionTemplate.selectList("groupMapper.groupSelect", pMap);
			logger.info("groupInfoList:"+groupInfoList);
			return groupInfoList;
		}
		//�� ������ ģ����Ϻ��� ��ư Ŭ���� ������ �� �� bang_no�� ģ������
		public List<Map<String, Object>> friendSelect(String bang_no) {
			logger.info("friendSelect");
			List<Map<String, Object>> friendList = null;
			friendList = sqlSessionTemplate.selectList("groupMapper.friendSelect", bang_no);
			logger.info("friendList:"+friendList);
			return friendList;
		}
		//���ӹ� �������� ��ư ������ input�� �������� �� ����
		public int groupInsert(Map<String, Object> pMap) {
			logger.info("groupInsert");
			int result = 0;
			result = sqlSessionTemplate.insert("groupMapper.groupInsert", pMap);
			logger.info("result: " + result);
			return result;
		}
		//���Ͻ� �ּҵ�� ������ ���� �ּ����� �˻��� keyword ����
		public List<Map<String, Object>> storeSelect(Map<String,Object> pMap) {
			logger.info("storeSelect");
			List<Map<String, Object>> storeList = null;
			storeList = sqlSessionTemplate.selectList("groupMapper.storeSelect", pMap);
			logger.info("storeList:"+storeList);
			return storeList;
		}
		//���� ������ư ������ info�� �μ�Ʈ bang_no, mem_id, mem_memo����
		public int groupAttend(Map<String, Object> pMap) {
			logger.info("groupAttend");
			sqlSessionTemplate.selectOne("groupMapper.groupAttend", pMap);
			int result = 0;		
			result = (int)pMap.get("result");		
			logger.info("result : "+result);
			return result;
		}
		//���� ��ҹ�ư ������ info�� ����Ʈ mem_id����
		public int groupAbsent(String mem_id) {
			logger.info("groupAbsent");
			int result = 0;
			result = sqlSessionTemplate.delete("groupMapper.groupAbsent", mem_id);
			logger.info("result : " + result);
			return result;
		}
		//���ӹ� ������ư(���常) bang_no ����
		public int groupDelete(Map<String, Object> pMap) {
			logger.info("groupDelete");
			sqlSessionTemplate.selectOne("groupMapper.groupDelete", pMap);
			int result = 0;
			result = (int)pMap.get("result");
			logger.info("result : " + result);
			return result;
		}
		//���ӹ� ����(����) ���Լ����� �Ұ� �������� �ٽû��� input���� �� �޾ƿ�
		public int groupUpdate(Map<String, Object> pMap) {
			logger.info("groupUpdate");
			int result = 0;
			result = sqlSessionTemplate.update("groupMapper.groupUpdate", pMap);
			logger.info("result: " + result);
			return result;
		}
}
