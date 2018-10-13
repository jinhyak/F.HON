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
	
	// json�� �Ѱ��ش�.
	
	// <ȥ��>, <ȥ��>, <ȥ��> ��� �Խñ� ��� ��ȸ Controller
	@ResponseBody
	@RequestMapping("/boardList.hon")
	public Map<String, List<Map<String, Object>>> conBoardList(@RequestParam String key, Map<String, Object> pMap) throws ServletException, IOException {
		
		logger.info("conBoardList �޼ҵ� ����");
		
		// �ش� ������ key�� �޾ƿ���....
		logger.info("key �� : " + key);
		
		List<Map<String, Object>> conBoardList = null;
		Map<String, List<Map<String, Object>>> pMapList = new HashMap<String, List<Map<String, Object>>>();
		 
		// Json�� ������ ������ ��
		conBoardList = boardLogic.boardListLogic(pMap, key);
		logger.info("conBoardList�� : " + conBoardList.size());
		
		pMapList.put("data", conBoardList);
		logger.info(" Controller - conBoardList �޼ҵ带 �����մϴ�.");
		
		return pMapList;
		
	}
	
	
	
	// <ȥ��>, <ȥ��>, <ȥ��> �ش� �Խñ� ��ȸ Controller
	@RequestMapping("/boardOne.hon")
	public String conBoardOneList(@RequestParam String key, @RequestParam String num,
			Map<String, Object> pMap, Model model) 
					throws ServletException, IOException {
		
		String viewList = null;
		logger.info("conBoardOneList �޼ҵ� ����");
		
		// �ش� ������ key�� �޾ƿ���....
		logger.info("key �� : " + key + ", " + "Number �� : " + num);
		List<Map<String, Object>> conBoardOneList = null;
		List<Map<String, Object>> conCommentList = null;
		pMap = new HashMap<String,Object>();
		
		if("ȥ��".equals(key)) {
			
			logger.info("conBoardOneList if <ȥ��> ����");
			viewList = "forward:babView.jsp";
			pMap.put("bab_no", num);
			
			conBoardOneList = boardLogic.boardOneListLogic(pMap, key);
			pMap.put("bab_re_category", key);
			pMap.put("bab_re_board_no", num);
			
			logger.info("conBoardOneList -- ��� �ʰ� : " + pMap.get("bab_re_category") + " , " + pMap.get("bab_re_board_no"));
			conCommentList = boardLogic.CommentListLogic(pMap,num, key);
			
			model.addAttribute("conCommentList", conCommentList);
			
			logger.info("conCommentList�� : " + conBoardOneList.size());
			logger.info("conCommentList �޼ҵ� ����");
		} else if("ȥ��".equals(key)) {
			
			logger.info("conBoardOneList if <ȥ��> ����");
			viewList = "forward:sulView.jsp";
			pMap.put("sul_no", num);
			
			conBoardOneList = boardLogic.boardOneListLogic(pMap, key);
			logger.info("conBoardOneList�� : " + conBoardOneList.size());
			
		} else if("ȥ��".equals(key)) {
			
			logger.info("conBoardOneList if <ȥ��> ����");
			viewList = "forward:nolView.jsp";
			pMap.put("nol_no", num);
			
			conBoardOneList = boardLogic.boardOneListLogic(pMap, key);
			logger.info("conBoardOneList�� : " + conBoardOneList.size());
			
		} else {
			
			logger.info("conBoardOneList - <<���� �߻�>> : �Ķ���Ͱ��� Ȯ���ϼ���"+ "key : " + key + ", num :" + num);
			
		}
		
		model.addAttribute("conBoardOneList", conBoardOneList);
		
		logger.info(" Controller - conBoardOneList �޼ҵ带 �����մϴ�.");
		
		return viewList;
		
	}
	
	
	
	// <ȥ��>, <ȥ��>, <ȥ��> INSERT Controller
		@RequestMapping("/boardInsert.hon")
		public String conBoardInsert(@RequestParam String key,
				@RequestParam String url, @RequestParam String category,
				@RequestParam String title, @RequestParam String t_text,
				Map<String, Object> pMap) 
						throws ServletException, IOException {
			
			// �׽�Ʈ�� ��
			HangulConversion hc = new HangulConversion();
			
			String name = "beyonce200";
			String pw = "1234";
			
			String n_url = hc.toUTF(url);
			String n_category = hc.toUTF(category);
			String n_title = hc.toUTF(title);
			String n_t_text = hc.toUTF(t_text);
			
			
			int result = 0;
			logger.info("conBoardInsert �޼ҵ� ����");
			
			// �ش� ������ key�� �޾ƿ���....
			logger.info("key �� : " + key);
			logger.info("�Ķ���� �� : " + "�ؽ�Ʈ �� : " + n_t_text + "\n ����: "  + n_title + " ī�װ�: " + n_category + " URL :" + n_url);
			pMap = new HashMap<String, Object>();
			
			if("ȥ��".equals(key)) {
				
				pMap.put("bab_id", name);
				pMap.put("bab_title", n_title);
				pMap.put("bab_category", n_category);
				pMap.put("bab_pw", pw);
				pMap.put("bab_text", n_t_text);
				pMap.put("bab_url", n_url);
				
				logger.info("<ȥ��> INSERT �غ���");
				result = boardLogic.boardInsertLogic(pMap, key);
				
			} else if("ȥ��".equals(key)) {
				
				pMap.put("sul_id", name);
				pMap.put("sul_title", n_title);
				pMap.put("sul_category", n_category);
				pMap.put("sul_pw", pw);
				pMap.put("sul_text", n_t_text);
				pMap.put("sul_url", n_url);
				
				logger.info("<ȥ��> INSERT �غ���");
				result = boardLogic.boardInsertLogic(pMap, key);
				
			} else if("ȥ��".equals(key)) {
				
				pMap.put("nol_id", name);
				pMap.put("nol_title", n_title);
				pMap.put("nol_category", n_category);
				pMap.put("nol_pw", pw);
				pMap.put("nol_text", n_t_text);
				pMap.put("nol_url", n_url);
				
				logger.info("<ȥ��> INSERT �غ���");
				result = boardLogic.boardInsertLogic(pMap, key);
				
			} else {
				
				logger.info("<<���� �߻�>> key �� Ȯ�� : " + key);
				
			}
			
			logger.info("result �� : " + result);
			
			logger.info(" Controller - conBoardInsert �޼ҵ带 �����մϴ�.");
			
			return "redirect:mainBoardList.jsp";
			
		}

		
		// <ȥ��>, <ȥ��>, <ȥ��> DELETE Controller
		@RequestMapping("/boardDelete.hon")
		public String conBoardDelete(Map<String, Object> pMap,
				@RequestParam String category, @RequestParam String id,
				@RequestParam String no) 
						throws ServletException, IOException{
			
			logger.info("Controller - conBoardDelete �޼ҵ� ����");
			
			int result = 0;
			logger.info("������ �� = ī�װ� :  " + category + " id : " + id + " num : " + no);
			pMap = new HashMap<String, Object>();
			
			if("ȥ��".equals(category)) {
				
				logger.info("ȥ�� �Խñ� ���� ����");
				pMap.put("bab_id", id);
				pMap.put("bab_no", no);
				pMap.put("bab_category", category);
				result = boardLogic.boardDeleteLogic(pMap, category);
				logger.info("ȥ�� �Խñ� ���� ��");
				
			} else if("ȥ��".equals(category)) {
				
				logger.info("ȥ�� �Խñ� ���� ����");
				pMap.put("sul_id", id);
				pMap.put("sul_no", no);
				pMap.put("sul_category", category);
				result = boardLogic.boardDeleteLogic(pMap, category);
				logger.info("ȥ�� �Խñ� ���� ��");
				
			} else if("ȥ��".equals(category)) {
				
				logger.info("ȥ�� �Խñ� ���� ����");
				pMap.put("nol_id", id);
				pMap.put("nol_no", no);
				pMap.put("nol_category", category);
				result = boardLogic.boardDeleteLogic(pMap, category);
				logger.info("ȥ�� �Խñ� ���� ��");
				
			} else {
				logger.info("<<�����߻�>> key���� Ȯ���ϼ���~");
			}
			
			logger.info("���� ���� ���� : " + result);
			logger.info("Controller - conBoardDelete �޼ҵ� ����");
			return "redirect:mainBoardList.jsp";
		}
		
		
		
		// <ȥ��>, <ȥ��>, <ȥ��> UPDATE Controller
				@RequestMapping("/Update.hon")
				public String conBoardUpdate(Map<String, Object> pMap,
						@RequestParam String category,
						@RequestParam String num, @RequestParam String title,
						@RequestParam String t_text, @RequestParam String url) 
								throws ServletException, IOException{
					
					logger.info("Controller ----------- conBoardUpdate �޼ҵ� ����");
					HangulConversion hc = new HangulConversion();
					
					String id = "beyonce200";
					String pw = "1234";
					String n_category = hc.toUTF(category);
					String n_url = hc.toUTF(url);
					String n_title = hc.toUTF(title);
					String n_t_text = hc.toUTF(t_text);
					
					
					
					int result = 0;
					logger.info("������ ��  :  "+ n_t_text + n_title + n_category + " id : " + id + " num : " + num + " , :" + n_url );
					pMap = new HashMap<String, Object>();
					
					if("ȥ��".equals(n_category)) {
						
						logger.info("<ȥ��>  if �Խñ� ���� ����");
						pMap.put("bab_id", id);
						pMap.put("bab_no", num);
						pMap.put("bab_title", n_title);
						pMap.put("bab_text", n_t_text);
						pMap.put("bab_url", n_url);
						result = boardLogic.boardUpdateLogic(pMap, n_category);
						logger.info("<ȥ��> �Խñ� ���� ��");
						
					} else if("ȥ��".equals(n_category)) {
						
						logger.info("ȥ�� �Խñ� ���� ����");
						pMap.put("sul_id", id);
						pMap.put("sul_no", num);
						pMap.put("sul_title", n_title);
						pMap.put("sul_text", n_t_text);
						pMap.put("sul_url", n_url);
						result = boardLogic.boardUpdateLogic(pMap, n_category);
						logger.info("<ȥ��> if  �Խñ� ���� ��");
						
					} else if("ȥ��".equals(n_category)) {
						
						logger.info("<ȥ��> if �Խñ� ���� ����");
						pMap.put("nol_id", id);
						pMap.put("nol_no", num);
						pMap.put("nol_title", n_title);
						pMap.put("nol_text", n_t_text);
						pMap.put("nol_url", n_url);
						result = boardLogic.boardUpdateLogic(pMap, n_category);
						logger.info("<ȥ��> �Խñ� ���� ��");
						
					} else {
						
						logger.info("<<�����߻�>> key���� Ȯ���ϼ���~");
						
					}
					
					logger.info("���� ���� ���� : " + result);
					logger.info("Controller - conBoardUpdate �޼ҵ� ����");
					
					return "redirect:mainBoardList.jsp";
				}
				
				// <ȥ��>, <ȥ��>, <ȥ��> �ش� �Խñ� ��ȸ Controller
				@RequestMapping("/boardUpdateSub.hon")
				public String conBoardUpdateSub(@RequestParam String key, @RequestParam String num,
						Map<String, Object> pMap, HttpServletRequest req, HttpServletResponse res) 
								throws ServletException, IOException {
					
					logger.info("conBoardUpdateSub �޼ҵ� ����");
					
					// �ش� ������ key�� �޾ƿ���....
					logger.info("key �� : " + key + ", " + "Number �� : " + num);
					List<Map<String, Object>> conBoardUpdateSubList = null;
					pMap = new HashMap<String,Object>();
					
					if("ȥ��".equals(key)) {
						
						logger.info("conBoardUpdateSubList if <ȥ��> ����");
						pMap.put("bab_no", num);
						
						conBoardUpdateSubList = boardLogic.boardOneListLogic(pMap, key);
						logger.info("conBoardUpdateSubList�� : " + conBoardUpdateSubList.size());
						
					} else if("ȥ��".equals(key)) {
						
						logger.info("conBoardUpdateSubList if <ȥ��> ����");
						pMap.put("sul_no", num);
						
						conBoardUpdateSubList = boardLogic.boardOneListLogic(pMap, key);
						logger.info("conBoardUpdateSubList�� : " + conBoardUpdateSubList.size());
						
					} else if("ȥ��".equals(key)) {
						
						logger.info("conBoardUpdateSubList if <ȥ��> ����");
						pMap.put("nol_no", num);
						
						conBoardUpdateSubList = boardLogic.boardOneListLogic(pMap, key);
						logger.info("conBoardUpdateSubList�� : " + conBoardUpdateSubList.size());
						
					} else {
						
						logger.info("conBoardUpdateSub - <<���� �߻�>> : �Ķ���Ͱ��� Ȯ���ϼ���"+ "key : " + key + ", num :" + num);
						
					}
					
					req.setAttribute("conBoardUpdateSubList", conBoardUpdateSubList);
					req.setAttribute("categoryKey", key);
					
					logger.info(" Controller - conBoardUpdateSub �޼ҵ带 �����մϴ�.");
					
					return "forward:writeModify.jsp";
					
				}
				
				// ��� SELECT ��ȸ =============================================================
				public List<Map<String, Object>> conCommentList(Map<String, Object> pMap, 
						String no, String category, HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
					
					logger.info("Controller - conCommentList ����");
					
					List<Map<String, Object>> conCommentList = null;
					conCommentList = boardLogic.CommentListLogic(pMap, no, category);
					
					logger.info("conCommentList ���̴�: " + conCommentList.get(0));
					logger.info("Controller - conCommentList ��");
					
					return conCommentList;
					
				}
				
				// ===============================================================================
				
				
				// ��� INSERT �Է�
				@RequestMapping("/commentInsert.hon")
				public String conCommentInsert(Map<String, Object> pMap,
						@RequestParam String bab_re_category, @RequestParam String bab_re_board_no,
						@RequestParam String bab_re_content,
						HttpServletRequest req, HttpServletResponse res) {
					
					logger.info("conCommentInsert �޼ҵ� ����");
					
					List<Map<String, Object>> conCommentList = null;
					pMap = new HashMap<String, Object>();
					int result = 0;
					
					HangulConversion hc = new HangulConversion();
					String bab_re_writer = "beyonce200";
					
			/*		String n_bab_re_category = hc.toUTF(bab_re_category);
					String n_nobab_re_board_no = hc.toUTF(bab_re_board_no);
					String n_bab_re_content = hc.toUTF(bab_re_content);*/
					
					logger.info("������ ��: " + bab_re_category + " , " +
							bab_re_board_no + " , " + bab_re_content);
					
					pMap.put("bab_re_board_no", bab_re_board_no);
					conCommentList = boardLogic.CommentListLogic(pMap, bab_re_board_no, bab_re_category);
					logger.info("����Ʈ ��ȸ �Ϸ�- ��� ī��Ʈ �����...");
					
					pMap.put("bab_re_board_no", bab_re_board_no);
					pMap.put("bab_re_category", bab_re_category);
					pMap.put("bab_re_content", bab_re_content);
					pMap.put("bab_re_writer", bab_re_writer);
					pMap.put("bab_re_no", conCommentList.size());
					
					logger.info("����Ϸ� !: ");
					result = boardLogic.CommentInsertLogic(pMap, bab_re_board_no, bab_re_category);
					
					logger.info("Controller - conCommentInsert �޼ҵ� ��");
					
					
//					return "babView.jsp";
					return "";
				}
				
				
}
