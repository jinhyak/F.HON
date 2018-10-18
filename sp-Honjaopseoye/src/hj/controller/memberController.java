package hj.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hj.dao.MemberDao;
import hj.logic.MemberLogic;
import hj.logic.testLogic;

@Controller
@RequestMapping("/member")
public class memberController {
	Logger logger = Logger.getLogger(memberController.class);
	
	@Autowired
	private testLogic testLogic = null;
	@Autowired
	private MemberLogic memberLogic = null;	
	@Autowired
	private MemberDao memberDao = null;
	
/*���������� �̵� �׽�Ʈ*/
	@RequestMapping("/empty.hon")
	public String empty(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		List<Map<String,Object>> emptyList = null;
		logger.info("empty�޼ҵ� ȣ��");
		//tLogic.test(pMap);
		/*try {
			memberDao.check(pMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return "redirect:./join/addr_result.jsp";
	}
	
/*���̵� �ߺ� üũ*/
	@ResponseBody
	@RequestMapping("/id_sel.hon")
	public String id_sel(@RequestParam("id") String pMap
			, HttpServletResponse res) {
		logger.info("id_sel �޼ҵ� ȣ��");
		String result = "";
		logger.info("pMap" + pMap);
		result = String.valueOf(memberDao.id_sel(pMap));
		logger.info("result: "+result);
		return result;
	}
	
/*��ȭ��ȣ �ߺ� üũ*/
	@ResponseBody
	@RequestMapping("/id_tel.hon")
	public String id_tel(@RequestParam("tel") String pMap
			, HttpServletResponse res) {
		logger.info("id_tel �޼ҵ� ȣ��");
		String result = "";
		logger.info("pMap" + pMap);
		result = String.valueOf(memberDao.tel_sel(pMap));
		return result;
	}

/*�����ϱ�*/
	@ResponseBody
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
		return "forward:/member/join/result/ad_result.jsp";
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
		return "forward:/member/join/result/ad_result.jsp";
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
		return "forward:/member/join/result/ad_result.jsp";
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
		return "forward:/member/join/result/ad_de_result.jsp";
	}

/*ȸ�� ���� ����*/
	@ResponseBody
	@RequestMapping(value="iUpdate.hon", method=RequestMethod.POST)
	public int iUpdate(Model mod
			,@RequestParam Map<String,Object> pMap) {
		int result = 0;
		logger.info("update �޼ҵ� ȣ��");
		result = memberDao.iUpdate(pMap);
		mod.addAttribute("result",result);
		return result;
	}
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���̵� ã��(��ȭ��ȣ��) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/check.hon", method= {RequestMethod.POST, RequestMethod.GET}) //POST, GET ��� ���� �� ����
	public String check(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
		logger.info("check ȣ�� ����");
		String resultPage = ""; //��� ������ ���� ����
		String result = "";
		List<Map<String, Object>> list = null;
		result = memberDao.check(pMap);
		logger.info(result);
		if ("1".equals(result)) { //1�̸� �̸��� ���̵� ����
			logger.info(pMap.get("ins_name").toString());
			logger.info(pMap.get("mem_tel").toString());
			// �ٷ� Dao�� idSearch() �̵�
			list = memberDao.idSearch(pMap);
			logger.info("Controller : " + list);
			if (list != null) {// list => �̸��� ���̵� ���翩��
				logger.info("Controller");
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("idSearch", list);
			}
			resultPage = "/member/login/idFound.jsp"; 
		} else if ("-1".equals(result)) {
			logger.info("result��" + result);
			resultPage = "/member/login/result/result.jsp?result=" + result;
		} else if ("0".equals(result)) {
			resultPage = "/member/login/result/result.jsp?result=" + result;
		}
		logger.info(resultPage);
		if ("-1".equals(result) || "0".equals(result)) {// redirect���� forward���� ������ ���� 
			logger.info("redirect�� ��������");
			return "forward:" + resultPage;
		} else {
			logger.info("forward�� ��������");
			return "forward:" + resultPage;
		}
	}

	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���̵� ã��2(�̸��Ϸ�) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/check2.hon", method= {RequestMethod.POST, RequestMethod.GET})
	public String check2(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
		logger.info("check2 ȣ�� ����"); 
		String resultPage = "";
		String result = "";
		List<Map<String, Object>> list = null;
		result = memberDao.check2(pMap);
		logger.info(result);
		if ("1".equals(result)) {
			logger.info(pMap.get("e_name").toString());
			logger.info(pMap.get("e_mail").toString());
			// �ٷ� Dao�� idSearch() �̵�
			list = memberDao.e_idSearch(pMap);
			logger.info("Controller : " + list);
			if (list != null) {// list => �̸��� ���̵�
				logger.info("Controller");
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("e_idSearch", list);
			}
			resultPage = "/member/login/idFound2.jsp";
		} else if ("-1".equals(result)) {
			logger.info("result��" + result);
			resultPage = "/member/login/result/result.jsp?result=" + result;
		} else if ("0".equals(result)) {
			resultPage = "/member/login/result/result.jsp?result=" + result;
		}
		logger.info(resultPage);
		if ("-1".equals(result) || "0".equals(result)) {// redirect���� forward���� ������ ���� result������ ����
			logger.info("redirect�� ��������");
			return "forward:" + resultPage;
		} else {
			logger.info("forward�� ��������");
			return "forward:" + resultPage;
		}
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ��й�ȣ ã��(��ȭ��ȣ��) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/pwCheck.hon", method= {RequestMethod.POST, RequestMethod.GET})
	public String pwCheck(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
		logger.info("pwCheck ȣ�� ����");
		String resultPage = "";
		String result = "";
		List<Map<String, Object>> list = null;
		result = memberDao.pwCheck(pMap);
		logger.info(result);
		if ("1".equals(result)) {
			logger.info(pMap.get("mem_id").toString());
			logger.info(pMap.get("mem_tel").toString());
			// �ٷ� Dao�� idSearch() �̵�
			result = memberDao.proc_pw3(pMap);
			logger.info("Controller : " + result);
			if (result != null) {
				logger.info("Controller");
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("pwSearch", result);
			}
			resultPage = "/member/login/pwFound.jsp";
		} else if ("-1".equals(result)) {
			logger.info("result��" + result);
			resultPage = "/member/login/result/result.jsp?result=" + result;
		} else if ("0".equals(result)) {
			resultPage = "/member/login/result/result.jsp?result=" + result;
		}
		logger.info(resultPage);
		if ("-1".equals(result) || "0".equals(result)) {// redirect���� forward���� ������ ���� result������ ����
			logger.info("redirect�� ��������");
			return "forward:" + resultPage;
		} else {
			logger.info("forward�� ��������");
			return "forward:" + resultPage;
		}
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ��й�ȣ ã��(�̸��Ϸ�) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/pwCheck2.hon", method= {RequestMethod.POST, RequestMethod.GET})
	public String pwCheck2(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) throws IOException {
		logger.info("pwCheck2 ȣ�� ����");
		String resultPage = "";
		String result = "";
		List<Map<String, Object>> list = null;
		result = memberDao.pwCheck2(pMap);
		logger.info(result);
		if ("1".equals(result)) {
			logger.info(pMap.get("e_id").toString());
			logger.info(pMap.get("e_mail").toString());
			// �ٷ� Dao�� idSearch() �̵�
			result = memberDao.proc_epw(pMap);
			logger.info("Controller : " + result);
			if (result != null) {
				logger.info("Controller");
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("e_pwSearch", result);
			}
			resultPage = "/member/login/pwFound2.jsp";
		} else if ("-1".equals(result)) {
			logger.info("result��" + result);
			resultPage = "/member/login/result/result.jsp?result=" + result;
		} else if ("0".equals(result)) {
			resultPage = "/member/login/result/result.jsp?result=" + result;
		}
		logger.info(resultPage);
		if ("-1".equals(result) || "0".equals(result)) {// redirect���� forward���� ������ ���� result������ ����
			logger.info("redirect�� ��������");
			return "forward:" + resultPage;
		} else {
			logger.info("forward�� ��������");
			return "forward:" + resultPage;
		}
	}
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ login @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/login.hon", method= {RequestMethod.POST, RequestMethod.GET})
	public String login(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("login ȣ�� ����");
		String resultPage = "";
		String result = "";
		List<Map<String,Object>> list = null;
		result = memberDao.login(pMap);
		logger.info(result);
		if ("1".equals(result)) {
			logger.info(pMap.get("mem_id").toString());
			logger.info(pMap.get("mem_pw").toString());
			// �ٷ� Dao�� idSearch() �̵�
			//list = memberLogic.select(pMap,res);
			list = memberDao.select(pMap);
			logger.info("Controller : " + result);
			if (list != null) {
				logger.info("Controller");
				HttpSession mem_session = req.getSession();
				mem_session.setAttribute("memList", list);
			}
			resultPage = "/member/login/pwFound2.jsp";
		} else if ("-1".equals(result)) {
			logger.info("result��" + result);
			resultPage = "/member/login/result/result.jsp?result=" + result;
		} else if ("0".equals(result)) {
			resultPage = "/member/login/result/result.jsp?result=" + result;
		}
		logger.info(resultPage);
		if ("-1".equals(result) || "0".equals(result)) {// redirect���� forward���� ������ ���� 
			logger.info("redirect�� ��������");
			return "forward:" + resultPage;
		} else {
			logger.info("forward�� ��������");
			return "forward:" + resultPage;
		}
	}
	//@ResponseBody
	@RequestMapping(value="/naverLoginCallback.hon", produces="text/html; charset=utf-8")
	public String naverCallback(Model model, HttpServletRequest req) throws UnsupportedEncodingException { 
			HttpSession session = req.getSession();
		 	String token = (String)session.getAttribute("access_token");// ���̹� �α��� ���� ��ū; => ����� �������� ������ ó���� �� �Ф�
	        String header = "Bearer " + token; // Bearer ������ ���� �߰�
            String inputLine;
            List<String> nMemList = new ArrayList<String>();
            int result = 0;
            StringBuffer response = new StringBuffer();
            JSONObject jsObj = new JSONObject();
            JSONParser jsParser = new JSONParser();
	        try {
	            String apiURL = "https://openapi.naver.com/v1/nid/me";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("Authorization", header);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // ���� ȣ��
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // ���� �߻�
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            logger.info(response.toString());
	            JSONParser jsonp = new JSONParser();
	            Object obj = jsonp.parse(response.toString());
	            JSONObject jsonObject = (JSONObject)obj;
	            JSONObject jsonObject2 = (JSONObject)jsonObject.get("response");
	            String name = (String)jsonObject2.get("name");
	            String email = (String)jsonObject2.get("email");
	            String nickname = (String)jsonObject2.get("nickname");
	            String age = (String)jsonObject2.get("age");
	            String gender = (String)jsonObject2.get("gender");
	            String birthday = (String)jsonObject2.get("birthday");
	            String id = (String)jsonObject2.get("id");
	            logger.info("�̸� : "+name+", �̸��� : "+email+", �г��� : "+nickname+", ���ɴ� : "+age+", ���� :"+gender+", ���� : "+birthday+", ���̵� : "+id);
	            Map<String, Object> pMap = new HashMap<String, Object>();
	            pMap.put("id", id);
	            pMap.put("name", name);
	            pMap.put("email", email);
	            pMap.put("nickname", nickname);
	            pMap.put("age", age);
	            pMap.put("gender", gender);
	            pMap.put("birthday", birthday);
	            session.setAttribute("nMem", pMap);
	            result = memberDao.nMemInsert(pMap);
	        } catch (Exception e) {
	            logger.info(e.toString()+", "+e.getMessage());
	        }
	        return "redirect:/main/main/main.jsp";
	        
	}
	
}
