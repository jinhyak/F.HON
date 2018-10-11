package hj.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hj.dao.MenuDao;
import hj.logic.MenuLogic;
import hj.logic.QnALogic;
import hj.util.HangulConversion;

@Controller
@RequestMapping("/notice")
public class MenuController {
	Logger logger = Logger.getLogger(MenuController.class);

	@Autowired
	private MenuLogic menuLogic = null;

	@Autowired
	private QnALogic qnaLogic = null;
	
	@Autowired
	private MenuDao menuDao = null;
	

	/* 공지사항 */
	@ResponseBody
	@RequestMapping("/nSelect.hon")
	public Map<String, List<Map<String, Object>>> nSelect(Model mod) {
		logger.info("nSelect 메소드 호출");
		List<Map<String, Object>> list = null;
		list = menuLogic.nSelect();
		Map<String, List<Map<String,Object>>> pMap = new HashMap<String, List<Map<String,Object>>>();
		pMap.put("data", list);
		logger.info(pMap);
		return pMap;
	}

	/* 공지사항 글쓰기 */
	@RequestMapping("/nInsert.hon")
	public String nInsert(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		logger.info("nInsert 메소드 호출");
		int result = 0;
		result = menuDao.nInsert(pMap);
		return "redirect:../notice/notice.jsp";
	}

	/* 문의하기 */
	@RequestMapping("/qInsert.hon")
	public String qInsert(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletRequest req) {
		logger.info("qInsert 메소드 호출");
		int result = 0;
		//result = menuLogic.qInsert(req, pMap);
		return "forward:/notice/qna/qnaRead.jsp";
	}

	/* 문의 게시판 */
	@ResponseBody
	@RequestMapping("/qSelect.hon")
	public Map<String, List<Map<String, Object>>> conQnaBoardList(
		HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		logger.info("qSelect 메소드 진입");
		
		List<Map<String, Object>> conQnaBoardList = new ArrayList<Map<String, Object>>();
		Map<String, List<Map<String, Object>>> pMapList = new HashMap<String, List<Map<String, Object>>>();
		conQnaBoardList = qnaLogic.qnaBoardListLogic();
		logger.info("qSelect값 : " + conQnaBoardList.size());
		pMapList.put("data", conQnaBoardList);
		
		return pMapList;
	}
	
	/* 해당 qna조회 (상세보기) */
		@RequestMapping("/qView.hon")
		public String qView(HttpServletRequest req, HttpServletResponse res,
				@RequestParam String qna_no, Map<String, Object> pMap)
						throws ServletException, IOException {
			
			logger.info("qView 메소드 진입");
			
			List<Map<String, Object>> conQnABoardIdList = null;
			
			pMap = new HashMap<String, Object>();
			pMap.put("qna_no", qna_no);
			conQnABoardIdList = qnaLogic.qnaBoardIdListLogic(pMap);
			
			req.setAttribute("conQnABoardIdList", conQnABoardIdList);
			
			return "forward:../notice/qna/qnaView.jsp";
		}
	
	/* qna 인서트 */
		@RequestMapping("/qnaInsert.hon")
		public String qnaBoardInsert(@RequestParam String qna_category, 
				@RequestParam String qna_title, @RequestParam String qna_content,
				@RequestParam String qna_pw, Map<String, Object> pMap) 
				throws ServletException, IOException {
			
			logger.info("qnaBoardInsert 메소드 진입");
			int result = 0;
			HangulConversion hc = new HangulConversion();
			String id = "beyonce200";
			
			String n_qna_pw = hc.toUTF(qna_pw);
			String n_qna_category = hc.toUTF(qna_category);
			String n_qna_title = hc.toUTF(qna_title);
			String n_qna_content = hc.toUTF(qna_content);
			
			logger.info("카테고리 : " + n_qna_category + " 비밀번호: " + n_qna_pw  +" 제목: " + n_qna_title + " 내용 : " + n_qna_content + " 아이디:  " + id);
			
			
			pMap = new HashMap<String, Object>();
			
			pMap.put("qna_writer", id);
			pMap.put("qna_title", n_qna_title);
			pMap.put("qna_category", n_qna_category);
			pMap.put("qna_pw", n_qna_pw);
			pMap.put("qna_content", n_qna_content);
			
			result = qnaLogic.qnaBoardInsertLogic(pMap);
					
			logger.info("INSERT 완료 : " + result);
			
			logger.info("qnaBoardInsert 메소드 종료>>>>>>>>>>>>>>");
			return "redirect:../notice/qna/qna.jsp";
			
		}
		
	/* 문의 삭제 */
	@RequestMapping("/qnaDelete.hon")
	public String qnaBoardDelete(@RequestParam String no,
			@RequestParam String id, Map<String, Object> pMap)
	throws ServletException, IOException {
		
		logger.info("id : " + id + "no : " + no);
		int result = 0;
		logger.info("qnaBoardDelete 메소드 진입");
		
		pMap = new HashMap<String, Object>();
		pMap.put("qna_writer", id);
		pMap.put("qna_no", no);
		result = qnaLogic.qDelete(pMap);
		
		logger.info("qnaBoardDelete 삭제 결과 : " + result);
		return "redirect:../notice/qna/qna.jsp";
	}

	/* qna 수정 게시글 등록하기 */
	@RequestMapping("/qUpdate.hon")
		public String qUpdate(@RequestParam String qna_content,
				@RequestParam String qna_title, @RequestParam String qna_no,
				Map<String, Object> pMap)
						throws ServletException, IOException {
			
			HangulConversion hc = new HangulConversion();
			int result = 0;
			
			logger.info("qnaBoardUpdate 메소드 진입");
			logger.info("qna_content : " + qna_content + "qna_no : " + qna_no +
					"qna_title : " + qna_title);
			
			String n_qna_content = hc.toUTF(qna_content);
			String n_qna_title = hc.toUTF(qna_title);
			String n_qna_no = hc.toUTF(qna_no);
			
			pMap = new HashMap<String, Object>();
			pMap.put("qna_content", n_qna_content);
			pMap.put("qna_no", n_qna_no);
			pMap.put("qna_title", n_qna_title);
			
			result = qnaLogic.qnaBoardUpdateLogic(pMap);
			logger.info("qnaBoardUpdate 결과 : " + result);
			
			return"redirect:../notice/qna/qna.jsp";
		}
	
	/* qna 게시글 수정하기 */
	@RequestMapping("/qUpdateSub.hon")
	public String qUpdateSub(HttpServletRequest req, HttpServletResponse res,
			@RequestParam String qna_no, Map<String, Object> pMap)
					throws ServletException, IOException {
		logger.info("qUpdateSub 메소드 진입");
		List<Map<String, Object>> conQnABoardIdList = null;
		pMap = new HashMap<String, Object>();
		pMap.put("qna_no", qna_no);
		conQnABoardIdList = qnaLogic.qnaBoardIdListLogic(pMap);
		req.setAttribute("conQnABoardIdList", conQnABoardIdList);
		return "forward:../notice/qna/qnaWriteModify.jsp";
	}
}
