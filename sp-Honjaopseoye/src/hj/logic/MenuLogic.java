package hj.logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	//이전번호와 제목, 다음번호와 제목 조회
	public List<Map<String, Object>> PN_select(String NOTI_NO) {
		logger.info("Logic : You Succeed in calling next_select!!");
		List<Map<String, Object>> PN_select = null;
		PN_select = menuDao.PN_select(NOTI_NO);
		return PN_select;
	}
	//공지사항 리스트 조회
	public List<Map<String, Object>> nSelect() {
		logger.info("Logic : You Succeed in calling nSelect!!");
		List<Map<String, Object>> getNselect = new ArrayList<Map<String, Object>>();
		getNselect = menuDao.nSelect();
		return getNselect;
	}
	// 상세보기 조회
	public List<Map<String, Object>> nView(String NOTI_NO) {
		logger.info("Logic : You Succeed in calling nView!!");
		List<Map<String, Object>> notiList = new ArrayList<Map<String, Object>>();
		int hitUp = 0;
		hitUp = menuDao.hitUpdate(NOTI_NO);
		notiList = menuDao.nView(NOTI_NO);
		return notiList;
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
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={DataAccessException.class})
	@Pointcut(value="execution(* hj.logic.*Logic.*(..)")
	public int txqInsert(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("문의게시글 로직");
		int result = 0;
		int depth = 0;
		int group = 0;
		int step = 0;
		String keyword = null;
		//답글일 경우 상위글의 depth,group,step값을 받아온다.
		keyword = pMap.get("keyword").toString();
		//step커밋 오류를 막기 위한 트랜잭션 처리
		try {
		//새글일 경우엔 글쓰기 버튼 -> keyword="new" 
		if("새글".equals(keyword)){
			logger.info("새글로직");
			step = menuDao.getStep();
			group = menuDao.getGroup();// 최대 그룹값을 채번하는 쿼리문
			pMap.put("qna_group",group);//최대 그룹값 입력
			pMap.put("qna_depth",0);//깊이는 0
			pMap.put("qna_step",step);// 최대 스텝값 입력
			logger.info("쿼리에 들어갈 pMap값: "+pMap);
		}
		//답글일 경우엔 글쓰기 버튼 -> keyword="reply"
		else if("답글".equals(keyword)){
			logger.info("답글로직");
			depth = Integer.parseInt(pMap.get("qna_depth").toString())+1;//답글 깊이 +1추가
			//pMap.put("qna_step",Integer.parseInt(pMap.get("qna_step").toString())+1);//스텝 입력
			//밑의 글들 step1씩 추가 (where qna_step>=#{qna_step}}
			logger.info("step"+pMap.get("qna_step").toString()+"depth"+pMap.get("qna_depth").toString());
			step = Integer.parseInt(pMap.get("qna_step").toString());
			menuDao.stepUp(step);
			step = step+1;
		}
			//글 등록
			pMap.put("qna_depth", depth);
			pMap.put("qna_step", step);
			result = menuDao.qInsert(pMap);
		} catch (DataAccessException de) {
			throw de;//이 코드가 반드시 있어야 함. 왜냐하면 Exception발생시 개입해야 하니까
		}
		return result;
	}


}
