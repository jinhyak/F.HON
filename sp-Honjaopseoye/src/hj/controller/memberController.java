package hj.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class memberController {
	Logger logger = Logger.getLogger(memberController.class);
	
	@Autowired
	private testLogic testLogic = null;
	
	@Autowired
	private MemberDao memberDao = null;
	
/*���������� �̵� �׽�Ʈ*/
	@RequestMapping("/empty.hon")
	public String empty(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		List<Map<String,Object>> emptyList = null;
		logger.info("empty�޼ҵ� ȣ��");
		//tLogic.test(pMap);
		/*try {
			mDao.check(pMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return "redirect:./join/addr_result.jsp";
	}
	
/*���̵� �ߺ� üũ*/
	@RequestMapping("/id_sel.hon")
	public String id_sel(Model mod
			, @RequestParam("id") String pMap
			, HttpServletResponse res) {
		logger.info("id_sel �޼ҵ� ȣ��");
		String result = "";
		logger.info("pMap" + pMap);
		result = String.valueOf(memberDao.id_sel(pMap));
		logger.info("result: "+result);
		return result;
	}
	
/*��ȭ��ȣ �ߺ� üũ*/
	@RequestMapping("/id_tel.hon")
	public String id_tel(Model mod
			, @RequestParam("tel") String pMap
			, HttpServletResponse res) {
		logger.info("id_tel �޼ҵ� ȣ��");
		String result = "";
		logger.info("pMap" + pMap);
		result = String.valueOf(memberDao.tel_sel(pMap));
		return result;
	}

/*�����ϱ�*/
	@RequestMapping(value="join.hon", method=RequestMethod.POST)
	public int join(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		int result = 0;
		logger.info("join �޼ҵ� ȣ��");
		result = memberDao.insert(pMap);
		return result;
	}
	
/*�ּҰ˻�*/
	@RequestMapping(value="doAddress.hon", method=RequestMethod.POST)
	public String doAddress(Model mod
			, @RequestParam Map<String,Object> pMap
			, HttpServletResponse res) {
		List<Map<String, Object>> result = null;
		logger.info("doAddress �޼ҵ� ȣ��");
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
		logger.info("siAddress �޼ҵ� ȣ��");
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
		logger.info("dongAddress �޼ҵ� ȣ��");
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
		logger.info("deAddress �޼ҵ� ȣ��");
		result = memberDao.detailSelect(pMap);
		logger.info("data: "+result);
		mod.addAttribute("result",result);
		logger.info(mod);
		return "forward:/member/join/result/addr_result.jsp";
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 아이디 찾기(전화번호로) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//로직을 거칠 필요가 없기 때문에 기존 url에 있던 empty 제거
		@RequestMapping(value = "/check.hon", method= {RequestMethod.POST, RequestMethod.GET}) //POST, GET 모두 받을 수 있음
		public String check(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
			logger.info("check 호출 성공");
			String resultPage = ""; //결과 페이지 담을 변수
			String result = "";
			List<Map<String, Object>> list = null;
			result = mDao.check(pMap);
			logger.info(result);
			if ("1".equals(result)) { //1이면 이름과 아이디 동일
				logger.info(pMap.get("ins_name").toString());
				logger.info(pMap.get("mem_tel").toString());
				// 바로 Dao의 idSearch() 이동
				list = mDao.idSearch(pMap);
				logger.info("Controller : " + list);
				if (list != null) {// list => 이름과 아이디가 존재여부
					logger.info("Controller");
					HttpSession mem_session = req.getSession();
					mem_session.setAttribute("idSearch", list);
				}
				resultPage = "/member/login/idFound.jsp"; 
			} else if ("-1".equals(result)) {
				logger.info("result는" + result);
				resultPage = "/member/login/result/result.jsp?result=" + result;
			} else if ("0".equals(result)) {
				resultPage = "/member/login/result/result.jsp?result=" + result;
			}
			logger.info(resultPage);
			if ("-1".equals(result) || "0".equals(result)) {// redirect인지 forward인지 나누기 위해 
				logger.info("redirect로 보내는중");
				return "forward:" + resultPage;
			} else {
				logger.info("forward로 보내는중");
				return "forward:" + resultPage;
			}
		}

		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 아이디 찾기2(이메일로) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@RequestMapping(value = "/check2.hon", method= {RequestMethod.POST, RequestMethod.GET})
		public String check2(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
			logger.info("check2 호출 성공"); 
			String resultPage = "";
			String result = "";
			List<Map<String, Object>> list = null;
			result = mDao.check2(pMap);
			logger.info(result);
			if ("1".equals(result)) {
				logger.info(pMap.get("e_name").toString());
				logger.info(pMap.get("e_mail").toString());
				// 바로 Dao의 idSearch() 이동
				list = mDao.e_idSearch(pMap);
				logger.info("Controller : " + list);
				if (list != null) {// list => 이름과 아이디
					logger.info("Controller");
					HttpSession mem_session = req.getSession();
					mem_session.setAttribute("e_idSearch", list);
				}
				resultPage = "/member/login/idFound2.jsp";
			} else if ("-1".equals(result)) {
				logger.info("result는" + result);
				resultPage = "/member/login/result/result.jsp?result=" + result;
			} else if ("0".equals(result)) {
				resultPage = "/member/login/result/result.jsp?result=" + result;
			}
			logger.info(resultPage);
			if ("-1".equals(result) || "0".equals(result)) {// redirect인지 forward인지 나누기 위해 result값으로 구분
				logger.info("redirect로 보내는중");
				return "forward:" + resultPage;
			} else {
				logger.info("forward로 보내는중");
				return "forward:" + resultPage;
			}
		}
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비밀번호 찾기(전화번호로) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@RequestMapping(value = "/pwCheck.hon", method= {RequestMethod.POST, RequestMethod.GET})
		public String pwCheck(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
			logger.info("pwCheck 호출 성공");
			String resultPage = "";
			String result = "";
			List<Map<String, Object>> list = null;
			result = mDao.pwCheck(pMap);
			logger.info(result);
			if ("1".equals(result)) {
				logger.info(pMap.get("mem_id").toString());
				logger.info(pMap.get("mem_tel").toString());
				// 바로 Dao의 idSearch() 이동
				result = mDao.proc_pw3(pMap);
				logger.info("Controller : " + result);
				if (result != null) {
					logger.info("Controller");
					HttpSession mem_session = req.getSession();
					mem_session.setAttribute("pwSearch", result);
				}
				resultPage = "/member/login/pwFound.jsp";
			} else if ("-1".equals(result)) {
				logger.info("result는" + result);
				resultPage = "/member/login/result/result.jsp?result=" + result;
			} else if ("0".equals(result)) {
				resultPage = "/member/login/result/result.jsp?result=" + result;
			}
			logger.info(resultPage);
			if ("-1".equals(result) || "0".equals(result)) {// redirect인지 forward인지 나누기 위해 result값으로 구분
				logger.info("redirect로 보내는중");
				return "forward:" + resultPage;
			} else {
				logger.info("forward로 보내는중");
				return "forward:" + resultPage;
			}
		}
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 비밀번호 찾기(이메일로) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@RequestMapping(value = "/pwCheck2.hon", method= {RequestMethod.POST, RequestMethod.GET})
		public String pwCheck2(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
			logger.info("pwCheck2 호출 성공");
			String resultPage = "";
			String result = "";
			List<Map<String, Object>> list = null;
			result = mDao.pwCheck2(pMap);
			logger.info(result);
			if ("1".equals(result)) {
				logger.info(pMap.get("e_id").toString());
				logger.info(pMap.get("e_mail").toString());
				// 바로 Dao의 idSearch() 이동
				result = mDao.proc_epw(pMap);
				logger.info("Controller : " + result);
				if (result != null) {
					logger.info("Controller");
					HttpSession mem_session = req.getSession();
					mem_session.setAttribute("e_pwSearch", result);
				}
				resultPage = "/member/login/pwFound2.jsp";
			} else if ("-1".equals(result)) {
				logger.info("result는" + result);
				resultPage = "/member/login/result/result.jsp?result=" + result;
			} else if ("0".equals(result)) {
				resultPage = "/member/login/result/result.jsp?result=" + result;
			}
			logger.info(resultPage);
			if ("-1".equals(result) || "0".equals(result)) {// redirect인지 forward인지 나누기 위해 result값으로 구분
				logger.info("redirect로 보내는중");
				return "forward:" + resultPage;
			} else {
				logger.info("forward로 보내는중");
				return "forward:" + resultPage;
			}
		}
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ login @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@RequestMapping(value = "/login.hon", method= {RequestMethod.POST, RequestMethod.GET})
		public String login(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
			logger.info("login 호출 성공");
			String resultPage = "";
			String result = "";
			List<Map<String, Object>> list = null;
			result = mDao.login(pMap);
			logger.info(result);
			if ("1".equals(result)) {
				logger.info(pMap.get("mem_id").toString());
				logger.info(pMap.get("mem_pw").toString());
				// 바로 Dao의 idSearch() 이동
				list = mDao.select(pMap);
				logger.info("Controller : " + result);
				if (list != null) {
					logger.info("Controller");
					HttpSession mem_session = req.getSession();
					mem_session.setAttribute("memList", list);
				}
				resultPage = "/member/login/pwFound2.jsp";
			} else if ("-1".equals(result)) {
				logger.info("result는" + result);
				resultPage = "/member/login/result/result.jsp?result=" + result;
			} else if ("0".equals(result)) {
				resultPage = "/member/login/result/result.jsp?result=" + result;
			}
			logger.info(resultPage);
			if ("-1".equals(result) || "0".equals(result)) {// redirect인지 forward인지 나누기 위해 
				logger.info("redirect로 보내는중");
				return "forward:" + resultPage;
			} else {
				logger.info("forward로 보내는중");
				return "forward:" + resultPage;
			}
		}
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ notice @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	
	
}
