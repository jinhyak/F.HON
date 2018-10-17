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
@RequestMapping("/menu")
public class MenuController {
	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private MenuLogic menuLogic = null;

	@Autowired
	private QnALogic qnaLogic = null;
	
	@Autowired
	private MenuDao menuDao = null;
	
		@ResponseBody
		@RequestMapping("/nSelect.hon")
		public Map<String, List<Map<String, Object>>> nSelect(Model mod) {
			logger.info("nSelect �޼ҵ� ȣ��");
			List<Map<String, Object>> list = null;
			list = menuLogic.nSelect();
			Map<String, List<Map<String,Object>>> pMap = new HashMap<String, List<Map<String,Object>>>();
			pMap.put("data", list);
			logger.info(pMap);
			return pMap;
		}
		/* �������� �󼼺��� */
		@RequestMapping(value="/noticeDetail.hon",method= {RequestMethod.POST, RequestMethod.GET})
		public String nView(@RequestParam String NOTI_NO, Model mod){ 
			logger.info("Controller : You succeed in calling nView!");
			List<Map<String, Object>> notiList = null;
			notiList = menuLogic.nView(NOTI_NO);
			logger.info("noti_no : "+notiList);
			mod.addAttribute("notiList",notiList);
			return "forward:/notice/notice/nView.jsp";
		} 	
		/* �������� �۾��� */
		@RequestMapping("/nInsert.hon")
		public String nInsert(Model mod
				, @RequestParam Map<String,Object> pMap
				, HttpServletResponse res) {
			logger.info("nInsert �޼ҵ� ȣ��");
			int result = 0;
			result = menuDao.nInsert(pMap);
			return "redirect:../notice/notice.jsp";
		}
		/* �����ϱ� */
		@RequestMapping(value="/qInsert.hon",method={RequestMethod.POST, RequestMethod.GET})
		public String qInsert(Model mod, @RequestParam Map<String,Object> pMap, HttpServletRequest req) {
			logger.info("qInsert �޼ҵ� ȣ��");
			int result = 0;
			//result = menuLogic.qInsert(req, pMap);
			return "forward:/notice/qna/qnaRead.jsp";
		}
		/* ���� �Խ��� */
		@ResponseBody
		@RequestMapping(value="/qSelect.hon",method={RequestMethod.POST, RequestMethod.GET})
		public Map<String, List<Map<String, Object>>> conQnaBoardList(Model mod, @RequestParam Map<String,Object> pMap){
			logger.info("qSelect �޼ҵ� ����");
			List<Map<String, Object>> conQnaBoardList = new ArrayList<Map<String, Object>>();
			Map<String, List<Map<String, Object>>> pMapList = new HashMap<String, List<Map<String, Object>>>();
			try {
				conQnaBoardList = qnaLogic.qnaBoardListLogic();
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			logger.info("qSelect index : " + conQnaBoardList.size());
			pMapList.put("data", conQnaBoardList);
			return pMapList;
		}
		@RequestMapping("/qView.hon")
		public String qView(HttpServletRequest req, HttpServletResponse res,
				@RequestParam String qna_no, Map<String, Object> pMap)
						throws ServletException, IOException {
			logger.info("qView �޼ҵ� ����");
			List<Map<String, Object>> conQnABoardIdList = null;
			pMap = new HashMap<String, Object>();
			pMap.put("qna_no", qna_no);
			conQnABoardIdList = qnaLogic.qnaBoardIdListLogic(pMap);
			req.setAttribute("conQnABoardIdList", conQnABoardIdList);
			return "forward:../notice/qna/qnaView.jsp";
		}
		@RequestMapping("/qnaInsert.hon")
		public String qnaBoardInsert(@RequestParam String qna_category, 
				@RequestParam String qna_title, @RequestParam String qna_content,
				@RequestParam String qna_pw, Map<String, Object> pMap) 
				throws ServletException, IOException {
			
			logger.info("qnaBoardInsert �޼ҵ� ����");
			int result = 0;
			HangulConversion hc = new HangulConversion();
			String id = "beyonce200";
			String n_qna_pw = hc.toUTF(qna_pw);
			String n_qna_category = hc.toUTF(qna_category);
			String n_qna_title = hc.toUTF(qna_title);
			String n_qna_content = hc.toUTF(qna_content);
			
			logger.info("ī�װ� : " + n_qna_category + " ��й�ȣ: " + n_qna_pw  +" ����: " + n_qna_title + " ���� : " + n_qna_content + " ���̵�:  " + id);
			
			
			pMap = new HashMap<String, Object>();
			
			pMap.put("qna_writer", id);
			pMap.put("qna_title", n_qna_title);
			pMap.put("qna_category", n_qna_category);
			pMap.put("qna_pw", n_qna_pw);
			pMap.put("qna_content", n_qna_content);
			
			result = qnaLogic.qnaBoardInsertLogic(pMap);
					
			logger.info("INSERT �Ϸ� : " + result);
			
			logger.info("qnaBoardInsert �޼ҵ� ����>>>>>>>>>>>>>>");
			return "redirect:../notice/qna/qna.jsp";
			
		}
		
	/* ���� ���� */
	@RequestMapping("/qnaDelete.hon")
	public String qnaBoardDelete(@RequestParam String no,
			@RequestParam String id, Map<String, Object> pMap)
	throws ServletException, IOException {
		
		logger.info("id : " + id + "no : " + no);
		int result = 0;
		logger.info("qnaBoardDelete �޼ҵ� ����");
		
		pMap = new HashMap<String, Object>();
		pMap.put("qna_writer", id);
		pMap.put("qna_no", no);
		result = qnaLogic.qDelete(pMap);
		
		logger.info("qnaBoardDelete ���� ��� : " + result);
		return "redirect:../notice/qna/qna.jsp";
	}

	/* qna ���� �Խñ� ����ϱ� */
	@RequestMapping("/qUpdate.hon")
		public String qUpdate(@RequestParam String qna_content,
				@RequestParam String qna_title, @RequestParam String qna_no,
				Map<String, Object> pMap)
						throws ServletException, IOException {
			
			HangulConversion hc = new HangulConversion();
			int result = 0;
			
			logger.info("qnaBoardUpdate �޼ҵ� ����");
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
			logger.info("qnaBoardUpdate ��� : " + result);
			
			return"redirect:../notice/qna/qna.jsp";
		}
	
	/* qna �Խñ� �����ϱ� */
	@RequestMapping("/qUpdateSub.hon")
	public String qUpdateSub(HttpServletRequest req, HttpServletResponse res,
			@RequestParam String qna_no, Map<String, Object> pMap)
					throws ServletException, IOException {
		logger.info("qUpdateSub �޼ҵ� ����");
		List<Map<String, Object>> conQnABoardIdList = null;
		pMap = new HashMap<String, Object>();
		pMap.put("qna_no", qna_no);
		conQnABoardIdList = qnaLogic.qnaBoardIdListLogic(pMap);
		req.setAttribute("conQnABoardIdList", conQnABoardIdList);
		return "forward:../notice/qna/qnaWriteModify.jsp";
	}
}
