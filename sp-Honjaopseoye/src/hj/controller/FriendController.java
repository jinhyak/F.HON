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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hj.dao.FriendDao;

@Controller
@RequestMapping("/friend")
public class FriendController {
		Logger logger = Logger.getLogger(FriendController.class);
		
		@Autowired
		private FriendDao friendDao = null;

		//친구 찾기
		@RequestMapping("/fri_search.hon")
		public String fri_select(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
			logger.info("pMap" + pMap);
			List<Map<String, Object>> list = null;
			try {
				list = friendDao.fri_search(pMap);
			} catch (IOException e) {
				e.printStackTrace();
			}
			mod.addAttribute("result", list);
			return "forward:/member/meminfo/result/fri_search.jsp";
		}
		//친구 추가
		@ResponseBody
		@RequestMapping("/insert.hon")
		public String insert(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
			logger.info("pMap" + pMap);
			int result = 0;
			try {
				result = friendDao.insert(pMap);
			} catch (IOException e) {
				e.printStackTrace();
			}
			mod.addAttribute("result", result);
			return String.valueOf(result);
		}
		
		//친구 목록 조회
		@RequestMapping("/fri_select.hon")
		public String select(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
			logger.info("pMap" + pMap);
			List<Map<String,Object>> list = null;
			logger.info("id_sel 메소드 호출");
			try {
				list = friendDao.fri_select(pMap);
			} catch (IOException e) {
				e.printStackTrace();
			}
			logger.info("list" + list);
			mod.addAttribute("result", list);
			return "forward:/member/meminfo/result/fri_select.jsp";
		}
		
		//친구 삭제
		@ResponseBody
		@RequestMapping("/delete.hon")
		public String delete(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
			logger.info("pMap" + pMap);
			logger.info("id_sel 메소드 호출");
			int result = 0;
			try {
				result = friendDao.delete(pMap);
			} catch (IOException e) {
				e.printStackTrace();
			}
			logger.info("result: "+result);
			mod.addAttribute("result", result);
			return String.valueOf(result);
		}
		
	
		
}
