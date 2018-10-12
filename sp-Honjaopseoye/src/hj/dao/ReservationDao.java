package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ReservationDao {
	Logger logger = Logger.getLogger(ReservationDao.class);

	private SqlSessionTemplate sqlSessionTemplate;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//예약조회
	public List<Map<String, Object>> select(Map<String, Object> pMap) {
		logger.info("select 호출 성공");
		List<Map<String, Object>> reservList = null;
		reservList = sqlSessionTemplate.selectList("reservationmap.select", pMap);
		logger.info("reservList:"+reservList);
		return reservList;
	}
	//예약내역조회
	public List<Map<String, Object>> sel_history(Map<String, Object> pMap) {
		logger.info("sel_history 호출 성공");
		List<Map<String, Object>> historyList = null;
		historyList = sqlSessionTemplate.selectList("reservationmap.sel_history", pMap);
		logger.info("historyList:"+historyList);
		return historyList;
	}
	//예약등록
	public int insert(Map<String, Object> pMap) {
		logger.info("insert 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.insert("reservationmap.insert", pMap);
		logger.info("result: " + result);
		return result;
	}
	//예약삭제
	public int delete(Map<String, Object> pMap) {
		logger.info("delete 호출성공");
		int result = 0;
		result = sqlSessionTemplate.delete("reservationmap.delete", pMap);
		logger.info("result : " + result);
		return result;
	}
}
