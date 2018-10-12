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
	
	//예약 조회하기
	@ResponseBody
	@RequestMapping(value="/select.hon", method=RequestMethod.POST)
	public Map<String, List<Map<String,Object>>> select(@RequestParam Map<String,Object> pMap) {
		logger.info("select 호출 성공");
		List<Map<String,Object>> reservList = new ArrayList<Map<String, Object>>();
		reservList = reservationDao.select(pMap);
		logger.info("data: "+reservList);
		Map<String, List<Map<String,Object>>> rMap = new HashMap<String, List<Map<String,Object>>>();
	    rMap.put("data", reservList);
		return rMap;
	}
	//예약 삭제내역 조회
	@ResponseBody
	@RequestMapping(value="/sel_history.hon", method=RequestMethod.POST)
	public Map<String, List<Map<String,Object>>> sel_history(@RequestParam Map<String,Object> pMap) {
		logger.info("sel_history 호출 성공");
		List<Map<String,Object>> historyList = new ArrayList<Map<String, Object>>();
		historyList = reservationDao.sel_history(pMap);
		logger.info("data: "+historyList);
		Map<String, List<Map<String,Object>>> rMap = new HashMap<String, List<Map<String,Object>>>();
	    rMap.put("data", historyList);
		return rMap;
	}
	//예약하기 등록
	@ResponseBody
	@RequestMapping(value="/insert.hon", method=RequestMethod.GET)
	public String insert(@RequestParam Map<String,Object> pMap) {
		logger.info("insert 호출 성공");
		int result = 0;
		result = reservationDao.insert(pMap);
		return String.valueOf(result);
	}
	//예약취소 삭제하기
	@ResponseBody
	@RequestMapping(value="/delete.hon", method=RequestMethod.POST)
	public String delete(@RequestParam Map<String,Object> pMap) {
		logger.info("delete 호출 성공");
		int result = 0;
		result = reservationDao.delete(pMap);
		return String.valueOf(result);
	}
}
