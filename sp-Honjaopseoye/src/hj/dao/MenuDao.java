package hj.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class MenuDao {
	Logger logger = Logger.getLogger(MenuDao.class);

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ ������ �������� ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public List<Map<String, Object>> nSelect() {
		logger.info("nSelect ȣ�� ����");
		List<Map<String, Object>> nList = new ArrayList<Map<String, Object>>();
		nList = sqlSessionTemplate.selectList("nSelect");
		logger.info("nSelect: " + nList);
		return nList;
	}
	/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ �����ϱ� �Խ��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public List<Map<String, Object>> qSelect(Map<String, Object> pMap) {
		logger.info("qSelect ȣ�� ����");
		List<Map<String, Object>> qList = new ArrayList<Map<String, Object>>();
		qList = sqlSessionTemplate.selectList("qSelect", pMap);
		logger.info("qSelect: " + qList);
		return qList;
	}
	/*[[[[[[[[[[[[[[[[[[[[[[[ �������� ���� ]]]]]]]]]]]]]]]]]]]]]]]]*/
	public int nDelete(String NOTI_NO) {
		logger.info("nDelete ȣ�� ���� : " + NOTI_NO);
		int result = 0;
		result = sqlSessionTemplate.delete("nDelete", NOTI_NO);
		logger.info(result);
		if(result == 1) {
			logger.info("nDelete : "+result);
		}
		
		return result;
	}
	/*[[[[[[[[[[[[[[[[[[ �������� ���������� ����������  ]]]]]]]]]]]]]]]]*/
	public List<Map<String, Object>> PN_select(String NOTI_NO) {
		logger.info("Dao : You succeed in calling next_select!");
		List<Map<String, Object>> PN_select = new ArrayList<Map<String, Object>>();
		PN_select = sqlSessionTemplate.selectList("getPN_NO", NOTI_NO);
		logger.info("PN_select: " + PN_select);
		return PN_select;
	}
	//

	/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ �������� �󼼺��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public List<Map<String, Object>> nView(String NOTI_NO) {
		logger.info("Dao : You succeed in calling nView!");
		List<Map<String, Object>> notiList = null;
		notiList = sqlSessionTemplate.selectList("nView", NOTI_NO);
		return notiList;
	}
	/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ �������� ��ȸ�� ������Ʈ ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public int hitUpdate(String NOTI_NO) {
		logger.info("You succeed in calling hitUpdate!!");
		int hitUp = 0;
		hitUp = sqlSessionTemplate.update("hitUpdate", NOTI_NO);
		if(hitUp==1) {
			logger.info("hitUp : "+hitUp);
		}else {
			logger.info("error");
		}
		return hitUp;
	}
	/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ �����ϱ� ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public int qInsert(Map<String, Object> pMap) {
		logger.info("qInsert ȣ�� ����");
		int result = 0;
		result = sqlSessionTemplate.insert("qInsert", pMap);
		if (result == 1) {
			logger.info("qInsert: " + result);
		}
		return result;
	}

	/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ �������� �۾��� ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public int nInsert(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("nInsert ȣ�� ����");
		int result = 0;
		result = sqlSessionTemplate.insert("nInsert", pMap);
		if (result == 1) {
			logger.info("nInsert: " + result);
		}
		return result;
	}
	public List<Map<String, Object>> proc_update(Map<String, Object> pMap) throws IOException{
		logger.info("proc_update ȣ�� ����! : "+pMap);
		List<Map<String, Object>> updateList = null;
		sqlSessionTemplate.selectList("nUpdate", pMap);
	    updateList = (List<Map<String, Object>>) pMap.get("cur_notice_upd");
	    updateList.addAll((List<Map<String, Object>>) pMap.get("cur_next_prev"));
		return updateList;
	}

	/* [[[[[[[[[[[[[[[[[[[[[[[[[[[[ ������ �Խñ� ]]]]]]]]]]]]]]]]]]]]]]]]]]]] */
	public int stepUp(int step) {
		int result = 0;
		logger.info("step Update");
		result = sqlSessionTemplate.update("stepUp", step);
		logger.info(step);
		return result;
	}

	public int getGroup() {
		logger.info("�ִ� �׷��ȣ ä��");
		int group = 0;
		group = sqlSessionTemplate.selectOne("getGroup");
		return group;
	}
	
	public int getStep() {
		// TODO Auto-generated method stub
		logger.info("�ִ� ���ܹ�ȣ ä��");
		int step = 0;
		step = sqlSessionTemplate.selectOne("getStep");
		return step;
	}


}
