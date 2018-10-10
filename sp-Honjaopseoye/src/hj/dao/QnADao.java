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
	
	/* QnA CRUD */

//* ============================== [[[모든 게시글 목록 조회]]] ==============================	
	
	// <QnA> 모든 게시글 조회  (SELECT)
	public List<Map<String, Object>> getQnAList(Map<String, Object> pMap){
		
		logger.info("<QnA>: getQnAList 메소드 진입 - QnA 게시글 전체 목록 조회");
		List<Map<String, Object>> getQnAList = null;
		
		getQnAList = sqlSessionTemplate.selectList("getQnAList", pMap);
		logger.info("<QnA> 전체 조회 목록: " + getQnAList.size());
		
		return getQnAList;
	}
	
	// 모든 게시글 조회 끝 ========================================================================
	
	
	
	
	
	// 해당 아이디 게시글 조회 =====================================================================
	
	// <QnA> 해당 아이디 게시글 조회  (SELECT) - WHERE
	public List<Map<String, Object>> getQnAIdList(Map<String, Object> pMap){
		
		logger.info("<QnA>: getQnAIdList 메소드 진입 - 해당 아이디 게시글 목록 조회");
		List<Map<String, Object>> getQnAIdList = null;
				
		getQnAIdList = sqlSessionTemplate.selectList("getQnAIdList", pMap);
		logger.info("<QnA> 해당 아이디 조회 목록: " + getQnAIdList.size());
				
		return getQnAIdList;
	}
	
	// 해당 아이디 게시글 조회 끝 ====================================================================
	
	
	
	
	
	// 게시글 등록  =============================================================================
	
	// <QnA> 게시글 등록
	public int getQnAInsert(Map<String, Object> pMap) {
		
		logger.info("<QnA> getQnAInsert 메소드 진입 - 게시글 등록");
		int result = 0; 
		
		// <QnA> INSERT
		logger.info("<QnA> INSERT 실행");
		result = sqlSessionTemplate.insert("getQnAInsert", pMap);
		logger.info("<QnA> INSERT 결과: " + result);
		logger.info("<QnA> getQnAInsert INSERT 종료");
			
		return result;
	}
	
	// 게시글 등록 끝 ===========================================================================
	
	
	
	
	
	// 선택 게시글 삭제 ==========================================================================
	
	// <QnA> 선택 게시글 삭제
	public int getQnADelete(Map<String, Object> pMap) {
		
		logger.info("<QnA> getQnADelete 메소드 진입 - 게시글 등록");
		int result = 0; 
		
		// <QnA> DELETE
		logger.info("<QnA> DELETE 실행");
		result = sqlSessionTemplate.insert("getQnADelete", pMap);
		logger.info("<QnA> DELETE 결과: " + result);
		logger.info("<QnA> getQnADelete DELETE 종료");
			
		return result;
	}
	
	// 선택 게시글 삭제 끝 ========================================================================
	
	
	
	
	
	// <QnA> 선택 게시글 수정
	public int getQnAUpdate(Map<String, Object> pMap) {
		
		logger.info("<QnA> getQnAUpdate 메소드 진입 - 게시글 등록");
		int result = 0; 
		
		// <QnA> UPDATE
		logger.info("<QnA> UPDATE 실행");
		result = sqlSessionTemplate.insert("getQnAUpdate", pMap);
		logger.info("<QnA> UPDATE 결과: " + result);
		logger.info("<QnA> getQnAUpdate UPDATE 종료");
			
		return result;
	}
	
	// 선택 게시글 삭제 끝 ========================================================================
	
}
