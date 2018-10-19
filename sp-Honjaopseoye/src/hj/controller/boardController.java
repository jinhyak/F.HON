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
	
	// Logic class ��ü ����
	@Autowired
	BoardLogic boardLogic = null;
	
	// �ѱ� ó��
	HangulConversion hc = new HangulConversion();
	
	
	// Response Json ��� ��ȸ
	@ResponseBody
	@RequestMapping("/boardList.hon")
	public Map<String, List<Map<String, Object>>> conBoardList(Map<String, Object> pMap, 
			@RequestParam String category) throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardList method ����");
		logger.info("conBoardList �Ķ���� category : " + category);
		
		List<Map<String, Object>> conBoardList = null;
		Map<String, List<Map<String, Object>>> JsonList = new HashMap<String, List<Map<String, Object>>>();
		
		// Logic method ȣ��
		conBoardList = boardLogic.logBoardList(pMap, category);
		JsonList.put("data", conBoardList);
		logger.info("<Controller> ���� ---> conBoardList ��ü ��ȸ ������: " + conBoardList.size());
		
		return JsonList;
		
	}
	
	
	// ȥ��, ȥ��, ȥ��  ��� �ش� �� ��ȸ (�ش� �Խñ� ����ȸ �����Ϳ� ��� ������)
	@RequestMapping("/boardOne.hon")
	public String conBoardOneList(Map<String, Object> pMap, Model model,
			@RequestParam String category, @RequestParam String no,
			HttpServletRequest req, HttpServletResponse res) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardOneList method ����");
		logger.info("conBoardOneList �Ķ���� category : " + category + " no : " + no);
		
		int result = 0;
		
		// JSP ��� ����
		String viewPath = null; 
		
		// List �� ��ȸ List -> ��� List�� ����
		List<Map<String, Object>> conBoardOneList = null; // �� ��ȸ List 
		List<Map<String, Object>> conBoardCommentList = null; // �� ��ȸ ������ ���� ���
		
		pMap = new HashMap<String, Object>();
		
		if("ȥ��".equals(category)) {
			
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
			// �ش� �Խñ��� ��ȣ ��ȸ
			pMap.put("bab_no", no);
			logger.info("����� �� "+pMap.get("bab_no"));
			result = boardLogic.logBoardHitUpdate(pMap, category); // ȥ�� ��ȸ��
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // ��
			viewPath = "forward:../boardList/babView.jsp";
			
			// �󼼺��� ��� ��ȸ 
			pMap.put("bab_re_category", category);
			pMap.put("bab_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("bab_re_category") + " , " + pMap.get("bab_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			pMap.put("bab_re_board_no", no);
			logger.info("<Controller> ---> conBoardCommentList ��ü ��ȸ ������: " + conBoardCommentList.size());
			
			// request ��� ��ȸ ����
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)){
			logger.info("<Controller> ---> if(ȥ��)����");
			
			// �ش� �Խñ��� ��ȣ ��ȸ
			pMap.put("sul_no", no);
			result = boardLogic.logBoardHitUpdate(pMap, category); // ȥ�� ��ȸ��
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // ��
			viewPath = "forward:../boardList/sulView.jsp";
			
			// �󼼺��� ��� ��ȸ 
			pMap.put("sul_re_category", category);
			pMap.put("sul_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("sul_re_category") + " , " + pMap.get("sul_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList ��ü ��ȸ ������: " + conBoardCommentList.size());
			
			// request ��� ��ȸ ����
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)) {
			logger.info("<Controller> ---> if(ȥ��)����");
			
			// �ش� �Խñ��� ��ȣ ��ȸ
			pMap.put("nol_no", no);
			result = boardLogic.logBoardHitUpdate(pMap, category); // ȥ�� ��ȸ��
			conBoardOneList = boardLogic.logBoardOneList(pMap, category, no); // ��
			viewPath = "forward:../boardList/nolView.jsp";
			
			// �󼼺��� ��� ��ȸ 
			pMap.put("nol_re_category", category);
			pMap.put("nol_re_board_no", no);
			logger.info("<Controller> ---> pMap.put -> " +pMap.get("nol_re_category") + " , " + pMap.get("nol_re_board_no"));
			conBoardCommentList = boardLogic.logBoardCommentList(pMap, category, no);
			logger.info("<Controller> ---> conBoardCommentList ��ü ��ȸ ������: " + conBoardCommentList.size());
			
			// request ��� ��ȸ ����
			req.setAttribute("conBoardCommentList", conBoardCommentList);
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else {
			
			logger.info("<Controller> ---> conBoardOneList ���� �Ķ����: category, no ���� Ȯ���� �ּ��� " + category + " , " + no);
			
		}
		
		// request �� ��ȸ ����
		req.setAttribute("conBoardOneList", conBoardOneList);
		logger.info("<Controller>" + category + " ��ȸ�� ������Ʈ ���: " + result);
		logger.info("<Controller> ���� ---> conBoardOneList ��ü ��ȸ ������: " + conBoardOneList.size());
		
		return viewPath;
	}
	
	
	
	// �Խñ� �Է�, ����, ���� //
	
	
	// �Խñ� �Է�
	@RequestMapping("/boardInsert.hon")
	public String conBoardInsert(Map<String, Object> pMap, 
			@RequestParam String id, @RequestParam String title,
			@RequestParam String category,@RequestParam String pw,
			@RequestParam String text, @RequestParam String url) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardInsert method ����");
		
		// Insert ���� ���
		String viewPath = null; 
		
		// �׽�Ʈ�� id, pw
		//String u_id = hc.toUTF(id);
		String u_title = hc.toUTF(title);
		String u_category = hc.toUTF(category);
		String u_text = hc.toUTF(text);
		
		if(url == "") {
			logger.info("������ ����");
				
			url = "0"; // �� ���� ���
		} else {
			logger.info("�ø� ������ Id�� : " + url);
			logger.info("������ ����");
		}
		
		
		int result = 0;

		// JSP �Ķ���� ��
		logger.info("�ĸ����� ���� : " + id + u_title + category + pw + u_text + url + " �Դϴ�.");
		
		pMap = new HashMap<String, Object>();
		
		if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
			pMap.put("bab_id", id);
			pMap.put("bab_title", u_title);
			pMap.put("bab_category", category);
			pMap.put("bab_pw", pw);
			pMap.put("bab_text", u_text);
			pMap.put("bab_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/babBoard.jsp";
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
			pMap.put("sul_id", id);
			pMap.put("sul_title", u_title);
			pMap.put("sul_category", category);
			pMap.put("sul_pw", pw);
			pMap.put("sul_text", u_text);
			pMap.put("sul_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/sulBoard.jsp";
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			pMap.put("nol_id", id);
			pMap.put("nol_title", u_title);
			pMap.put("nol_category", category);
			pMap.put("nol_pw", pw);
			pMap.put("nol_text", u_text);
			pMap.put("nol_url", url);
			
			result = boardLogic.logBoardInsert(pMap, category);
			viewPath = "redirect:../boardList/nolBoard.jsp";
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else {
			
			logger.info("<Controller> ---> conBoardInsert ���� �Ķ����: category ���� Ȯ���� �ּ��� " + category);
		}
		
		logger.info("<Controller> ���� ---> conBoardInsert �������� : " + result);
		
		return viewPath;
		
	}
	
	
	/* ���̵� �޾ƿ���
	 * 	@RequestParam String id,
	String u_id = hc.toUTF(id);*/
	// �Խñ� ��� �Է�
	@RequestMapping("/commentInsert.hon")
	public String conBoardCommentInsert(Map<String, Object> pMap,
			@RequestParam String category,@RequestParam String id,
			@RequestParam String board_no, @RequestParam String r_text) 
				throws ServletException, IOException {
		
		int result = 0;
		
		logger.info("<Controller> ---> conBoardInsert method ����");

		String u_id = hc.toUTF(id);
		String u_category = hc.toUTF(category);
		String u_board_no = hc.toUTF(board_no);
		String u_text = hc.toUTF(r_text);
		
		logger.info("conBoardCommentInsert ��: " + category + id + u_board_no + u_text + " �Դϴ�.");
		
		List<Map<String, Object>> conCommentList = null;
		
		if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			pMap.put("bab_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("bab_re_board_no", board_no);
			pMap.put("bab_re_category", category);
			pMap.put("bab_re_content", r_text);
			pMap.put("bab_re_writer", id);
			pMap.put("bab_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> conBoardCommentInsert �Ϸ�");
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			pMap.put("sul_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("sul_re_board_no", board_no);
			pMap.put("sul_re_category", category);
			pMap.put("sul_re_content", r_text);
			pMap.put("sul_re_writer", id);
			pMap.put("sul_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> conBoardCommentInsert �Ϸ�");
			
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			pMap.put("nol_re_board_no", board_no);
			conCommentList = boardLogic.logBoardCommentList(pMap, category, board_no);
			
			pMap.put("nol_re_board_no", board_no);
			pMap.put("nol_re_category", category);
			pMap.put("nol_re_content", r_text);
			pMap.put("nol_re_writer", id);
			pMap.put("nol_re_no", conCommentList.size());
			
			result = boardLogic.logBoardCommentInsert(pMap, category, board_no);
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else {
			
			logger.info("<Controller> ---> conBoardCommentInsert ���� �Ķ����: category ���� Ȯ���� �ּ��� " + category);
			
		}
		
		logger.info("<Controller> ���� ---> conBoardCommentInsert �������� : " + result);
		
		// "babView.jsp";
		return "";
	}
	
	
	// �Խñ� ����
	@RequestMapping("/boardDelete.hon")
	public String conBoardDelete(Map<String, Object> pMap,
			@RequestParam String category, @RequestParam String no) 
					throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardDelete method ����");
		
		pMap = new HashMap<String, Object>();
		pMap.put("bab_no", no);
		pMap.put("sul_no", no);
		pMap.put("nol_no", no);
		
		int result = 0;
		result = boardLogic.logBoardDelete(pMap, category);
		
		logger.info("<Controller> ---> conBoardDelete ��� : " + result);
		
		return"redirect:../boardList/mainBoardList.jsp";
	}
	
	
	// �Խñ� ������Ʈ
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
		
		logger.info("<Controller> ---> conBoardUpdate method ����");
		int result = 0;
		result = boardLogic.logBoardUpdate(pMap, category);
		logger.info("<Controller> ---> conBoardUpdate ��� : " + result);
		
		return "redirect:../boardList/mainBoardList.jsp";
	}
	
	
	// �Խñ� ������Ʈ ���� Modify
	@RequestMapping("/boardUpdateSub.hon")
	public String conBoardUpdateSub(@RequestParam String category, @RequestParam String no,
			Map<String, Object> pMap, HttpServletRequest req, HttpServletResponse res) 
					throws ServletException, IOException {
		
		int result = 0;
		logger.info("<Controller> ---> conBoardUpdateSub method ����");
		
		List<Map<String, Object>> conBoardUpdateSub = null;
		pMap = new HashMap<String,Object>();
		
		if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			pMap.put("bab_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			pMap.put("sul_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else if("ȥ��".equals(category)) {
			
			logger.info("<Controller> ---> if(ȥ��)����");
			pMap.put("nol_no", no);
			conBoardUpdateSub = boardLogic.logBoardOneList(pMap, category, no);
			logger.info("<Controller> ---> if(ȥ��)����");
			
		} else {
			
			logger.info("<Controller> ���� ---> conBoardCommentInsert �������� : " + result);
			
		}
		
		req.setAttribute("conBoardUpdateSub", conBoardUpdateSub);
		req.setAttribute("category", category);
		
		logger.info("<Controller> ���� ---> conBoardUpdateSub �������� : " + result);
		
		return "forward:../boardList/writeModify.jsp";
		 
	}
	
	
	
	@RequestMapping("/boardMaxHit.hon")
	public String conBoardMaxHitList(Map<String, Object> pMap,
			HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		logger.info("<Controller> ---> conBoardMaxHitList method ����");
		
		List<Map<String, Object>> conBoardBabHitMax = null;
		List<Map<String, Object>> conBoardSulHitMax = null;
		List<Map<String, Object>> conBoardNolHitMax = null;
		
		pMap = new HashMap<String, Object>();
		
		// Logic method ȣ��
		conBoardBabHitMax = boardLogic.logBabBoardHitMax(pMap);
		req.setAttribute("conBoardBabHitMax", conBoardBabHitMax);
		conBoardSulHitMax = boardLogic.logSulBoardHitMax(pMap);
		req.setAttribute("conBoardSulHitMax", conBoardSulHitMax);
		conBoardNolHitMax = boardLogic.logNolBoardHitMax(pMap);
		req.setAttribute("conBoardNolHitMax", conBoardNolHitMax);
		
		logger.info("<Controller> ���� ---> conBoardBabHitMax ��ü ��ȸ ������: " + conBoardBabHitMax.size());
		logger.info("<Controller> ���� ---> conBoardSulHitMax ��ü ��ȸ ������: " + conBoardSulHitMax.size());
		logger.info("<Controller> ���� ---> conBoardNolHitMax ��ü ��ȸ ������: " + conBoardNolHitMax.size());
		
		return "forward:../boardList/mainBoardList.jsp";
		
	}
	
	

}
