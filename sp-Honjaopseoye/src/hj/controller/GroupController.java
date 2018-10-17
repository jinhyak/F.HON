package hj.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;

import hj.dao.GroupDao;
import hj.logic.GroupLogic;

@Controller
@RequestMapping("/group")
public class GroupController {
   Logger logger = Logger.getLogger(GroupController.class);

   private GroupLogic groupLogic = null;

   @Autowired
   private GroupDao groupDao = null;
   
   //방 등록 메소드
   @ResponseBody
   @RequestMapping("/groupInsert.hon")
   public String groupInsert(Model mod, @RequestParam Map<String,Object> pMap) {
	  logger.info(pMap);
	  logger.info("nInsert 메소드 호출");
	  int result = 0;
	  result = groupDao.groupInsert(pMap);
	  return String.valueOf(result);
   }
	
   //가게조회 메소드
   @ResponseBody
   @RequestMapping(value="/store_sel.hon" , produces="text/html; charset=UTF-8")
   public String select(Model mod,@RequestParam Map<String, Object> pMap) throws IOException {
	  List<Map<String, Object>> list = null;
	  list = groupDao.storeSelect(pMap);
	  Gson gs = new Gson();
	  String json = gs.toJson(list);
	  return json;
   }
   
   //가게 상세조회 메소드
   @ResponseBody
   @RequestMapping(value="/groupSelect.hon" , produces="application/json")
   public List<Map<String, Object>> groupSelect(Model mod,@RequestParam Map<String, Object> pMap) throws IOException {
	   logger.info("groupSelect 호출 성공");
		List<Map<String,Object>> groupInfoList = new ArrayList<Map<String, Object>>();
		groupInfoList = groupDao.groupSelect(pMap);
		logger.info("groupInfoList: "+groupInfoList);
		return groupInfoList;
   }
   //모임방 친구조회 메소드
   //@ResponseBody
   @RequestMapping(value="/friendSelect.hon" , produces="text/html; charset=UTF-8")
   public String friendSelect(Model mod,@RequestParam String bang_no) throws IOException {
	   logger.info("friendSelect 호출 성공");
	   List<Map<String,Object>> gfriendList = new ArrayList<Map<String, Object>>();
	   gfriendList = groupDao.friendSelect(bang_no);
	   logger.info("gfriendList: "+gfriendList);
	   mod.addAttribute("gfriendList",gfriendList);
	   return "forward:/main/together/result/g_fri_select.jsp";
   }
   
   //방참석 등록 메소드
   @ResponseBody
   @RequestMapping("/groupAttend.hon")
   public int groupAttend(Model mod, @RequestParam Map<String,Object> pMap) {
	  logger.info(pMap);
	  logger.info("groupAttend 메소드 호출");
	  int result = 0;
	  result = groupDao.groupAttend(pMap);
	  return result;
   }
   //방참석취소 등록 메소드
   @ResponseBody
   @RequestMapping("/groupAbsent.hon")
   public int groupAbsent(Model mod, @RequestParam String mem_id) {
	   logger.info(mem_id);
	   logger.info("groupAbsent 메소드 호출");
	   int result = 0;
	   result = groupDao.groupAbsent(mem_id);
	   return result;
   }
   //방장 방삭제 등록 메소드
   @ResponseBody
   @RequestMapping("/groupDelete.hon")
   public int groupDelete(Model mod, @RequestParam Map<String,Object> pMap) {
	   logger.info(pMap);
	   logger.info("groupDelete 메소드 호출");
	   int result = 0;
	   result = groupDao.groupDelete(pMap);
	   return result;
   }
   
}
