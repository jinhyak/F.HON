package hj.logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import hj.dao.BoardDao;
import hj.dao.MemberDao;

@Service
public class BoardLogic {
	Logger logger = Logger.getLogger(BoardLogic.class);
	
	@Autowired
	private BoardDao boardDao = null;
	
	public List<Map<String, Object>> postList(Map<String, Object> pMap, HttpServletResponse res) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> postList = null;
		logger.info("postList 메소드 호출");
		
		/*if("GRADE_LEVEL".equals("admin")) {
			pMap.put("manager", );
			postList = boardDao.postList(pMap);
		} else {}
		*/
		postList = boardDao.postList(pMap);
		return postList;
	}

}
