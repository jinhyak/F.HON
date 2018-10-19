package hj.logic;

import java.io.IOException;
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

	public List<Map<String, Object>> select(Map<String, Object> pMap, HttpServletResponse res) {
		logger.info("�α��� select ����");
		List<Map<String, Object>> list = null;
		try {
			list = memberDao.select(pMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*Cookie memList = new Cookie("memList",String.valueOf(list));
		memList.setMaxAge(60*60*24);
		res.addCookie(memList);
		logger.info("dao�� ������");*/
		return list;
	}
	
}
