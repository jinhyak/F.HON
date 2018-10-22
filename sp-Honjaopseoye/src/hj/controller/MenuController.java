package hj.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hj.dao.MenuDao;
import hj.logic.MenuLogic;
import hj.logic.QnALogic;
import hj.util.HangulConversion;

@Controller
@RequestMapping("/menu")
public class MenuController {
	Logger logger = Logger.getLogger(this.getClass());
	// �ѱ� ó��
	HangulConversion hc = new HangulConversion();
	
	@Autowired
	private MenuLogic menuLogic = null;

	@Autowired
	private QnALogic qnaLogic = null;

	@Autowired
	private MenuDao menuDao = null;

	/* �������� �� ��� */
	   @RequestMapping(value = { "/nInsert.hon" }, produces = "text/html; charset=UTF-8")
	   public String nInsert(MultipartHttpServletRequest mreq, MultipartFile noti_file,  @RequestParam Map<String, Object> pMap) {
	      logger.info("nInsert ȣ�� ����");
	      // ���� ���� ���
	      String path = "C:\\git\\F.HON\\sp-Honjaopseoye\\WebContent\\image";
	      String fName = null;
	      File file = new File(path);
	      UUID uuid = UUID.randomUUID();
	      Iterator<String> files = mreq.getFileNames();
	      if(!noti_file.isEmpty()) {
	         String uploadFile = files.next();
	         MultipartFile multifile = mreq.getFile(uploadFile);
	         String fileName = multifile.getOriginalFilename();
	         logger.info(fileName);
	         fName = uuid + "_" + fileName;
	         logger.info("fName : " + fName);
	         File new_File = new File(path, fName);
	         
	         try {
	            multifile.transferTo(new_File);
	         } catch (IOException e) {
	            logger.info("error : " + e.toString());
	         }
	      }else {
	         fName="";   
	      }
	         
	      // DB���� ó��
	      int result = 0;
	      logger.info(pMap.get("noti_title"));
	      logger.info(pMap.get("noti_writer"));
	      logger.info(pMap.get("noti_content"));
	      logger.info(pMap.get("noti_category"));
	      logger.info(pMap.get("noti_pw"));
	      pMap.put("fileName", fName);
	      result = menuDao.nInsert(pMap);

	      return "redirect:/notice/notice/notice.jsp";// �� Ȯ��
	   }

	/* �������� �� ���� */
	@RequestMapping(value = "/nUpdate.hon")
	public String proc_update(@RequestParam Map<String, Object> pMap, Model mod) throws IOException {
		List<Map<String, Object>> updateList = new ArrayList<Map<String, Object>>();
		updateList = menuDao.proc_update(pMap);
		if (updateList != null) {
			logger.info("updateList : " + updateList);
			mod.addAttribute("updateList", updateList);
		}

		return "forward:/notice/notice/nView.jsp";
	}

	/* �������� �� ���� */
	@RequestMapping(value = "/nDelete.hon")
	public String nDelete(@RequestParam String NOTI_NO) {
		logger.info("nDelete ȣ�� ����");
		int result = 0;
		result = menuDao.nDelete(NOTI_NO);
		return "redirect:/notice/notice/notice.jsp";
	}

	@ResponseBody
	@RequestMapping("/nSelect.hon")
	public Map<String, List<Map<String, Object>>> nSelect(Model mod) {
		logger.info("nSelect �޼ҵ� ȣ��");
		List<Map<String, Object>> list = null;
		list = menuLogic.nSelect();
		Map<String, List<Map<String, Object>>> pMap = new HashMap<String, List<Map<String, Object>>>();
		pMap.put("data", list);
		logger.info(pMap);
		return pMap;
	}

	/* �������� �󼼺��� */
	@RequestMapping(value = "/noticeDetail.hon", method = { RequestMethod.POST, RequestMethod.GET })
	public String nView(@RequestParam String NOTI_NO, Model mod) {
		logger.info("Controller : You succeed in calling nView!");
		// �󼼺���
		List<Map<String, Object>> notiList = null;
		// ������ȣ, ������ȣ ��������
		List<Map<String, Object>> PN_select = null;
		try {
			notiList = menuLogic.nView(NOTI_NO);
			PN_select = menuLogic.PN_select(NOTI_NO);
		} catch (IndexOutOfBoundsException e) {
			logger.info(e.getMessage() + ", " + e.toString());
		}

		logger.info("noti_no : " + notiList);
		logger.info("PN_select" + PN_select);

		mod.addAttribute("notiList", notiList);

		mod.addAttribute("PN_select", PN_select);

		return "forward:/notice/notice/nView.jsp";
	}

	/* �����ϱ� */
	@RequestMapping(value="/qInsert.hon",method= {RequestMethod.POST, RequestMethod.GET})
	public String qInsert(@RequestParam Map<String, Object> pMap) {
		logger.info("qInsert �޼ҵ� ȣ��"+pMap);
		String qna_writer = pMap.get("qna_writer").toString();
		String keyword = pMap.get("keyword").toString();
		String qna_title = pMap.get("qna_title").toString();
		String qna_category = pMap.get("qna_category").toString();
		String qna_content = pMap.get("qna_content").toString();
		String qna_pw = pMap.get("qna_pw").toString();
		String path = null;
		int result = 0;
		//�ѱ�ó��
		String n_qna_content = hc.toUTF(qna_content);
		pMap.put("qna_content", n_qna_content);
		logger.info("ȭ�����κ��� ���� �Ķ���� Ȯ��: "+qna_title+", "+qna_category+", "+n_qna_content);
		if("����".equals(keyword)){
			String n_qna_title = hc.toUTF(qna_title);
			String n_qna_category = hc.toUTF(qna_category);
			pMap.put("qna_title", n_qna_title);
			pMap.put("qna_category", n_qna_category);
		}else if("���".equals(keyword)) {
			String qna_depth = pMap.get("qna_depth").toString();
			String qna_step = pMap.get("qna_step").toString();
			String qna_group = pMap.get("qna_group").toString();
			pMap.put("qna_step", qna_step);
			pMap.put("qna_group", qna_group);
			pMap.put("qna_depth", qna_depth);
		}
		result = menuLogic.txqInsert(pMap);
		if(result == 1) {//��� ����
			path = "redirect:../notice/qna/qna.jsp";
		} else {//��� ����
			path = "����������";
		}
		return "redirect:../notice/qna/qna.jsp";
	}

	/* ���� �Խ��� */
	@ResponseBody
	@RequestMapping(value = "/qSelect.hon", method = { RequestMethod.POST, RequestMethod.GET })
	public Map<String, List<Map<String, Object>>> conQnaBoardList(Model mod, @RequestParam Map<String, Object> pMap) {
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

	/*���� �󼼺���*/
	@RequestMapping("/qView.hon")
	public String qView(Model mod, @RequestParam String qna_no, @RequestParam String keyword,
			Map<String, Object> pMap) throws ServletException, IOException {
		logger.info("qView �޼ҵ� ����");
		List<Map<String, Object>> conQnABoardIdList = null;
		String page = null;
		pMap = new HashMap<String, Object>();
		pMap.put("qna_no", qna_no);
		logger.info("�ƾƾƾƾ�"+keyword+qna_no);
		conQnABoardIdList = qnaLogic.qnaBoardIdListLogic(pMap);
		mod.addAttribute("conQnABoardIdList", conQnABoardIdList);
		logger.info(mod.toString());
		return "forward:../notice/qna/qnaView.jsp";
		
	}
	
	/*���� ��۰���*/
	@RequestMapping("/qReply.hon")
	public String qReply(Model mod, @RequestParam String qna_no, @RequestParam String keyword,
			Map<String, Object> pMap) throws ServletException, IOException {
		logger.info("qReply �޼ҵ� ����");
		List<Map<String, Object>> conQnABoardIdList = null;
		pMap = new HashMap<String, Object>();
		pMap.put("qna_no", qna_no);
		conQnABoardIdList = qnaLogic.qnaBoardIdListLogic(pMap);
		mod.addAttribute("conQnABoardIdList", conQnABoardIdList);
		return "forward:../notice/qna/qnaReply.jsp";
		
	}
	@RequestMapping("/qnaInsert.hon")
	public String qnaBoardInsert(@RequestParam String qna_category, @RequestParam String qna_title,
			@RequestParam String qna_content, @RequestParam String qna_pw, Map<String, Object> pMap)
			throws ServletException, IOException {

		logger.info("qnaBoardInsert �޼ҵ� ����");
		int result = 0;
		HangulConversion hc = new HangulConversion();
		String id = "beyonce200";
		String n_qna_pw = hc.toUTF(qna_pw);
		String n_qna_category = hc.toUTF(qna_category);
		String n_qna_title = hc.toUTF(qna_title);
		String n_qna_content = hc.toUTF(qna_content);

		logger.info("ī�װ� : " + n_qna_category + " ��й�ȣ: " + n_qna_pw + " ����: " + n_qna_title + " ���� : " + n_qna_content
				+ " ���̵�:  " + id);

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
	public String qnaBoardDelete(@RequestParam String no, @RequestParam String id, Map<String, Object> pMap)
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
	public String qUpdate(@RequestParam String qna_content, @RequestParam String qna_title, @RequestParam String qna_no,
			Map<String, Object> pMap) throws ServletException, IOException {

		HangulConversion hc = new HangulConversion();
		int result = 0;

		logger.info("qnaBoardUpdate �޼ҵ� ����");
		logger.info("qna_content : " + qna_content + "qna_no : " + qna_no + "qna_title : " + qna_title);

		String n_qna_content = hc.toUTF(qna_content);
		String n_qna_title = hc.toUTF(qna_title);
		String n_qna_no = hc.toUTF(qna_no);

		pMap = new HashMap<String, Object>();
		pMap.put("qna_content", n_qna_content);
		pMap.put("qna_no", n_qna_no);
		pMap.put("qna_title", n_qna_title);

		result = qnaLogic.qnaBoardUpdateLogic(pMap);
		logger.info("qnaBoardUpdate ��� : " + result);

		return "redirect:../notice/qna/qna.jsp";
	}

	/* qna �Խñ� �����ϱ� */
	@RequestMapping("/qUpdateSub.hon")
	public String qUpdateSub(HttpServletRequest req, HttpServletResponse res, @RequestParam String qna_no,
			Map<String, Object> pMap) throws ServletException, IOException {
		logger.info("qUpdateSub �޼ҵ� ����");
		List<Map<String, Object>> conQnABoardIdList = null;
		pMap = new HashMap<String, Object>();
		pMap.put("qna_no", qna_no);
		conQnABoardIdList = qnaLogic.qnaBoardIdListLogic(pMap);
		req.setAttribute("conQnABoardIdList", conQnABoardIdList);
		return "forward:../notice/qna/qnaWriteModify.jsp";
	}
}
