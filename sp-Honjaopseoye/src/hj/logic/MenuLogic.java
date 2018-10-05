package hj.logic;

import java.util.List;
import java.util.Map;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.MenuDao;

@Service
public class MenuLogic {
	Logger logger = Logger.getLogger(MenuLogic.class);

	@Autowired
	private MenuDao menuDao = null;

	public List<Map<String, Object>> qSelect(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("qSelect 경유");
		List<Map<String, Object>> list = null;
		list = menuDao.qSelect(pMap);
		return list;
	}

	/*public int qInsert(HttpServletRequest req, Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("문의게시글 로직");
		int result=0;
		int rno = 0;
		int group = 0;
		//답글일 경우
		if(pMap.equals("답글 파라미터 받음")) {
			rno = Integer.parseInt(req.getParameter("qna_no"));
			//해당 그룹의 depth랑 step도 받아오자
			group = menuDao.getGroup(pMap);//(qna_group,qna_depth,qna_step)
				if(depth) {//새로운 depth일 경우
					logger.info("depth 로직");
					menuDao.depth(bMap);
					//뎁스에 1추가 다오
				}
				else if(depth!) {//새로운 step일 경우
					logger.info("step 로직");
					menuDao.step(bMap);
					//스텝에 1추가 다오
			}
		}
		result = menuDao.qInsert(pMap);
		return result;
	}*/

	public List<Map<String, Object>> nSelect(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("nSelect 경유");
		List<Map<String, Object>> list = null;
		list = menuDao.nSelect(pMap);
		return list;
	}
}
