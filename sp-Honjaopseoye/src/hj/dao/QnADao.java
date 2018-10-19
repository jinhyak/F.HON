package hj.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class QnADao {

	Logger logger = Logger.getLogger(QnADao.class);
	
	// DB
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	/* QnA CRUD
	 * 
	 * 
	 */
	
	
	// ��� �Խñ� ��ȸ  =========================================================================
	
	// <QnA> ��� �Խñ� ��ȸ  (SELECT)
	public List<Map<String, Object>> getQnAList(){
		logger.info("<QnA>: getQnAList �޼ҵ� ���� - QnA �Խñ� ��ü ��� ��ȸ");
		List<Map<String, Object>> getQnAList = null;
		getQnAList = sqlSessionTemplate.selectList("getQnAList");
		logger.info("<QnA> ��ü ��ȸ ���: " + getQnAList.size());
		return getQnAList;
	}
	
	// ��� �Խñ� ��ȸ �� ========================================================================
	
	
	
	
	
	// �ش� ���̵� �Խñ� ��ȸ =====================================================================
	
	// <QnA> �ش� ���̵� �Խñ� ��ȸ  (SELECT) - WHERE
	public List<Map<String, Object>> getQnAIdList(Map<String, Object> pMap){
		
		logger.info("<QnA>: getQnAIdList �޼ҵ� ���� - �ش� ���̵� �Խñ� ��� ��ȸ");
		List<Map<String, Object>> getQnAIdList = null;
				
		getQnAIdList = sqlSessionTemplate.selectList("getQnAIdList", pMap);
		logger.info("<QnA> �ش� ���̵� ��ȸ ���: " + getQnAIdList.size());
				
		return getQnAIdList;
	}
	
	// �ش� ���̵� �Խñ� ��ȸ �� ====================================================================
	
	
	
	
	
	// �Խñ� ���  =============================================================================
	
	// <QnA> �Խñ� ���
	public int getQnAInsert(Map<String, Object> pMap) {
		
		logger.info("<QnA> getQnAInsert �޼ҵ� ���� - �Խñ� ���");
		int result = 0; 
		
		// <QnA> INSERT
		logger.info("<QnA> INSERT ����");
		result = sqlSessionTemplate.insert("getQnAInsert", pMap);
		logger.info("<QnA> INSERT ���: " + result);
		logger.info("<QnA> getQnAInsert INSERT ����");
			
		return result;
	}
	
	// �Խñ� ��� �� ===========================================================================
	
	
	
	
	
	// ���� �Խñ� ���� ==========================================================================
	
	// <QnA> ���� �Խñ� ����
	public int getQnADelete(Map<String, Object> pMap) {
		
		logger.info("<QnA> getQnADelete �޼ҵ� ���� - �Խñ� ���");
		int result = 0; 
		
		// <QnA> DELETE
		logger.info("<QnA> DELETE ����");
		result = sqlSessionTemplate.insert("getQnADelete", pMap);
		logger.info("<QnA> DELETE ���: " + result);
		logger.info("<QnA> getQnADelete DELETE ����");
			
		return result;
	}
	
	// ���� �Խñ� ���� �� ========================================================================
	
	
	
	
	
	// <QnA> ���� �Խñ� ����
	public int getQnAUpdate(Map<String, Object> pMap) {
		
		logger.info("<QnA> getQnAUpdate �޼ҵ� ���� - �Խñ� ���");
		int result = 0; 
		
		// <QnA> UPDATE
		logger.info("<QnA> UPDATE ����");
		result = sqlSessionTemplate.insert("getQnAUpdate", pMap);
		logger.info("<QnA> UPDATE ���: " + result);
		logger.info("<QnA> getQnAUpdate UPDATE ����");
			
		return result;
	}
	
	// ���� �Խñ� ���� �� ========================================================================
	
}
