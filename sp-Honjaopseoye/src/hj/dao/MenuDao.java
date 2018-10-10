package hj.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class MenuDao {
	Logger logger = Logger.getLogger(MenuDao.class);

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ 관리자 공지사항 ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	
	public List<Map<String, Object>> nSelect(Map<String, Object> pMap) {
		logger.info("nSelect 호출 성공");
		List<Map<String, Object>> nList = new ArrayList<Map<String, Object>>();
		nList = sqlSessionTemplate.selectList("nSelect", pMap);
		logger.info("nSelect: " + nList);
		return nList;
	}

/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ 문의하기 게시판 ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public List<Map<String, Object>> qSelect(Map<String, Object> pMap) {
		logger.info("qSelect 호출 성공");
		List<Map<String, Object>> qList = new ArrayList<Map<String, Object>>();
		qList = sqlSessionTemplate.selectList("qSelect", pMap);
		logger.info("qSelect: " + qList);
		return qList;
	}

/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ 문의하기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public int qInsert(Map<String, Object> pMap) {
		logger.info("qInsert 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.insert("qInsert", pMap);
		if (result == 1) {
			sqlSessionTemplate.commit();
			logger.info("qInsert: " + result);
		}
		return result;
	}

/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ 공지사항 글쓰기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public int nInsert(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("nInsert 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.insert("nInsert", pMap);
		if (result == 1) {
			sqlSessionTemplate.commit();
			logger.info("nInsert: " + result);
		}
		return result;
	}
	
/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ 계층형 게시글 ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public int step(String pMap) {
		logger.info("step Update");
		int result = 0;
		result = sqlSessionTemplate.update(pMap);
		sqlSessionTemplate.commit();
		return result;	
	}

	public int getGroup(Map<String, Object> pMap) {
		logger.info("group Select");
		int gno = 0;
		gno = sqlSessionTemplate.selectOne("getGroup");
		return gno;
	}

}
