package hj.dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;


public class MessageDao{
	Logger logger = Logger.getLogger(MessageDao.class);
	private SqlSessionTemplate sqlSessionTemplate;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	//�޽��� ������
	public int insert(Map<String, Object> pMap) throws IOException {
		int result = 0;
		result = sqlSessionTemplate.insert("msg_insert",pMap);
		return result;
	}
	//�ֱ� ä�� ���� �ҷ�����
	public List<Map<String, Object>> msgListByRecent(Map<String,Object> pMap) throws IOException{
		List<Map<String,Object>> list = null;
		list = sqlSessionTemplate.selectList("msgListByRecent", pMap);
		
		//ä�ó����� �ҷ����� �޽����� ���� ó���ؾ� �ϹǷ� readMsg�Լ��� ȣ��
		readMsg(pMap);
		return list;
	}
	//���� �޽��� ó��
	public int readMsg(Map<String, Object> pMap) throws IOException {
		int result = 0;
		result = sqlSessionTemplate.update("readMsg", pMap);
		return result;
	}
	//��� �� ���� �޽��� �ҷ�����
	public String allUnReadMsg(Map<String,Object> pMap) throws IOException {
		String result = "";
		result = sqlSessionTemplate.selectOne("allUnReadMsg", pMap);
		return result;
	}
	//�ֱ� ģ���� ���� ���� �޽��� ���� �ҷ�����
	public List<Map<String, Object>> getmsgBox(Map<String,Object> pMap) throws IOException{
		List<Map<String, Object>> list = null;
		list = sqlSessionTemplate.selectList("getmsgBox", pMap);
		for(int i = 0;i<list.size();i++) {
			Map<String, Object> xMap = list.get(i);
			for(int j=0;j<list.size();j++) {
				Map<String, Object> yMap = list.get(j);
				if(xMap.get("MSG_FROM").toString().equals(yMap.get("MSG_TO").toString())
						&&xMap.get("MSG_TO").toString().equals(yMap.get("MSG_FROM").toString())) {
					if(Integer.parseInt(xMap.get("MSG_NO").toString())<Integer.parseInt(yMap.get("MSG_NO").toString())) {
						list.remove(xMap);
						i--;
						break;
					}
					else {
						list.remove(yMap);
						j--;
					}
				}
			}
		}
		return list;
	}
	//�ش� ģ���� ���� ������ �޽��� ó��
	public String unReadMsg(Map<String,Object> pMap) throws IOException {
		String result = "";
		result = sqlSessionTemplate.selectOne("unReadMsg", pMap);
		return result;
	}

}
