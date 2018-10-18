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
	
	// Logic class 媛앹껜 二쇱엯
	@Autowired
	BoardLogic boardLogic = null;
	
	// �븳湲� 泥섎━
	HangulConversion hc = new HangulConversion();
	
	
	// Response Json 紐⑸줉 議고쉶
	@ResponseBody
	@RequestMapping("/boardList.hon")
	public Map<String, List<Map<String, Object>>> conBoardList(Map<String, Object> pMap, 
			@RequestParam String category) throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardList method �떆�옉");
		logger.info("conBoardList �뙆�씪誘명꽣 category : " + category);
		
		List<Map<String, Object>> conBoardList = null;
		Map<String, List<Map<String, Object>>> JsonList = new HashMap<String, List<Map<String, Object>>>();
		
		conBoardList = boardLogic.logBoardList(pMap, category);
		JsonList.put("data", conBoardList);
		logger.info("<Controller> ---> conBoardList: " + conBoardList.size());
		
		return JsonList;
		
	}
	
	
	// �샎諛�, �샎�닠, �샎��  紐⑸줉 �빐�떦 �긽�꽭 議고쉶 (�빐�떦 寃뚯떆湲� �긽�꽭議고쉶 �뜲�씠�꽣�� �뙎湲� �뜲�씠�꽣)
	@RequestMapping("/boardOne.hon")
	public String conBoardOneList(Map<String, Object> pMap, Model model,
			@RequestParam String category, @RequestParam String no,
			HttpServletRequest req, HttpServletResponse res) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardOneList method �떆�옉");
		logger.info("conBoardOneList �뙆�씪誘명꽣 category : " + category + " no : " + no);
		
		int result = 0;
		
		// JSP 寃쎈줈 寃곗젙
		String viewPath = null; 
		
		// List �긽�꽭 議고쉶 List -> �뙎湲� List媛� �엳�쓬
		List<Map<String, Object>> conBoardOneList = null; // �긽�꽭 議고쉶 List 
		List<Map<String, Object>> conBoardCommentList = null; // �긽�꽭 議고쉶 �럹�씠吏� �븞�쓽 �뙎湲�
		
		pMap = new HashMap<String, Object>();
		
		if("혼밥".equals(category)) {
			
			
			logger.info("<Controller> ---> if(�샎諛�)�떆�옉");
			
			// 해당 넘버에 대한 게시글 정보
			pMap.put("bab_no", no);
			logger.info("���옣�맂 媛� "+pMap.get("bab_no"));
			result = boardLogic.logBoardHitUpdate(pMap, category); // �샎諛� 議고쉶�닔
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // �긽�꽭
			viewPath = "forward:../boardList/babView.jsp";
			
			// 해당 게시글에 대한 댓글 목록 가져오기
			pMap.put("bab_re_category", category);
			pMap.put("bab_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("bab_re_category") + " , " + pMap.get("bab_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList �쟾泥� 議고쉶 �궗�씠利�: " + conBoardCommentList.size());
			
			// request �뙎湲� 議고쉶 ���옣
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(�샎諛�)醫낅즺");
			
		} else if("혼술".equals(category)){
			logger.info("<Controller> ---> if(�샎�닠)�떆�옉");
			
			// �빐�떦 寃뚯떆湲��쓽 踰덊샇 議고쉶
			pMap.put("sul_no", no);
			result = boardLogic.logBoardHitUpdate(pMap, category); // �샎�닠 議고쉶�닔
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // �긽�꽭
			viewPath = "forward:../boardList/sulView.jsp";
			
			// �긽�꽭蹂닿린 �뙎湲� 議고쉶 
			pMap.put("sul_re_category", category);
			pMap.put("sul_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("sul_re_category") + " , " + pMap.get("sul_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList �쟾泥� 議고쉶 �궗�씠利�: " + conBoardCommentList.size());
			
			// request �뙎湲� 議고쉶 ���옣
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(�샎�닠)醫낅즺");
			
		} else if("혼놀".equals(category)) {
			logger.info("<Controller> ---> if(�샎��)�떆�옉");
			
			// �빐�떦 寃뚯떆湲��쓽 踰덊샇 議고쉶
			pMap.put("nol_no", no);
			result = boardLogic.logBoardHitUpdate(pMap, category); // �샎�� 議고쉶�닔
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // �긽�꽭
			viewPath = "forward:../boardList/nolView.jsp";
			
			// �긽�꽭蹂닿린 �뙎湲� 議고쉶 
			pMap.put("nol_re_category", category);
			pMap.put("nol_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("nol_re_category") + " , " + pMap.get("nol_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList �쟾泥� 議고쉶 �궗�씠利�: " + conBoardCommentList.size());
			
			// request �뙎湲� 議고쉶 ���옣
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(�샎��)醫낅즺");
			
		} else {
			
			logger.info("<Controller> ---> conBoardOneList �삤瑜� �뙆�씪誘명꽣: category, no 媛믪쓣 �솗�씤�빐 二쇱꽭�슂 " + category + " , " + no);
			
		}
		
		// request �긽�꽭 議고쉶 ���옣
		req.setAttribute("conBoardOneList", conBoardOneList);
		logger.info("<Controller>" + category + " 議고쉶�닔 �뾽�뜲�씠�듃 寃곌낵: " + result);
		logger.info("<Controller> 醫낅즺 ---> conBoardOneList �쟾泥� 議고쉶 �궗�씠利�: " + conBoardOneList.size());
		
		return viewPath;
	}
	
	@RequestMapping("/boardInsert.hon")
	public String conBoardInsert(Map<String, Object> pMap, 
			@RequestParam String id, @RequestParam String title,
			@RequestParam String category,@RequestParam String pw,
			@RequestParam String text, @RequestParam String url) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardInsert method �떆�옉");
		
		// Insert �씠�썑 寃쎈줈
		String viewPath = null; 
		
		//String u_id = hc.toUTF(id);
		String u_title = hc.toUTF(title);
		String u_category = hc.toUTF(category);
		String u_text = hc.toUTF(text);
		
		if(url == "") {
			logger.info("�룞�쁺�긽 �뾾�쓬");
				
			url = "0"; // 鍮� 媛믪씪 寃쎌슦
		} else {
			logger.info("�삱由� �룞�쁺�긽 Id媛� : " + url);
			logger.info("�룞�쁺�긽 �엳�쓬");
		}
		
		
		int result = 0;

		// JSP �뙆�씪誘명꽣 媛�
		logger.info("�뙆由щ�명꽣 媛믪� : " + id + u_title + category + pw + u_text + url + " �엯�땲�떎.");
		
		pMap = new HashMap<String, Object>();
		
		if("혼밥".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎諛�)�떆�옉");
			
			pMap.put("bab_id", id);
			pMap.put("bab_title", u_title);
			pMap.put("bab_category", category);
			pMap.put("bab_pw", pw);
			pMap.put("bab_text", u_text);
			pMap.put("bab_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/babBoard.jsp";
			
			logger.info("<Controller> ---> if(�샎諛�)醫낅즺");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎�닠)�떆�옉");
			
			pMap.put("sul_id", id);
			pMap.put("sul_title", u_title);
			pMap.put("sul_category", category);
			pMap.put("sul_pw", pw);
			pMap.put("sul_text", u_text);
			pMap.put("sul_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/sulBoard.jsp";
			
			logger.info("<Controller> ---> if(�샎�닠)醫낅즺");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎��)�떆�옉");
			pMap.put("nol_id", id);
			pMap.put("nol_title", u_title);
			pMap.put("nol_category", category);
			pMap.put("nol_pw", pw);
			pMap.put("nol_text", u_text);
			pMap.put("nol_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/nolBoard.jsp";
			
			logger.info("<Controller> ---> if(�샎��)醫낅즺");
			
		} else {
			
			logger.info("<Controller> ---> conBoardInsert �삤瑜� �뙆�씪誘명꽣: category 媛믪쓣 �솗�씤�빐 二쇱꽭�슂 " + category);
		}
		
		logger.info("<Controller> 醫낅즺 ---> conBoardInsert �꽦怨듭뿬遺� : " + result);
		
		return viewPath;
		
	}
	
	
	/* �븘�씠�뵒 諛쏆븘�삤湲�
	 * 	@RequestParam String id,
	String u_id = hc.toUTF(id);*/
	// 寃뚯떆湲� �뙎湲� �엯�젰
	@RequestMapping("/commentInsert.hon")
	public String conBoardCommentInsert(Map<String, Object> pMap,
			@RequestParam String category,@RequestParam String id,
			@RequestParam String board_no, @RequestParam String r_text) 
				throws ServletException, IOException {
		
		int result = 0;
		
		logger.info("<Controller> ---> conBoardInsert method �떆�옉");

		String u_id = hc.toUTF(id);
		String u_category = hc.toUTF(category);
		String u_board_no = hc.toUTF(board_no);
		String u_text = hc.toUTF(r_text);
		
		logger.info("conBoardCommentInsert 媛�: " + category + id + u_board_no + u_text + " �엯�땲�떎.");
		
		List<Map<String, Object>> conCommentList = null;
		
		if("혼밥".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎諛�)�떆�옉");
			pMap.put("bab_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("bab_re_board_no", board_no);
			pMap.put("bab_re_category", category);
			pMap.put("bab_re_content", r_text);
			pMap.put("bab_re_writer", id);
			pMap.put("bab_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> conBoardCommentInsert �셿猷�");
			
			logger.info("<Controller> ---> if(�샎諛�)醫낅즺");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎�닠)�떆�옉");
			pMap.put("sul_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("sul_re_board_no", board_no);
			pMap.put("sul_re_category", category);
			pMap.put("sul_re_content", r_text);
			pMap.put("sul_re_writer", id);
			pMap.put("sul_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> conBoardCommentInsert �셿猷�");
			
			logger.info("<Controller> ---> if(�샎�닠)醫낅즺");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎�닠)�떆�옉");
			pMap.put("nol_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("nol_re_board_no", board_no);
			pMap.put("nol_re_category", category);
			pMap.put("nol_re_content", r_text);
			pMap.put("nol_re_writer", id);
			pMap.put("nol_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> if(�샎�닠)醫낅즺");
			
		} else {
			
			logger.info("<Controller> ---> conBoardCommentInsert �삤瑜� �뙆�씪誘명꽣: category 媛믪쓣 �솗�씤�빐 二쇱꽭�슂 " + category);
			
		}
		
		logger.info("<Controller> 醫낅즺 ---> conBoardCommentInsert �꽦怨듭뿬遺� : " + result);
		
		// "babView.jsp";
		return "";
	}
	
	
	// 寃뚯떆湲� �궘�젣
	@RequestMapping("/boardDelete.hon")
	public String conBoardDelete(Map<String, Object> pMap,
			@RequestParam String category, @RequestParam String no) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardDelete method �떆�옉");
		
		pMap = new HashMap<String, Object>();
		pMap.put("bab_no", no);
		pMap.put("sul_no", no);
		pMap.put("nol_no", no);
		
		int result = 0;
		result = boardLogic.logBoardDelete(pMap, category);
		
		logger.info("<Controller> ---> conBoardDelete 寃곌낵 : " + result);
		
		return"redirect:../boardList/mainBoardList.jsp";
	}
	
	
	// 寃뚯떆湲� �뾽�뜲�씠�듃
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
		
		logger.info("<Controller> ---> conBoardUpdate method �떆�옉");
		int result = 0;
		result = boardLogic.logBoardUpdate(pMap, category);
		logger.info("<Controller> ---> conBoardUpdate 寃곌낵 : " + result);
		
		return "redirect:../boardList/mainBoardList.jsp";
	}
	
	
	// 寃뚯떆湲� �뾽�뜲�씠�듃 �꽌釉� Modify
	@RequestMapping("/boardUpdateSub.hon")
	public String conBoardUpdateSub(@RequestParam String category, @RequestParam String no,
			Map<String, Object> pMap, HttpServletRequest req, HttpServletResponse res) 
					throws ServletException, IOException {
		
		int result = 0;
		logger.info("<Controller> ---> conBoardUpdateSub method �떆�옉");
		
		List<Map<String, Object>> conBoardUpdateSub = null;
		pMap = new HashMap<String,Object>();
		
		if("혼밥".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎諛�)�떆�옉");
			pMap.put("bab_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(�샎諛�)醫낅즺");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎�닠)�떆�옉");
			pMap.put("sul_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(�샎�닠)醫낅즺");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Controller> ---> if(�샎��)�떆�옉");
			pMap.put("nol_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(�샎��)醫낅즺");
			
		} else {
			
			logger.info("<Controller> 醫낅즺 ---> conBoardCommentInsert �꽦怨듭뿬遺� : " + result);
			
		}
		
		req.setAttribute("conBoardUpdateSub", conBoardUpdateSub);
		req.setAttribute("category", category);
		
		logger.info("<Controller> 醫낅즺 ---> conBoardUpdateSub �꽦怨듭뿬遺� : " + result);
		
		return "forward:../boardList/writeModify.jsp";
		
	}
	
	
	
	@RequestMapping("/boardMaxHit.hon")
	public String conBoardMaxHitList(Map<String, Object> pMap,
			HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardMaxHitList method �떆�옉");
		
		List<Map<String, Object>> conBoardBabHitMax = null;
		List<Map<String, Object>> conBoardSulHitMax = null;
		List<Map<String, Object>> conBoardNolHitMax = null;
		
		pMap = new HashMap<String, Object>();
		
		// Logic method �샇異�
		conBoardBabHitMax = boardLogic.logBabBoardHitMax(pMap);
		req.setAttribute("conBoardBabHitMax", conBoardBabHitMax);
		conBoardSulHitMax = boardLogic.logSulBoardHitMax(pMap);
		req.setAttribute("conBoardSulHitMax", conBoardSulHitMax);
		conBoardNolHitMax = boardLogic.logNolBoardHitMax(pMap);
		req.setAttribute("conBoardNolHitMax", conBoardNolHitMax);
		
		logger.info("<Controller> 醫낅즺 ---> conBoardBabHitMax �쟾泥� 議고쉶 �궗�씠利�: " + conBoardBabHitMax.size());
		logger.info("<Controller> 醫낅즺 ---> conBoardSulHitMax �쟾泥� 議고쉶 �궗�씠利�: " + conBoardSulHitMax.size());
		logger.info("<Controller> 醫낅즺 ---> conBoardNolHitMax �쟾泥� 議고쉶 �궗�씠利�: " + conBoardNolHitMax.size());
		
		return "forward:../boardList/mainBoardList.jsp";
		
	}
	
	

}
