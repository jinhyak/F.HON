package hj.logic;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.MemberDao;

@Service
public class MemberLogic {
	Logger logger = Logger.getLogger(MemberLogic.class);
	
	@Autowired
	private MemberDao memberDao = null;

	public Cookie select(Map<String, Object> pMap, HttpServletResponse res) {
		logger.info("로그인 select 로직");
		String list = null;
		try {
			list = memberDao.select(pMap);
			logger.info("list : "+list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Cookie memList = new Cookie("memList",URLEncoder.encode(list));
		memList.setMaxAge(60*60*24);
		memList.setPath("/");
		res.addCookie(memList);
		logger.info("dao를 지나고");
		return memList;
	}
	
}
