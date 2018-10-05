package hj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hj.dao.BoardDao;
import hj.logic.BoardLogic;
import hj.util.HangulConversion;


@Controller
@RequestMapping("/board")
public class boardController {
	Logger logger = Logger.getLogger(boardController.class);

	@Autowired
	private BoardLogic boardLogic = null;

	@Autowired
	private BoardDao boardDao = null;
	
/*포스팅 보기*/
	@ResponseBody
	@RequestMapping("/postList.kjh")
	public String postList(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		List<Map<String,Object>> postList = null;
		if(pMap.containsKey("")) {
			pMap.put("sb_keyword", HangulConversion.toKor(pMap.get("sb_keyword").toString()));
		}
		try {
			postList = boardLogic.postList(pMap,res);			
			logger.info("postList 호출 성공");
			mod.addAttribute("postList", postList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:boardlist.jsp";
	}
	
/*포스팅 이동
	@RequestMapping(value="/write.hon", method = RequestMethod.POST)
	public String write(@RequestParam Map<String,Object> pMap) {
		return "redirect:write.jsp";
	}*/

/*포스팅하기*/
	@RequestMapping(value="/pInsert.hon", method = RequestMethod.POST)
	public String pInsert(@RequestParam Map<String,Object> pMap) {
		logger.info("pInsert 호출 성공");
		List<Map<String,Object>> pInsert = null;
		pInsert = boardDao.pInsert(pMap);
		return "forward:boardlist.jsp";
	}
	
/*포스트 상세보기*/
	@ResponseBody
	@RequestMapping("/pView.hon")
	public String pView(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		List<Map<String,Object>> pView = null;
		logger.info("pView 호출 성공");
		pView = boardDao.pView(pMap);
		mod.addAttribute("pView", pView);
		return "redirect:wView.jsp";
	}
	

}
