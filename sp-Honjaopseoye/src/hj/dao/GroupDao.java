package hj.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class GroupDao {
	Logger logger = Logger.getLogger(BoardDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
}
