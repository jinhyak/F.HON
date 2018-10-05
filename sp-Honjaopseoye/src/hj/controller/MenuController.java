package hj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hj.dao.MenuDao;
import hj.logic.MenuLogic;

@Controller
@RequestMapping("/menu")
public class MenuController {
	Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private MenuLogic menuLogic = null;

	@Autowired
	private MenuDao menuDao = null;

	/* 공지사항 */
	@ResponseBody
	@RequestMapping("/nSelect.hon")
	public String nSelect(Model mod
			, @RequestParam Map<String, Object> pMap
			, HttpServletResponse res) {
		logger.info("nSelect 메소드 호출");
		List<Map<String, Object>> list = null;
		list = menuLogic.nSelect(pMap);
		return "redirect:./join";
	}

	/* 공지사항 글쓰기 */
	@RequestMapping("/nInsert.hon")
	public int nInsert(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		logger.info("nInsert 메소드 호출");
		int result = 0;
		result = menuDao.nInsert(pMap);
		return result;
	}

	/* 문의하기 */
	@RequestMapping("/qInsert.hon")
	public int qInsert(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		logger.info("qInsert 메소드 호출");
		int result = 0;
		result = menuDao.qInsert(pMap);
		return result;
	}

	/* 문의 게시판 */
	@ResponseBody
	@RequestMapping("/qSelect.hon")
	public String qSelect(Model mod
			, @RequestParam Map<String, Object> pMap
			, HttpServletResponse res){
			logger.info("qSelect 메소드 호출");
			List<Map<String,Object>> list = null;
			list = menuLogic.qSelect(pMap);
			return "";
	}

}
