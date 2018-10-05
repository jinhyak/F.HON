package hj.controller;

import java.io.IOException;
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

import hj.dao.MemberDao;
import hj.logic.testLogic;
import hj.util.HangulConversion;

@Controller
@RequestMapping("/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	
	@Autowired
	private testLogic testLogic = null;
	
	@Autowired
	private MemberDao memberDao = null;
	
/*메인페이지 이동 테스트*/
	@RequestMapping("/empty.hon")
	public String empty(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		List<Map<String,Object>> emptyList = null;
		logger.info("empty메소드 호출");
		//tLogic.test(pMap);
		/*try {
			mDao.check(pMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return "redirect:./join/addr_result.jsp";
	}
	
/*아이디 중복 체크*/
	@ResponseBody
	@RequestMapping("/id_sel.hon")
	public String id_sel(Model mod
			, @RequestParam("id") String pMap
			, HttpServletResponse res) {
		logger.info("id_sel 메소드 호출");
		String result = "";
		logger.info("pMap" + pMap);
		result = String.valueOf(memberDao.id_sel(pMap));
		logger.info("result: "+result);
		return result;
	}
	
/*전화번호 중복 체크*/
	@ResponseBody
	@RequestMapping("/id_tel.hon")
	public String id_tel(Model mod
			, @RequestParam("tel") String pMap
			, HttpServletResponse res) {
		logger.info("id_tel 메소드 호출");
		String result = "";
		logger.info("pMap" + pMap);
		result = String.valueOf(memberDao.tel_sel(pMap));
		return result;
	}

/*가입하기*/
	@RequestMapping(value="join.hon", method=RequestMethod.POST)
	public int join(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		int result = 0;
		logger.info("join 메소드 호출");
		result = memberDao.insert(pMap);
		return result;
	}
	
/*주소검색*/
	@RequestMapping(value="doAddress.hon", method=RequestMethod.POST)
	public String doAddress(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		List<Map<String, Object>> result = null;
		logger.info("doAddress 메소드 호출");
		result = memberDao.doselect(pMap);
		logger.info("data: "+result);
		mod.addAttribute("result",result);
		//return "addr_result";
		return "forward:/member/join/result/result.jsp";
	}
	@RequestMapping(value="siAddress.hon", method=RequestMethod.POST)
	public String siAddress(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		List<Map<String, Object>> result = null;
		logger.info("siAddress 메소드 호출");
		result = memberDao.siSelect(pMap);
		logger.info("data: "+result);
		mod.addAttribute("result",result);
		return "forward:/member/join/result/result.jsp";
	}
	@RequestMapping(value="dongAddress.hon", method=RequestMethod.POST)
	public String dongAddress(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		List<Map<String, Object>> result = null;
		logger.info("dongAddress 메소드 호출");
		result = memberDao.dongSelect(pMap);
		logger.info("data: "+result);
		mod.addAttribute("result",result);
		return "forward:/member/join/result/result.jsp";
	}
	@RequestMapping(value="deAddress.hon", method=RequestMethod.POST)
	public String deAddress(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		List<Map<String, Object>> result = null;
		logger.info("deAddress 메소드 호출");
		result = memberDao.detailSelect(pMap);
		logger.info("data: "+result);
		mod.addAttribute("result",result);
		logger.info(mod);
		return "forward:/member/join/result/addr_result.jsp";
	}
	
			
	/*@RequestMapping("/login.hon")
	public String login(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		String mem_name = "";
		try {
			mem_name = aLogic.empty(pMap,res);
			logger.info("getBoardList 호출 성공");
			mod.addAttribute("login", mem_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:login.jsp";
	}*/	
	
	
}
