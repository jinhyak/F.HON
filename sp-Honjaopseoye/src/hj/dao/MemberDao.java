package hj.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class MemberDao {
	Logger logger = Logger.getLogger(this.getClass());

	private SqlSessionTemplate sqlSessionTemplate;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[아이디 중복 체크]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int id_sel(String pMap) {
		logger.info("id_sel 호출 성공");
		logger.info(pMap);
		int result = 0;
		result = sqlSessionTemplate.selectOne("id_sel", pMap);
		logger.info("result: " + result);
		return result;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[비밀번호 중복 체크]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int tel_sel(String pMap) {
		logger.info("tel_sel 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.selectOne("tel_sel", pMap);
		return result;
	}

	public int insert(Map<String, Object> pMap) {
		/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[트리거 사용]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
		int result = 0;
		result = sqlSessionTemplate.insert("join", pMap);
		//result = sqlSessionTemplate.insert("grade", pMap);
		logger.info(result);
		return result;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[주소록 호출]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String, Object>> doselect(Map<String, Object> pMap) {
		logger.info("doselect 호출 성공");
		List<Map<String, Object>> list = null;
		list = sqlSessionTemplate.selectList("doselect", pMap);
		return list;
	}
	public List<Map<String, Object>> siSelect(Map<String, Object> pMap) {
		logger.info("siselect 호출 성공");
		List<Map<String, Object>> list = null;
		list = sqlSessionTemplate.selectList("siselect", pMap);
		logger.info(list);
		return list;
	}
	public List<Map<String, Object>> dongSelect(Map<String, Object> pMap) {
		logger.info("dongselect 호출 성공");
		List<Map<String, Object>> list = null;
		list = sqlSessionTemplate.selectList("dongselect", pMap);
		logger.info(list);
		return list;
	}
	public List<Map<String, Object>> detailSelect(Map<String, Object> pMap) {
		logger.info("상세주소 호출 성공");
		List<Map<String, Object>> list = null;
		list = sqlSessionTemplate.selectList("detailselect", pMap);
		logger.info(list);
		return list;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[회원 정보 수정]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int iUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.delete("update", pMap);
		logger.info("result : " + result);
		return result;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 회원 탈퇴 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int delete(Map<String, Object> pMap) throws IOException {
		logger.info("delete 호출성공");
		int result = 0;
		result = sqlSessionTemplate.delete("delete", pMap);
		logger.info("result : " + result);
		return result;
	}

	public List<Map<String, Object>> select(Map<String, Object> pMap) throws IOException {
		logger.info(pMap);
		logger.info("mdao : select call");
		List<Map<String,Object>> memberList = null;
		memberList = sqlSessionTemplate.selectList("membermap.select", pMap);
		return memberList;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 로그인 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public String login(Map<String, Object> pMap) throws IOException {
		String result = "";
		logger.info(pMap);
		logger.info("mdao : login call" );
		result = sqlSessionTemplate.selectOne("membermap.login", pMap);
		logger.info(result);
		return result;
	}

	public String check(Map<String, Object> pMap) throws IOException {
		logger.info("Dao : check 호출 성공");
		String result = "";
		logger.info("check" + pMap);
		logger.info("mdao : check 메소드 호출 성공");
		result = sqlSessionTemplate.selectOne("membermap.check", pMap);
		logger.info("result는" + result);
		return result;
	}
	
	public String check2(Map<String, Object> pMap) throws IOException {
		String result = "";
		logger.info("check2" + pMap);
		logger.info("mdao : check 메소드 호출 성공");
		result = sqlSessionTemplate.selectOne("membermap.check2", pMap);
		logger.info("result는" + result);
		return result;
	}

/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 아이디 찾기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String, Object>> idSearch(Map<String, Object> pMap) throws IOException {
		logger.info("idSearch:" + pMap);
		logger.info(pMap.get("ins_name"));
		logger.info(pMap.get("mem_tel"));
		List<Map<String, Object>> idSearch = null;
		idSearch = sqlSessionTemplate.selectList("idSearch", pMap);
		// String user_pw = idSearch.get(0).get("mem_pw").toString();
		logger.info("idSearch : " + idSearch);
		sqlSessionTemplate.close();
		return idSearch;
	}

	/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ e아이디 찾기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public List<Map<String, Object>> e_idSearch(Map<String, Object> pMap) throws IOException {
		logger.info("e_idSearch:" + pMap);
		List<Map<String, Object>> e_idSearch = null;
		logger.info(pMap.get("e_name"));
		logger.info(pMap.get("e_mail"));
		e_idSearch = sqlSessionTemplate.selectList("e_idSearch", pMap);
		logger.info("e_idSearch : " + e_idSearch);
		sqlSessionTemplate.close();
		return e_idSearch;
	}

	
	/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ 비번 찾기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public String pwCheck(Map<String, Object> pMap) throws IOException {
		String result = "";
		logger.info("pwCheck" + pMap);
		logger.info("mdao : pwCheck 메소드 호출 성공");
		result = sqlSessionTemplate.selectOne("membermap.pwCheck", pMap);
		logger.info("result는" + result);
		
		return result;
	}

	/*[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ t비번 찾기 ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]*/
	public String pwCheck2(Map<String, Object> pMap) throws IOException {
		String result = "";
		logger.info("pwCheck2" + pMap);
		logger.info("mdao : pwCheck2 메소드 호출 성공");
		result = sqlSessionTemplate.selectOne("membermap.pwCheck2", pMap);
		logger.info("result는" + result);
		return result;
	}

	public String proc_pw3(Map<String, Object> pMap) throws IOException {
		logger.info("proc_pw3:" + pMap);
		String res = "";
		logger.info(pMap.get("mem_id").toString());
		logger.info(pMap.get("mem_tel").toString());
		sqlSessionTemplate.selectOne("proc_pw", pMap);
		res = pMap.get("res").toString();
		logger.info("proc_pw : " + res);
		sqlSessionTemplate.close();
		return res;
	}

	public String proc_epw(Map<String, Object> pMap) throws IOException {
		logger.info("proc_epw:" + pMap);
		String res = "";
		logger.info(pMap.get("e_id").toString());
		logger.info(pMap.get("e_mail").toString());
		sqlSessionTemplate.selectOne("proc_epw", pMap);
		res = pMap.get("res").toString();
		logger.info("proc_epw : " + res);
		sqlSessionTemplate.close();
		return res;
	}

	public List<Map<String, Object>> noticeList(Map<String, Object> pMap){
		logger.info("noticeList 호출 성공");
		List<Map<String, Object>> getNoticeList = new ArrayList<Map<String,Object>>();
		getNoticeList = sqlSessionTemplate.selectList("noticeList", pMap);
		return getNoticeList;
	}

	public int nMemInsert(Map<String, Object> pMap) {
		logger.info("nMemInsert : " + pMap);
		logger.info(pMap.get("birthday").toString());
		logger.info(pMap.get("gender").toString());
		logger.info(pMap.get("id").toString());
		logger.info(pMap.get("age").toString());
		logger.info(pMap.get("name").toString());
		logger.info(pMap.get("email").toString());
		logger.info(pMap.get("nickname").toString());
		int result = 0;
		result = sqlSessionTemplate.insert("nMemIns", pMap);
		logger.info("result : " + result);
		if(result == 1) {
			logger.info("result 호출 성공");
		}else {
			logger.info("error!");
		}
		return result;
	}
}
