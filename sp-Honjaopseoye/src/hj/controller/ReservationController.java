package hj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hj.dao.ReservationDao;
import hj.logic.ReservationLogic;


@Controller
@RequestMapping("/reservation")
public class ReservationController {
	Logger logger = Logger.getLogger(ReservationController.class);

	@Autowired
	private ReservationLogic reservationLogic = null;

	@Autowired
	private ReservationDao reservationDao = null;
	
	//�����ϱ� ������ �ѷ��� ����
	@ResponseBody
	@RequestMapping(value="/sel_bang_store.hon", method=RequestMethod.POST)
	public List<Map<String,Object>> sel_bang_store(@RequestParam Map<String,Object> pMap) {
		logger.info("sel_bang_store ȣ�� ����");
		List<Map<String,Object>> bang_store_List = new ArrayList<Map<String, Object>>();
		bang_store_List = reservationDao.sel_bang_store(pMap);
		logger.info("bang_store_List:"+bang_store_List);
		return bang_store_List;
	}
	//���� ��ȸ�ϱ�
	@ResponseBody
	@RequestMapping(value="/select.hon", method=RequestMethod.POST)
	public Map<String, List<Map<String,Object>>> select(@RequestParam Map<String,Object> pMap) {
		logger.info("select ȣ�� ����");
		List<Map<String,Object>> reservList = new ArrayList<Map<String, Object>>();
		reservList = reservationDao.select(pMap);
		logger.info("data: "+reservList);
		Map<String, List<Map<String,Object>>> rMap = new HashMap<String, List<Map<String,Object>>>();
	    rMap.put("data", reservList);
		return rMap;
	}
	//���� �������� ��ȸ
	@ResponseBody
	@RequestMapping(value="/sel_history.hon", method=RequestMethod.POST)
	public Map<String, List<Map<String,Object>>> sel_history(@RequestParam Map<String,Object> pMap) {
		logger.info("sel_history ȣ�� ����");
		List<Map<String,Object>> historyList = new ArrayList<Map<String, Object>>();
		historyList = reservationDao.sel_history(pMap);
		logger.info("data: "+historyList);
		Map<String, List<Map<String,Object>>> rMap = new HashMap<String, List<Map<String,Object>>>();
	    rMap.put("data", historyList);
		return rMap;
	}
	//�����ϱ� ���
	@ResponseBody
	@RequestMapping(value="/insert.hon", method=RequestMethod.GET)
	public String insert(@RequestParam Map<String,Object> pMap) {
		logger.info("insert ȣ�� ����");
		int result = 0;
		result = reservationDao.insert(pMap);
		return String.valueOf(result);
	}
	//������� �����ϱ�
	@ResponseBody
	@RequestMapping(value="/delete.hon", method=RequestMethod.POST)
	public String delete(@RequestParam Map<String,Object> pMap) {
		logger.info("delete ȣ�� ����");
		int result = 0;
		result = reservationDao.delete(pMap);
		return String.valueOf(result);
	}
}
