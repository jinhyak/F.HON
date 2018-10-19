package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class StoreDao {
	Logger logger = Logger.getLogger(this.getClass());
	
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String, Object>> select(Map<String, Object> pMap) throws IOException {
		List<Map<String, Object>> list = null;
		logger.info(pMap);
		
		return null;
	}

	public int storeAdd(Map<String, Object> pMap) throws IOException {
		int result = 0;
		logger.info(pMap.get("store_name"));
		result = sqlSessionTemplate.insert("storeAdd", pMap);
		logger.info("Dao insertȣ�� ����");
		return result;
	}
	//���� 8���� ����
	public List<Map<String, Object>> searchStore8(Map<String, Object> pMap) throws IOException{
		List<Map<String,Object>> list = null;
		logger.info("selectStore8ȣ�� ����");
		list = sqlSessionTemplate.selectList("selectStore8", pMap);
		return list;
	}
	//��ü ����
	public List<Map<String, Object>> searchStoreAll(Map<String, Object> pMap) throws IOException{
		List<Map<String,Object>> list = null;
		logger.info("selectStoreAllȣ�� ����");
		list = sqlSessionTemplate.selectList("selectStoreAll", pMap);
		return list;
	}
	
	//�󼼺���
	public List<Map<String, Object>> storeDetail(String store_no) {
		List<Map<String,Object>> list = null;
		int result = 0;
		logger.info("storeDetailȣ�� ����");
		result = sqlSessionTemplate.update("storeHitUp", store_no);
		if(result==1) {
		logger.info("��ȸ��+1����");
		list = sqlSessionTemplate.selectList("storeDetail", store_no);
		return list;
		}
		return null;
		
	}
	//���� �ֱ�
	public int stoeSetScore(Map<String, Object> pMap) {
		int result = 0;
		logger.info("storeSetScoreȣ�� ����");
		result = sqlSessionTemplate.update("storeSetScore",pMap);		
		return result;
	}
	//���� Ŭ������ �ѷ��� ���
	public List<Map<String, Object>> store_select(Map<String, Object> pMap) {
		logger.info("store_selectȣ�� ����");
		List<Map<String, Object>> storeList = null;
		storeList = sqlSessionTemplate.selectList("store_select", pMap);
		//logger.info(storeList);
		return storeList;
	}
}
	
