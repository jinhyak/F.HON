package hj.dao;

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

		public List<Map<String, Object>> pView(Map<String, Object> pMap) {
			// TODO Auto-generated method stub
			return null;
		}

}
