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
	public List<Map<String, Object>> searchStore8(Map<String, Object> pMap) throws IOException{
		List<Map<String,Object>> list = null;
		logger.info("selectStore8호출 성공");
		list = sqlSessionTemplate.selectList("selectStore8", pMap);
		return list;
	}
}
