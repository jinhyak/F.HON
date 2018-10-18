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

	@Autowired
	private MenuLogic menuLogic = null;
	
	@Autowired
	private QnALogic qnaLogic = null;
		
	@Autowired
	private MenuDao menuDao = null;
	
		/*공지사항 글 등록*/
		@RequestMapping(value= {"/nInsert.hon"}, produces="text/html; charset=UTF-8")
		public String nInsert(MultipartHttpServletRequest mreq, MultipartFile noti_file, @RequestParam Map<String, Object> pMap)
			                
		{
		logger.info("nInsert 호출 성공");
		String fileName = HangulConversion.toKor(noti_file.getOriginalFilename());
		String path = "C:\\git\\F.HON\\sp-Honjaopseoye\\WebContent\\file\\";
		String not_dup_file = null; //중복되지 않게 바꾼 파일명 담긴 변수
			File file = new File(path);
			if(!file.exists()) {//파일이 존재하지 않으면
				file.mkdir();//디렉토리 생성
			}
			//파일이름 변경
			UUID uuid = UUID.randomUUID();//파일 이름 랜덤
			logger.info(uuid);
			File newFile = null;
			Iterator<String> files = mreq.getFileNames(); // 파일 이름을 얻어옴
			while(files.hasNext()) {//파일이 존재함??
				String uploadFile = files.next();//존재함ㅇㅇ 그러면 다음 파일 읽어오셈
				logger.info("file while문 탐"+uploadFile);
				noti_file = mreq.getFile(uploadFile); //mreq에서 파일을 가져옴
				 fileName = noti_file.getOriginalFilename(); //초기 파일명으로 돌려놓기
				 logger.info("fileName은 "+fileName);
				 not_dup_file = uuid+"_"+fileName; //중복될 경우 uuid를 넣어서 새로 파일이름을 만들어 줌
				 newFile = new File(path, not_dup_file); //File에 경로(디렉토리 경로), 중복될 경우 바꾼 파일명 넣기
				 
				 try {
					noti_file.transferTo(newFile); //업로드 한 파일 데이터를 지정한 파일에 저장한다.
				 }catch(IOException e){
					 logger.info("error : " + e.toString());
				 }
				 
				
			} // end of while
		//DB연동 처리
		int result = 0;
		if(newFile != null) {
			pMap.put("fileName",not_dup_file); //파라미터에 fileName 등록 
		}
		logger.info(pMap.get("noti_title"));
		logger.info(pMap.get("noti_writer"));
		logger.info(pMap.get("noti_content"));
		logger.info(pMap.get("noti_category"));
		logger.info(pMap.get("fileName"));
		logger.info(pMap.get("noti_title"));
		logger.info(pMap.get("noti_pw"));
		result = menuDao.nInsert(pMap);
		
		
		return "redirect:/notice/notice/notice.jsp";//꼭 확인
		}
	
		/* 공지사항 글 수정 */
		@RequestMapping(value="/nUpdate.hon")
		public String proc_update(@RequestParam Map<String, Object> pMap, Model mod) throws IOException{
			List<Map<String, Object>> updateList = new ArrayList<Map<String, Object>>();
			updateList = menuDao.proc_update(pMap);
			if(updateList!=null) {
				logger.info("updateList : "+updateList);
				mod.addAttribute("updateList",updateList);
			}
			
			return "forward:/notice/notice/nView.jsp";
		}	
	
	
		/* 공지사항 글 삭제 */
		@RequestMapping(value="/nDelete.hon")
		public String nDelete(@RequestParam String NOTI_NO) {
			logger.info("nDelete 호출 성공");
			int result = 0;
			result = menuDao.nDelete(NOTI_NO);
			return "redirect:/notice/notice/notice.jsp";
		}
		/* 공지사항 글 수정*/
	
		
		/*	@RequestMapping(value = "/noticePN.hon")
		public String PN_select(@RequestParam String NOTI_NO, Model mod) {
			logger.info("Controller : You succeed in calling pn_select!");
			List<Map<String, Object>> PN_select = null;
			PN_select = menuLogic.PN_select(NOTI_NO);
			String NOTI_TITLE = PN_select.get(0).get("PREV_TITLE").toString();
			logger.info("pn_select : " + PN_select);
			return "forward:/notice/notice/nView.jsp";
		}*/

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
		/* 공지사항 상세보기 */
		@RequestMapping(value = "/noticeDetail.hon", method = { RequestMethod.POST, RequestMethod.GET })
		public String nView(@RequestParam String NOTI_NO, Model mod) {
			logger.info("Controller : You succeed in calling nView!");
			//상세보기
			List<Map<String, Object>> notiList = null;
			//이전번호, 다음번호 가져오기
			List<Map<String, Object>> PN_select = null;
			try {
				notiList = menuLogic.nView(NOTI_NO);
				PN_select = menuLogic.PN_select(NOTI_NO);
			} catch (IndexOutOfBoundsException e) {
				logger.info(e.getMessage()+", "+e.toString());
			}
			
			logger.info("noti_no : " + notiList);
			logger.info("PN_select"+PN_select);
			
			mod.addAttribute("notiList", notiList);
			
			PN_select.get(0).get("NOTI_NO");
			PN_select.get(0).get("NEXT_NOTI_NO");
			PN_select.get(0).get("NEXT_TITLE");
			PN_select.get(0).get("PREV_NOTI_NO");
			PN_select.get(0).get("PREV_TITLE");
			
			
			mod.addAttribute("PN_select", PN_select);
			
			return "forward:/notice/notice/nView.jsp";
		}
		/* 문의하기 */
		@RequestMapping(value="/qInsert.hon",method={RequestMethod.POST, RequestMethod.GET})
		public String qInsert(Model mod, @RequestParam Map<String,Object> pMap, HttpServletRequest req) {
			logger.info("qInsert 메소드 호출");
			int result = 0;
			//result = menuLogic.qInsert(req, pMap);
			return "forward:/notice/qna/qnaRead.jsp";
		}
		/* 문의 게시판 */
		@ResponseBody
		@RequestMapping(value="/qSelect.hon",method={RequestMethod.POST, RequestMethod.GET})
		public Map<String, List<Map<String, Object>>> conQnaBoardList(Model mod, @RequestParam Map<String,Object> pMap){
			logger.info("qSelect 메소드 진입");
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
			logger.info("qView 메소드 진입");
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
