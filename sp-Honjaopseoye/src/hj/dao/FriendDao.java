package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class FriendDao{
	Logger logger = Logger.getLogger(FriendDao.class);
	private SqlSessionTemplate sqlSessionTemplate;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	//郴 模备 格废 炼雀 
	public List<Map<String, Object>> fri_select(Map<String, Object> pMap) throws IOException {
		List<Map<String, Object>> list = null;
		list = sqlSessionTemplate.selectList("fri_select",pMap);
		logger.info(list);
		return list;
	}
	//模备 八祸
	public List<Map<String, Object>> fri_search(Map<String, Object> pMap) throws IOException {
		List<Map<String, Object>> list = null;
		list = sqlSessionTemplate.selectList("fri_search",pMap);
		logger.info(list);
		return list;
	}
	//模备 眠啊
	public int insert(Map<String, Object> pMap) throws IOException {
		int result = 0;
		result = sqlSessionTemplate.insert("fri_add", pMap);
		result = sqlSessionTemplate.insert("friadd", pMap);
		logger.info(result);
		return result;
	}
	//模备 昏力
	public int delete(Map<String, Object> pMap) throws IOException {
		int result = 0;
		result = sqlSessionTemplate.delete("fri_del", pMap);
		logger.info(result);
		return result;
	}

}
