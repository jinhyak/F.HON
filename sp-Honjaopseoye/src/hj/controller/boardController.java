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
	Logger logger = Logger.getLogger(this.getClass());
	// setter
	@Autowired
	BoardLogic boardLogic = null;
	
	// json을 넘겨준다.
	
	// <혼밥>, <혼술>, <혼놀> 모든 게시글 목록 조회 Controller
	@ResponseBody
	@RequestMapping("/boardList.hon")
	public Map<String, List<Map<String, Object>>> conBoardList(@RequestParam String key, Map<String, Object> pMap) throws ServletException, IOException {
		
		logger.info("conBoardList 메소드 진입");
		
		// 해당 페이지 key값 받아오기....
		logger.info("key 값 : " + key);
		
		List<Map<String, Object>> conBoardList = null;
		Map<String, List<Map<String, Object>>> pMapList = new HashMap<String, List<Map<String, Object>>>();
		 
		// Json에 전달할 데이터 값
		conBoardList = boardLogic.boardListLogic(pMap, key);
		logger.info("conBoardList값 : " + conBoardList.size());
		
		pMapList.put("data", conBoardList);
		logger.info(" Controller - conBoardList 메소드를 종료합니다.");
		
		return pMapList;
		
	}
	
	
	
	// <혼밥>, <혼술>, <혼놀> 해당 게시글 조회 Controller
	@RequestMapping("/boardOne.hon")
	public String conBoardOneList(@RequestParam String key, @RequestParam String num,
			Map<String, Object> pMap, Model model) 
					throws ServletException, IOException {
		
		String viewList = null;
		logger.info("conBoardOneList 메소드 진입");
		
		// 해당 페이지 key값 받아오기....
		logger.info("key 값 : " + key + ", " + "Number 값 : " + num);
		List<Map<String, Object>> conBoardOneList = null;
		List<Map<String, Object>> conCommentList = null;
		pMap = new HashMap<String,Object>();
		
		if("혼밥".equals(key)) {
			
			logger.info("conBoardOneList if <혼밥> 진입");
			viewList = "forward:babView.jsp";
			pMap.put("bab_no", num);
			
			conBoardOneList = boardLogic.boardOneListLogic(pMap, key);
			pMap.put("bab_re_category", key);
			pMap.put("bab_re_board_no", num);
			
			logger.info("conBoardOneList -- 댓글 맵값 : " + pMap.get("bab_re_category") + " , " + pMap.get("bab_re_board_no"));
			conCommentList = boardLogic.CommentListLogic(pMap,num, key);
			
			model.addAttribute("conCommentList", conCommentList);
			
			logger.info("conCommentList값 : " + conBoardOneList.size());
			logger.info("conCommentList 메소드 종료");
		} else if("혼술".equals(key)) {
			
			logger.info("conBoardOneList if <혼술> 진입");
			viewList = "forward:sulView.jsp";
			pMap.put("sul_no", num);
			
			conBoardOneList = boardLogic.boardOneListLogic(pMap, key);
			logger.info("conBoardOneList값 : " + conBoardOneList.size());
			
		} else if("혼놀".equals(key)) {
			
			logger.info("conBoardOneList if <혼놀> 진입");
			viewList = "forward:nolView.jsp";
			pMap.put("nol_no", num);
			
			conBoardOneList = boardLogic.boardOneListLogic(pMap, key);
			logger.info("conBoardOneList값 : " + conBoardOneList.size());
			
		} else {
			
			logger.info("conBoardOneList - <<오류 발생>> : 파라미터값을 확인하세요"+ "key : " + key + ", num :" + num);
			
		}
		
		model.addAttribute("conBoardOneList", conBoardOneList);
		
		logger.info(" Controller - conBoardOneList 메소드를 종료합니다.");
		
		return viewList;
		
	}
	
	
	
	// <혼밥>, <혼술>, <혼놀> INSERT Controller
		@RequestMapping("/boardInsert.hon")
		public String conBoardInsert(@RequestParam String key,
				@RequestParam String url, @RequestParam String category,
				@RequestParam String title, @RequestParam String t_text,
				Map<String, Object> pMap) 
						throws ServletException, IOException {
			
			// 테스트용 임
			HangulConversion hc = new HangulConversion();
			
			String name = "beyonce200";
			String pw = "1234";
			
			String n_url = hc.toUTF(url);
			String n_category = hc.toUTF(category);
			String n_title = hc.toUTF(title);
			String n_t_text = hc.toUTF(t_text);
			
			
			int result = 0;
			logger.info("conBoardInsert 메소드 진입");
			
			// 해당 페이지 key값 받아오기....
			logger.info("key 값 : " + key);
			logger.info("파라미터 값 : " + "텍스트 값 : " + n_t_text + "\n 제목: "  + n_title + " 카테고리: " + n_category + " URL :" + n_url);
			pMap = new HashMap<String, Object>();
			
			if("혼밥".equals(key)) {
				
				pMap.put("bab_id", name);
				pMap.put("bab_title", n_title);
				pMap.put("bab_category", n_category);
				pMap.put("bab_pw", pw);
				pMap.put("bab_text", n_t_text);
				pMap.put("bab_url", n_url);
				
				logger.info("<혼밥> INSERT 준비중");
				result = boardLogic.boardInsertLogic(pMap, key);
				
			} else if("혼술".equals(key)) {
				
				pMap.put("sul_id", name);
				pMap.put("sul_title", n_title);
				pMap.put("sul_category", n_category);
				pMap.put("sul_pw", pw);
				pMap.put("sul_text", n_t_text);
				pMap.put("sul_url", n_url);
				
				logger.info("<혼술> INSERT 준비중");
				result = boardLogic.boardInsertLogic(pMap, key);
				
			} else if("혼놀".equals(key)) {
				
				pMap.put("nol_id", name);
				pMap.put("nol_title", n_title);
				pMap.put("nol_category", n_category);
				pMap.put("nol_pw", pw);
				pMap.put("nol_text", n_t_text);
				pMap.put("nol_url", n_url);
				
				logger.info("<혼놀> INSERT 준비중");
				result = boardLogic.boardInsertLogic(pMap, key);
				
			} else {
				
				logger.info("<<오류 발생>> key 값 확인 : " + key);
				
			}
			
			logger.info("result 값 : " + result);
			
			logger.info(" Controller - conBoardInsert 메소드를 종료합니다.");
			
			return "redirect:mainBoardList.jsp";
			
		}

		
		// <혼밥>, <혼술>, <혼놀> DELETE Controller
		@RequestMapping("/boardDelete.hon")
		public String conBoardDelete(Map<String, Object> pMap,
				@RequestParam String category, @RequestParam String id,
				@RequestParam String no) 
						throws ServletException, IOException{
			
			logger.info("Controller - conBoardDelete 메소드 진입");
			
			int result = 0;
			logger.info("가져온 값 = 카테고리 :  " + category + " id : " + id + " num : " + no);
			pMap = new HashMap<String, Object>();
			
			if("혼밥".equals(category)) {
				
				logger.info("혼밥 게시글 삭제 시작");
				pMap.put("bab_id", id);
				pMap.put("bab_no", no);
				pMap.put("bab_category", category);
				result = boardLogic.boardDeleteLogic(pMap, category);
				logger.info("혼밥 게시글 삭제 끝");
				
			} else if("혼술".equals(category)) {
				
				logger.info("혼술 게시글 삭제 시작");
				pMap.put("sul_id", id);
				pMap.put("sul_no", no);
				pMap.put("sul_category", category);
				result = boardLogic.boardDeleteLogic(pMap, category);
				logger.info("혼술 게시글 삭제 끝");
				
			} else if("혼놀".equals(category)) {
				
				logger.info("혼놀 게시글 삭제 시작");
				pMap.put("nol_id", id);
				pMap.put("nol_no", no);
				pMap.put("nol_category", category);
				result = boardLogic.boardDeleteLogic(pMap, category);
				logger.info("혼놀 게시글 삭제 끝");
				
			} else {
				logger.info("<<오류발생>> key값을 확인하세요~");
			}
			
			logger.info("삭제 성공 여부 : " + result);
			logger.info("Controller - conBoardDelete 메소드 종료");
			return "redirect:mainBoardList.jsp";
		}
		
		
		
		// <혼밥>, <혼술>, <혼놀> UPDATE Controller
				@RequestMapping("/Update.hon")
				public String conBoardUpdate(Map<String, Object> pMap,
						@RequestParam String category,
						@RequestParam String num, @RequestParam String title,
						@RequestParam String t_text, @RequestParam String url) 
								throws ServletException, IOException{
					
					logger.info("Controller ----------- conBoardUpdate 메소드 진입");
					HangulConversion hc = new HangulConversion();
					
					String id = "beyonce200";
					String pw = "1234";
					String n_category = hc.toUTF(category);
					String n_url = hc.toUTF(url);
					String n_title = hc.toUTF(title);
					String n_t_text = hc.toUTF(t_text);
					
					
					
					int result = 0;
					logger.info("가져온 값  :  "+ n_t_text + n_title + n_category + " id : " + id + " num : " + num + " , :" + n_url );
					pMap = new HashMap<String, Object>();
					
					if("혼밥".equals(n_category)) {
						
						logger.info("<혼밥>  if 게시글 수정 시작");
						pMap.put("bab_id", id);
						pMap.put("bab_no", num);
						pMap.put("bab_title", n_title);
						pMap.put("bab_text", n_t_text);
						pMap.put("bab_url", n_url);
						result = boardLogic.boardUpdateLogic(pMap, n_category);
						logger.info("<혼밥> 게시글 수정 끝");
						
					} else if("혼술".equals(n_category)) {
						
						logger.info("혼술 게시글 수정 시작");
						pMap.put("sul_id", id);
						pMap.put("sul_no", num);
						pMap.put("sul_title", n_title);
						pMap.put("sul_text", n_t_text);
						pMap.put("sul_url", n_url);
						result = boardLogic.boardUpdateLogic(pMap, n_category);
						logger.info("<혼술> if  게시글 수정 끝");
						
					} else if("혼놀".equals(n_category)) {
						
						logger.info("<혼놀> if 게시글 수정 시작");
						pMap.put("nol_id", id);
						pMap.put("nol_no", num);
						pMap.put("nol_title", n_title);
						pMap.put("nol_text", n_t_text);
						pMap.put("nol_url", n_url);
						result = boardLogic.boardUpdateLogic(pMap, n_category);
						logger.info("<혼놀> 게시글 수정 끝");
						
					} else {
						
						logger.info("<<오류발생>> key값을 확인하세요~");
						
					}
					
					logger.info("수정 성공 여부 : " + result);
					logger.info("Controller - conBoardUpdate 메소드 종료");
					
					return "redirect:mainBoardList.jsp";
				}
				
				// <혼밥>, <혼술>, <혼놀> 해당 게시글 조회 Controller
				@RequestMapping("/boardUpdateSub.hon")
				public String conBoardUpdateSub(@RequestParam String key, @RequestParam String num,
						Map<String, Object> pMap, HttpServletRequest req, HttpServletResponse res) 
								throws ServletException, IOException {
					
					logger.info("conBoardUpdateSub 메소드 진입");
					
					// 해당 페이지 key값 받아오기....
					logger.info("key 값 : " + key + ", " + "Number 값 : " + num);
					List<Map<String, Object>> conBoardUpdateSubList = null;
					pMap = new HashMap<String,Object>();
					
					if("혼밥".equals(key)) {
						
						logger.info("conBoardUpdateSubList if <혼밥> 진입");
						pMap.put("bab_no", num);
						
						conBoardUpdateSubList = boardLogic.boardOneListLogic(pMap, key);
						logger.info("conBoardUpdateSubList값 : " + conBoardUpdateSubList.size());
						
					} else if("혼술".equals(key)) {
						
						logger.info("conBoardUpdateSubList if <혼술> 진입");
						pMap.put("sul_no", num);
						
						conBoardUpdateSubList = boardLogic.boardOneListLogic(pMap, key);
						logger.info("conBoardUpdateSubList값 : " + conBoardUpdateSubList.size());
						
					} else if("혼놀".equals(key)) {
						
						logger.info("conBoardUpdateSubList if <혼놀> 진입");
						pMap.put("nol_no", num);
						
						conBoardUpdateSubList = boardLogic.boardOneListLogic(pMap, key);
						logger.info("conBoardUpdateSubList값 : " + conBoardUpdateSubList.size());
						
					} else {
						
						logger.info("conBoardUpdateSub - <<오류 발생>> : 파라미터값을 확인하세요"+ "key : " + key + ", num :" + num);
						
					}
					
					req.setAttribute("conBoardUpdateSubList", conBoardUpdateSubList);
					req.setAttribute("categoryKey", key);
					
					logger.info(" Controller - conBoardUpdateSub 메소드를 종료합니다.");
					
					return "forward:writeModify.jsp";
					
				}
				
				// 댓글 SELECT 조회 =============================================================
				public List<Map<String, Object>> conCommentList(Map<String, Object> pMap, 
						String no, String category, HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
					
					logger.info("Controller - conCommentList 진입");
					
					List<Map<String, Object>> conCommentList = null;
					conCommentList = boardLogic.CommentListLogic(pMap, no, category);
					
					logger.info("conCommentList 값이다: " + conCommentList.get(0));
					logger.info("Controller - conCommentList 끝");
					
					return conCommentList;
					
				}
				
				// ===============================================================================
				
				
				// 댓글 INSERT 입력
				@RequestMapping("/commentInsert.hon")
				public String conCommentInsert(Map<String, Object> pMap,
						@RequestParam String bab_re_category, @RequestParam String bab_re_board_no,
						@RequestParam String bab_re_content,
						HttpServletRequest req, HttpServletResponse res) {
					
					logger.info("conCommentInsert 메소드 진입");
					
					List<Map<String, Object>> conCommentList = null;
					pMap = new HashMap<String, Object>();
					int result = 0;
					
					HangulConversion hc = new HangulConversion();
					String bab_re_writer = "beyonce200";
					
			/*		String n_bab_re_category = hc.toUTF(bab_re_category);
					String n_nobab_re_board_no = hc.toUTF(bab_re_board_no);
					String n_bab_re_content = hc.toUTF(bab_re_content);*/
					
					logger.info("가져온 값: " + bab_re_category + " , " +
							bab_re_board_no + " , " + bab_re_content);
					
					pMap.put("bab_re_board_no", bab_re_board_no);
					conCommentList = boardLogic.CommentListLogic(pMap, bab_re_board_no, bab_re_category);
					logger.info("리스트 조회 완료- 댓글 카운트 대기중...");
					
					pMap.put("bab_re_board_no", bab_re_board_no);
					pMap.put("bab_re_category", bab_re_category);
					pMap.put("bab_re_content", bab_re_content);
					pMap.put("bab_re_writer", bab_re_writer);
					pMap.put("bab_re_no", conCommentList.size());
					
					logger.info("저장완료 !: ");
					result = boardLogic.CommentInsertLogic(pMap, bab_re_board_no, bab_re_category);
					
					logger.info("Controller - conCommentInsert 메소드 끝");
					
					
//					return "babView.jsp";
					return "";
				}
				
				
}
