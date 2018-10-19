package hj.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hj.logic.BoardLogic;
import hj.util.HangulConversion;

@Controller
@RequestMapping("/board")
public class boardController {
	
	// Log Debug
	Logger logger = Logger.getLogger(this.getClass());
	
	// Logic class 객체 주입
	@Autowired
	BoardLogic boardLogic = null;
	
	// 한글 처리
	HangulConversion hc = new HangulConversion();
	
	
	// Response Json 목록 조회
	@ResponseBody
	@RequestMapping("/boardList.hon")
	public Map<String, List<Map<String, Object>>> conBoardList(Map<String, Object> pMap, 
			@RequestParam String category) throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardList method 시작");
		logger.info("conBoardList 파라미터 category : " + category);
		
		List<Map<String, Object>> conBoardList = null;
		Map<String, List<Map<String, Object>>> JsonList = new HashMap<String, List<Map<String, Object>>>();
		
		// Logic method 호출
		conBoardList = boardLogic.logBoardList(pMap, category);
		JsonList.put("data", conBoardList);
		logger.info("<Controller> 종료 ---> conBoardList 전체 조회 사이즈: " + conBoardList.size());
		
		return JsonList;
		
	}
	
	
	// 혼밥, 혼술, 혼놀  목록 해당 상세 조회 (해당 게시글 상세조회 데이터와 댓글 데이터)
	@RequestMapping("/boardOne.hon")
	public String conBoardOneList(Map<String, Object> pMap, Model model,
			@RequestParam String category, @RequestParam String no,
			HttpServletRequest req, HttpServletResponse res) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardOneList method 시작");
		logger.info("conBoardOneList 파라미터 category : " + category + " no : " + no);
		
		int result = 0;
		
		// JSP 경로 결정
		String viewPath = null; 
		
		// List 상세 조회 List -> 댓글 List가 있음
		List<Map<String, Object>> conBoardOneList = null; // 상세 조회 List 
		List<Map<String, Object>> conBoardCommentList = null; // 상세 조회 페이지 안의 댓글
		
		pMap = new HashMap<String, Object>();
		
		if("혼밥".equals(category)) {
			
			
			logger.info("<Controller> ---> if(혼밥)시작");
			
			// 해당 게시글의 번호 조회
			pMap.put("bab_no", no);
			logger.info("저장된 값 "+pMap.get("bab_no"));
			result = boardLogic.logBoardHitUpdate(pMap, category); // 혼밥 조회수
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // 상세
			viewPath = "forward:../boardList/babView.jsp";
			
			// 상세보기 댓글 조회 
			pMap.put("bab_re_category", category);
			pMap.put("bab_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("bab_re_category") + " , " + pMap.get("bab_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList 전체 조회 사이즈: " + conBoardCommentList.size());
			
			// request 댓글 조회 저장
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)){
			logger.info("<Controller> ---> if(혼술)시작");
			
			// 해당 게시글의 번호 조회
			pMap.put("sul_no", no);
			result = boardLogic.logBoardHitUpdate(pMap, category); // 혼술 조회수
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // 상세
			viewPath = "forward:../boardList/sulView.jsp";
			
			// 상세보기 댓글 조회 
			pMap.put("sul_re_category", category);
			pMap.put("sul_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("sul_re_category") + " , " + pMap.get("sul_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList 전체 조회 사이즈: " + conBoardCommentList.size());
			
			// request 댓글 조회 저장
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			logger.info("<Controller> ---> if(혼놀)시작");
			
			// 해당 게시글의 번호 조회
			pMap.put("nol_no", no);
			result = boardLogic.logBoardHitUpdate(pMap, category); // 혼놀 조회수
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // 상세
			viewPath = "forward:../boardList/nolView.jsp";
			
			// 상세보기 댓글 조회 
			pMap.put("nol_re_category", category);
			pMap.put("nol_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("nol_re_category") + " , " + pMap.get("nol_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList 전체 조회 사이즈: " + conBoardCommentList.size());
			
			// request 댓글 조회 저장
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(혼놀)종료");
			
		} else {
			
			logger.info("<Controller> ---> conBoardOneList 오류 파라미터: category, no 값을 확인해 주세요 " + category + " , " + no);
			
		}
		
		// request 상세 조회 저장
		req.setAttribute("conBoardOneList", conBoardOneList);
		logger.info("<Controller>" + category + " 조회수 업데이트 결과: " + result);
		logger.info("<Controller> 종료 ---> conBoardOneList 전체 조회 사이즈: " + conBoardOneList.size());
		
		return viewPath;
	}
	
	
	
	// 게시글 입력, 수정, 삭제 //
	
	
	// 게시글 입력
	@RequestMapping("/boardInsert.hon")
	public String conBoardInsert(Map<String, Object> pMap, 
			@RequestParam String id, @RequestParam String title,
			@RequestParam String category,@RequestParam String pw,
			@RequestParam String text, @RequestParam String url) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardInsert method 시작");
		
		// Insert 이후 경로
		String viewPath = null; 
		
		// 테스트용 id, pw
		//String u_id = hc.toUTF(id);
		String u_title = hc.toUTF(title);
		String u_category = hc.toUTF(category);
		String u_text = hc.toUTF(text);
		
		if(url == "") {
			logger.info("동영상 없음");
				
			url = "0"; // 빈 값일 경우
		} else {
			logger.info("올린 동영상 Id값 : " + url);
			logger.info("동영상 있음");
		}
		
		
		int result = 0;

		// JSP 파라미터 값
		logger.info("파리미터 값은 : " + id + u_title + category + pw + u_text + url + " 입니다.");
		
		pMap = new HashMap<String, Object>();
		
		if("혼밥".equals(category)) {
			
			logger.info("<Controller> ---> if(혼밥)시작");
			
			pMap.put("bab_id", id);
			pMap.put("bab_title", u_title);
			pMap.put("bab_category", category);
			pMap.put("bab_pw", pw);
			pMap.put("bab_text", u_text);
			pMap.put("bab_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/babBoard.jsp";
			
			logger.info("<Controller> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Controller> ---> if(혼술)시작");
			
			pMap.put("sul_id", id);
			pMap.put("sul_title", u_title);
			pMap.put("sul_category", category);
			pMap.put("sul_pw", pw);
			pMap.put("sul_text", u_text);
			pMap.put("sul_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/sulBoard.jsp";
			
			logger.info("<Controller> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Controller> ---> if(혼놀)시작");
			pMap.put("nol_id", id);
			pMap.put("nol_title", u_title);
			pMap.put("nol_category", category);
			pMap.put("nol_pw", pw);
			pMap.put("nol_text", u_text);
			pMap.put("nol_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/nolBoard.jsp";
			
			logger.info("<Controller> ---> if(혼놀)종료");
			
		} else {
			
			logger.info("<Controller> ---> conBoardInsert 오류 파라미터: category 값을 확인해 주세요 " + category);
		}
		
		logger.info("<Controller> 종료 ---> conBoardInsert 성공여부 : " + result);
		
		return viewPath;
		
	}
	
	
	/* 아이디 받아오기
	 * 	@RequestParam String id,
	String u_id = hc.toUTF(id);*/
	// 게시글 댓글 입력
	@RequestMapping("/commentInsert.hon")
	public String conBoardCommentInsert(Map<String, Object> pMap,
			@RequestParam String category,@RequestParam String id,
			@RequestParam String board_no, @RequestParam String r_text) 
				throws ServletException, IOException {
		
		int result = 0;
		
		logger.info("<Controller> ---> conBoardInsert method 시작");

		String u_id = hc.toUTF(id);
		String u_category = hc.toUTF(category);
		String u_board_no = hc.toUTF(board_no);
		String u_text = hc.toUTF(r_text);
		
		logger.info("conBoardCommentInsert 값: " + category + id + u_board_no + u_text + " 입니다.");
		
		List<Map<String, Object>> conCommentList = null;
		
		if("혼밥".equals(category)) {
			
			logger.info("<Controller> ---> if(혼밥)시작");
			pMap.put("bab_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("bab_re_board_no", board_no);
			pMap.put("bab_re_category", category);
			pMap.put("bab_re_content", r_text);
			pMap.put("bab_re_writer", id);
			pMap.put("bab_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> conBoardCommentInsert 완료");
			
			logger.info("<Controller> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Controller> ---> if(혼술)시작");
			pMap.put("sul_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("sul_re_board_no", board_no);
			pMap.put("sul_re_category", category);
			pMap.put("sul_re_content", r_text);
			pMap.put("sul_re_writer", id);
			pMap.put("sul_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> conBoardCommentInsert 완료");
			
			logger.info("<Controller> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Controller> ---> if(혼술)시작");
			pMap.put("nol_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("nol_re_board_no", board_no);
			pMap.put("nol_re_category", category);
			pMap.put("nol_re_content", r_text);
			pMap.put("nol_re_writer", id);
			pMap.put("nol_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> if(혼술)종료");
			
		} else {
			
			logger.info("<Controller> ---> conBoardCommentInsert 오류 파라미터: category 값을 확인해 주세요 " + category);
			
		}
		
		logger.info("<Controller> 종료 ---> conBoardCommentInsert 성공여부 : " + result);
		
		// "babView.jsp";
		return "";
	}
	
	
	// 게시글 삭제
	@RequestMapping("/boardDelete.hon")
	public String conBoardDelete(Map<String, Object> pMap,
			@RequestParam String category, @RequestParam String no,
			HttpServletRequest req, HttpServletResponse res) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardDelete method 시작");
		
		pMap = new HashMap<String, Object>();
		pMap.put("bab_no", no);
		pMap.put("sul_no", no);
		pMap.put("nol_no", no);
		String viewPath = "error";
		
		if("혼밥".equals(category)) {
			viewPath = "redirect:../boardList/babBoard.jsp";
					
			
		} else if("혼술".equals(category)) {
			
			viewPath = "redirect:../boardList/sulBoard.jsp";
			
		} else if("혼놀".equals(category)) {
			
			viewPath = "redirect:../boardList/nolBoard.jsp";
			
		} else {
			
			logger.info("<Controller> ---> conBoardDelete  실패" + category);
		}
		
		int result = 0;
		result = boardLogic.logBoardDelete(pMap, category);
		
		logger.info("<Controller> ---> conBoardDelete 결과 : " + result);
		
		return viewPath;
	}
	
	
	// 게시글 업데이트
	@RequestMapping("/Update.hon")
	public String conBoardUpdate(Map<String, Object> pMap,
			@RequestParam String category,
			@RequestParam String no, @RequestParam String title,
			@RequestParam String text, @RequestParam String url) 
					throws ServletException, IOException{
		
		pMap = new HashMap<String, Object>();
		
		pMap.put("bab_no", hc.toUTF(no));
		pMap.put("sul_no", hc.toUTF(no));
		pMap.put("nol_no", hc.toUTF(no));
		
		pMap.put("bab_title", hc.toUTF(title));
		pMap.put("sul_title", hc.toUTF(title));
		pMap.put("nol_title", hc.toUTF(title));
		
		pMap.put("bab_text", hc.toUTF(text));
		pMap.put("sul_text", hc.toUTF(text));
		pMap.put("nol_text", hc.toUTF(text));
		
		pMap.put("bab_url", hc.toUTF(url));
		pMap.put("sul_url", hc.toUTF(url));
		pMap.put("nol_url", hc.toUTF(url));
		
		logger.info("<Controller> ---> conBoardUpdate method 시작");
		int result = 0;
		result = boardLogic.logBoardUpdate(pMap, category);
		logger.info("<Controller> ---> conBoardUpdate 결과 : " + result);
		
		return "redirect:../boardList/mainBoardList.jsp";
	}
	
	
	// 게시글 업데이트 서브 Modify
	@RequestMapping("/boardUpdateSub.hon")
	public String conBoardUpdateSub(@RequestParam String category, @RequestParam String no,
			Map<String, Object> pMap, HttpServletRequest req, HttpServletResponse res) 
					throws ServletException, IOException {
		
		int result = 0;
		logger.info("<Controller> ---> conBoardUpdateSub method 시작");
		
		List<Map<String, Object>> conBoardUpdateSub = null;
		pMap = new HashMap<String,Object>();
		
		if("혼밥".equals(category)) {
			
			logger.info("<Controller> ---> if(혼밥)시작");
			pMap.put("bab_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Controller> ---> if(혼술)시작");
			pMap.put("sul_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Controller> ---> if(혼놀)시작");
			pMap.put("nol_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(혼놀)종료");
			
		} else {
			
			logger.info("<Controller> 종료 ---> conBoardCommentInsert 성공여부 : " + result);
			
		}
		
		req.setAttribute("conBoardUpdateSub", conBoardUpdateSub);
		req.setAttribute("category", category);
		
		logger.info("<Controller> 종료 ---> conBoardUpdateSub 성공여부 : " + result);
		
		return "forward:../boardList/writeModify.jsp";
		
	}
	
	
	
	@RequestMapping("/boardMaxHit.hon")
	public String conBoardMaxHitList(Map<String, Object> pMap,
			HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardMaxHitList method 시작");
		
		List<Map<String, Object>> conBoardBabHitMax = null;
		List<Map<String, Object>> conBoardSulHitMax = null;
		List<Map<String, Object>> conBoardNolHitMax = null;
		
		pMap = new HashMap<String, Object>();
		
		// Logic method 호출
		conBoardBabHitMax = boardLogic.logBabBoardHitMax(pMap);
		req.setAttribute("conBoardBabHitMax", conBoardBabHitMax);
		conBoardSulHitMax = boardLogic.logSulBoardHitMax(pMap);
		req.setAttribute("conBoardSulHitMax", conBoardSulHitMax);
		conBoardNolHitMax = boardLogic.logNolBoardHitMax(pMap);
		req.setAttribute("conBoardNolHitMax", conBoardNolHitMax);
		
		logger.info("<Controller> 종료 ---> conBoardBabHitMax 전체 조회 사이즈: " + conBoardBabHitMax.size());
		logger.info("<Controller> 종료 ---> conBoardSulHitMax 전체 조회 사이즈: " + conBoardSulHitMax.size());
		logger.info("<Controller> 종료 ---> conBoardNolHitMax 전체 조회 사이즈: " + conBoardNolHitMax.size());
		
		return "forward:../boardList/mainBoardList.jsp";
		
	}
	
	

}
