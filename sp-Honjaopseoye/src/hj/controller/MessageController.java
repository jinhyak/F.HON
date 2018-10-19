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

import hj.dao.MessageDao;

@Controller
@RequestMapping("/message")
public class MessageController {
	Logger logger = Logger.getLogger(FriendController.class);
	
	@Autowired
	private MessageDao messageDao = null;

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
		return "redirect:main.jsp";
	}
	//�޽��� ������
	@ResponseBody
	@RequestMapping("/insert.hon")
	public String insert(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap" + pMap);
		int result = 0;
		try {
			result = messageDao.insert(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("Dao ����");
		}
		
		return String.valueOf(result);
	}
	//�ֱ� ä�ó��� �ҷ�����
	@RequestMapping(value="/msgListByRecent.hon", method=RequestMethod.POST)
	public String msgListByRecent(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		List<Map<String,Object>> list = null;
		logger.info("pMap" + pMap);
		try {
			list = messageDao.msgListByRecent(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("Dao ����");
		}
		mod.addAttribute("result", list);
		logger.info(list);
		return "forward:/member/message/result/mlist.jsp";
	}
	//�޽��� ��� ��������
	@RequestMapping("/getmsgBox.hon")
	public String getmsgBox(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap" + pMap);
		List<Map<String,Object>> list = null;
		logger.info("id_sel �޼ҵ� ȣ��");
		try {
			list = messageDao.getmsgBox(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("Dao ����");
		}
		logger.info("list" + list);
		mod.addAttribute("result", list);
		return "forward:/member/message/result/blist.jsp";
	}
	//������ �޽��� ó�� (ģ������)
	@ResponseBody
	@RequestMapping("/unReadMsg.hon")
	public String unReadMsg(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap" + pMap);
		logger.info("id_sel �޼ҵ� ȣ��");
		String result = "";
		try {
			result = messageDao.unReadMsg(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("Dao ����");
		}
		logger.info("result: "+result);
		return result;
	}
	//��� ������ �޽��� ó��
	@ResponseBody
	@RequestMapping("/allUnReadMsg.hon")
	public String allUnReadMsg(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap" + pMap);
		String result = "";
		try {
			result = messageDao.allUnReadMsg(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("Dao ����");
		}
		logger.info("result: "+result);
		return result;
	}
}
