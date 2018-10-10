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

	/*1. 게시글 등록을 눌렀을 경우(qna_no는 시퀀스로 추가)
	 *2. 게시글의 답글달기를 눌렀을 경우(qView에서 접근) 
	a. depth - if(답글달기를 눌렀을때 갖고있는 depth에서 1이 추가되게)
	 	- else{ 새글일땐 그냥 0임}
	b. step 은 결과순으로 값이 정해진다. 
		1. 추가 될때 어디에 위치하는지 판단해야함.
		2. 추가 된 위치 바로 윗글의 step+1로 값을 부여
		3. 추가된 글보다 아래에 위치하는 글들은 모두 step이 1씩 추가됨.
	c. group - if(첫글이면 그룹번호는 현재 그룹번호에서 가장 큰 번호에 +1된다.)
		- else if( 첫글이 아닐경우(댓글일 경우)엔 그룹번호를 그대로 부여받는다.*/
	public int qInsert(HttpServletRequest req, Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("문의게시글 로직");
		int result = 0;
		int depth = -1;
		int group = 0;
		String step = null;
		//답글일 경우 상위글의 depth,group,step값을 받아온다.
		depth = Integer.parseInt(req.getParameter("depth"));
		group = Integer.parseInt(req.getParameter("group"));
		step  = req.getParameter("step");
		if(depth>=-1) {//답글일 경우
			//하위 글들에 step값을 1추가하는 쿼리문
			menuDao.step(step);
			pMap.put("qna_group", group);

		} else {//새글일 경우
			//끝 그룹번호 채번 쿼리문
			group = menuDao.getGroup(pMap);
			group = group + 1;
			pMap.put("qna_group", group);
			
		}
			//글 등록
			depth = depth + 1;//depth 1추가
			pMap.put("qna_depth", depth);
			pMap.put("qna_step", step);
			result = menuDao.qInsert(pMap);
		return result;
	}

	public List<Map<String, Object>> nSelect(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("nSelect 경유");
		List<Map<String, Object>> list = null;
		list = menuDao.nSelect(pMap);
		return list;
	}
}
