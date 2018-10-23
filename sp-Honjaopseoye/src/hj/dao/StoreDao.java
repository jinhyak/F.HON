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
		logger.info("Dao insert호출 성공");
		return result;
	}
	//핫플 8개만 보기
	public List<Map<String, Object>> searchStore8(Map<String, Object> pMap) throws IOException{
		List<Map<String,Object>> list = null;
		logger.info("selectStore8호출 성공");
		list = sqlSessionTemplate.selectList("selectStore8", pMap);
		return list;
	}
	//전체 보기
	public List<Map<String, Object>> searchStoreAll(Map<String, Object> pMap) throws IOException{
		List<Map<String,Object>> list = null;
		logger.info("selectStoreAll호출 성공");
		list = sqlSessionTemplate.selectList("selectStoreAll", pMap);
		return list;
	}
	//별점순 보기
	public List<Map<String, Object>> searchStoreAllStar(Map<String, Object> pMap) throws IOException{
		List<Map<String,Object>> list = null;
		logger.info("selectStoreAll호출 성공");
		list = sqlSessionTemplate.selectList("selectStoreAllStar", pMap);
		return list;
	}
	
	//상세보기
	public List<Map<String, Object>> storeDetail(String store_no) {
		List<Map<String,Object>> list = null;
		int result = 0;
		logger.info("storeDetail호출 성공");
		result = sqlSessionTemplate.update("storeHitUp", store_no);
		if(result==1) {
		logger.info("조회수+1성공");
		list = sqlSessionTemplate.selectList("storeDetail", store_no);
		return list;
		}
		return null;
		
	}
	//별점 주기
	public int stoeSetScore(Map<String, Object> pMap) {
		int result = 0;
		logger.info("storeSetScore호출 성공");
		result = sqlSessionTemplate.update("storeSetScore",pMap);		
		return result;
	}
	
	//지도 클러스터 뿌려질 목록
	   public List<Map<String, Object>> store_select(Map<String, Object> pMap) {
	      logger.info("store_select호출 성공");
	      List<Map<String, Object>> storeList = null;
	      storeList = sqlSessionTemplate.selectList("store_select", pMap);
	      //logger.info(storeList);
	      return storeList;
	   }
}
	
