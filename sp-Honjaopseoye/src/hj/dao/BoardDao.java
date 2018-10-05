package hj.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;


public class BoardDao{
		Logger logger = Logger.getLogger(BoardDao.class);
		
		private SqlSessionTemplate sqlSessionTemplate;

		public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
		}
		
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 포스팅 상세보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
		public List<Map<String, Object>> pView(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			
			return null;
		}
		
/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 포스팅 상세보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
		public int delete(Map<String, Object> pMap) {
			logger.info("delete 호출성공");
			int result = 0;
			result = sqlSessionTemplate.delete("delete", pMap);
			logger.info("result : " + result);
			return result;
		}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 포스팅 하기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
		public List<Map<String, Object>> pInsert(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			return null;
		}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 포스트 리스트보기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
		public List<Map<String, Object>> postList(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			logger.info("postList 호출성공");
			List<Map<String, Object>> postList = null;
			postList = sqlSessionTemplate.selectList("postList", pMap);
			logger.info("result : " + postList);
			return postList;
		}

}
