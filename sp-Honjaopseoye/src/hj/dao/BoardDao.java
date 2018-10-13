package hj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;


public class BoardDao{
		Logger logger = Logger.getLogger(BoardDao.class);
		
		// DB
		private SqlSessionTemplate sqlSessionTemplate;
		
		public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
		}
		
		
		// 모든 게시글 목록 조회 ================================================================
		
		 /* 혼밥, 혼술, 혼놀 모든 게시글을 조회 합니다. 
         *  
         */
		
		// <혼밥> 모든 게시글 목록 조회 (SELECT)
		public List<Map<String, Object>> getBabBoardList(Map<String, Object> pMap){
			
			logger.info("<혼밥>: Dao - getBoardList 메소드 진입 - 혼밥 게시글 전체 목록 조회");
			List<Map<String, Object>> getBabBoardList = null;
			pMap = new HashMap<String, Object>();
			getBabBoardList = sqlSessionTemplate.selectList("getBabBoardList", pMap);
			logger.info("<혼밥> Dao - 전체 조회 목록: " + getBabBoardList.size());
			
			return getBabBoardList;
		}
		
		// <혼술> 모든 게시글 목록 조회 (SELECT)
		public List<Map<String, Object>> getSulBoardList(Map<String, Object> pMap){
			
			logger.info("<혼술>: Dao - getSulBoardList 메소드 진입 - 혼술 게시글 전체 목록 조회");
			List<Map<String, Object>> getSulBoardList = null;
			
			getSulBoardList = sqlSessionTemplate.selectList("getSulBoardList", pMap);
			logger.info("<혼술> Dao - 전체 조회 목록: " + getSulBoardList.size());
			
			return getSulBoardList;
		}
		
		// <혼놀> 모든 게시글 목록 조회 (SELECT)
		public List<Map<String, Object>> getNolBoardList(Map<String, Object> pMap){
					
			logger.info("<혼놀>: Dao - getNolBoardList 메소드 진입 - 혼놀 게시글 전체 목록 조회");
			List<Map<String, Object>> getNolBoardList = null;
					
			getNolBoardList = sqlSessionTemplate.selectList("getNolBoardList", pMap);
			logger.info("<혼놀> Dao - 전체 조회 목록: " + getNolBoardList.size());
					
			return getNolBoardList;
		}
		
		// 모든 게시글 목록 조회 끝 ================================================================
		
		
		
		
		
		// 선택 게시글 목록 내용 조회  ===============================================================
		
		// <혼밥> 선택 게시글 목록 내용 조회 (SELECT) - WHERE
		public List<Map<String, Object>> getBabBoardOneList(Map<String, Object> pMap){
			
			logger.info("<혼밥>: Dao - getBabBoardOneList 메소드 진입 - 선택 게시글 목록 내용 조회");
			List<Map<String, Object>> getBabBoardOneList = null;
							
			getBabBoardOneList = sqlSessionTemplate.selectList("getBabBoardOneList", pMap);
			logger.info("<혼밥> Dao - 선택 게시글 목록 내용 조회: " + getBabBoardOneList.size());
							
			return getBabBoardOneList;
		}
		
		// <혼술> 선택 게시글 목록 내용 조회 (SELECT) - WHERE
		public List<Map<String, Object>> getSulBoardOneList(Map<String, Object> pMap){
				
			logger.info("<혼술>: Dao - getSulBoardOneList 메소드 진입 - 선택 게시글 목록 내용 조회");
			List<Map<String, Object>> getSulBoardOneList = null;
								
			getSulBoardOneList = sqlSessionTemplate.selectList("getSulBoardOneList", pMap);
			logger.info("<혼술> Dao - 선택 게시글 목록 내용 조회: " + getSulBoardOneList.size());
								
			return getSulBoardOneList;
		}
			
		// <혼밥> 선택 게시글 목록 내용 조회 (SELECT) - WHERE
		public List<Map<String, Object>> getNolBoardOneList(Map<String, Object> pMap){
				
			logger.info("<혼밥>: Dao - getNolBoardOneList 메소드 진입 - 선택 게시글 목록 내용 조회");
			List<Map<String, Object>> getNolBoardOneList = null;
								
			getNolBoardOneList = sqlSessionTemplate.selectList("getNolBoardOneList", pMap);
			logger.info("<혼밥> Dao - 선택 게시글 목록 내용 조회: " + getNolBoardOneList.size());
								
			return getNolBoardOneList;
		}
		
		// 선택 게시글 목록 내용 조회  끝 =============================================================
		
		
		
		
		
		// 게시글 등록 =========================================================================
		
		// <혼밥>, <혼술>, <혼놀> 게시글 등록 (INSERT) - REQUEST STRING KEY INSERT
		public int getBoardInsert(Map<String, Object> pMap, String key) {
			
			logger.info("<혼밥>, <혼술>, <혼놀> Dao - getBoardInsert 메소드 진입 - 게시글 등록");
			int result = 0; 
			
			logger.info("받은 KEY값 : " + key);
			
			if("혼밥".equals(key)) {
				
				// <혼밥> INSERT
				logger.info("<혼밥> INSERT 실행");
				result = sqlSessionTemplate.insert("getBabBoardInsert", pMap);
				logger.info("<혼밥> INSERT 결과: " + result);
				logger.info("<혼밥> getBabBoardInsert INSERT 종료");
				
			} else if("혼술".equals(key)) {
				
				// <혼술> INSERT
				logger.info("<혼술> INSERT 실행");
				result = sqlSessionTemplate.insert("getSulBoardInsert", pMap);
				logger.info("<혼술> INSERT 결과: " + result);
				logger.info("<혼술> getSulBoardInsert INSERT 종료");
				
			} else if("혼놀".equals(key)) {
				
				// <혼놀> INSERT
				logger.info("<혼놀> INSERT 실행");
				result = sqlSessionTemplate.insert("getNolBoardInsert", pMap);
				logger.info("<혼놀> INSERT 결과: " + result);
				logger.info("<혼놀> getNolBoardInsert INSERT 종료");
				
			} else {
				
				// INSERT 실패
				logger.info("INSERT 실패 : " + result + " (KEY 값을 확인해 주세요)");
			}
			
			logger.info("Dao - getBoardInsert INSERT 종료");
			return result;
		}
		
		// 게시글 등록 끝 ========================================================================
		
		
		
		
		
		// 선택 게시글 삭제 ======================================================================
		
		// <혼밥>, <혼술>, <혼놀> 선택 게시글 삭제 (DELETE) - REQUEST STRING KEY DELETE
		public int getBoardDelete(Map<String, Object> pMap, String key) {
			
			logger.info("<혼밥>, <혼술>, <혼놀> Dao - getBoardDelete 메소드 진입 - 선택 게시글 삭제");
			int result = 0;
			
			if("혼밥".equals(key)) {
				
				// <혼밥> DELETE
				logger.info("<혼밥> DELETE 실행");
				result = sqlSessionTemplate.delete("getBabBoardDelete", pMap);
				logger.info("<혼밥> DELETE 결과: " + result);
				logger.info("<혼밥> getBabBoardDelete DELETE 종료");
				
			} else if("혼술".equals(key)) {
				
				// <혼술> DELETE
				logger.info("<혼술> DELETE 실행");
				result = sqlSessionTemplate.delete("getSulBoardDelete", pMap);
				logger.info("<혼술> DELETE 결과: " + result);
				logger.info("<혼술> getSulBoardDelete DELETE 종료");
				
			} else if("혼놀".equals(key)) {
				
				// <혼놀> DELETE
				logger.info("<혼놀> DELETE 실행");
				result = sqlSessionTemplate.delete("getNolBoardDelete", pMap);
				logger.info("<혼놀> DELETE 결과: " + result);
				logger.info("<혼놀> getNolBoardDelete DELETE 종료");
				
			} else {
				
				// DELETE 실패
				logger.info("DELETE 실패 : " + result + " (KEY 값을 확인해 주세요)");
			}
			
			logger.info("Dao - getBoardDelete DELETE 종료");
			return result;
		}
		
		// 선택 게시글 삭제  끝 ====================================================================
		
		
		
		
		
		// 선택 게시글 수정 ======================================================================
		
		// <혼밥>, <혼술>, <혼놀> 선택 게시글 수정(UPDATE) - SET UPDATE
		public int getBoardUpdate(Map<String, Object> pMap, String key) {
			
			logger.info("<혼밥>, <혼술>, <혼놀> Dao - getBoardUpdate 메소드 진입 - 선택 게시글 수정");
			int result = 0;
			
			if("혼밥".equals(key)) {
				
				logger.info("<혼밥> UPDATE 실행");
				result = sqlSessionTemplate.update("getBabBoardUpdate", pMap);
				logger.info("<혼밥> UPDATE 결과: " + result);
				logger.info("<혼밥> getBabBoardUpdate UPDATE 종료");
				
			} else if("혼술".equals(key)) {
				
				logger.info("<혼술> UPDATE 실행");
				result = sqlSessionTemplate.update("getSulBoardUpdate", pMap);
				logger.info("<혼술> UPDATE 결과: " + result);
				logger.info("<혼술> getSulBoardUpdate UPDATE 종료");
				
			} else if("혼놀".equals(key)) {
				
				logger.info("<혼놀> UPDATE 실행");
				result = sqlSessionTemplate.update("getNolBoardUpdate", pMap);
				logger.info("<혼놀> UPDATE 결과: " + result);
				logger.info("<혼놀> getNolBoardUpdate UPDATE 종료");
				
			} else {
				
				// UPDATE 실패
				logger.info("UPDATE 실패 : " + result + " (KEY 값을 확인해 주세요)");
			}
				
			logger.info("Dao - getBoardUpdate UPDATE 종료");
			return result;
		}
		
		// 선택 게시글 수정 끝 ====================================================================
		
		
		
		
		
		// 게시판 댓글 조회
		
		// <혼밥>
		public List<Map<String, Object>> getBabCommentList(Map<String, Object>pMap){
			
			logger.info("getBabCommentList 메소드 < Dao > 진입");
			List<Map<String, Object>> getBabCommentList = null;
			
			getBabCommentList = sqlSessionTemplate.selectList("getBabCommentList", pMap);
			logger.info("<혼밥> Dao - 전체 조회 목록: " + getBabCommentList.size());
			
			return getBabCommentList;
		}
		
		
		// <혼술>
		public List<Map<String, Object>> getSulCommentList(Map<String, Object>pMap){
			
			logger.info("getSulCommentList 메소드 < Dao > 진입");
			List<Map<String, Object>> getSulCommentList = null;
			
			getSulCommentList = sqlSessionTemplate.selectList("getSulCommentList", pMap);
			logger.info("<혼밥> Dao - 전체 조회 목록: " + getSulCommentList.size());
			
			return getSulCommentList;
		}
		
		
		
		
		
		// <혼놀>
		public List<Map<String, Object>> getNolCommentList(Map<String, Object>pMap){
	
			logger.info("getNolCommentList 메소드 < Dao > 진입");
			List<Map<String, Object>> getNolCommentList = null;
	
			getNolCommentList = sqlSessionTemplate.selectList("getNolCommentList", pMap);
			logger.info("<혼밥> Dao - 전체 조회 목록: " + getNolCommentList.size());
	
			return getNolCommentList;
		}
		
		
		
		
		// 게시판 댓글 입력
		public int getCommentInsert(Map<String, Object> pMap) {
			logger.info("getCommentInsert 메소드 < Dao > 진입");
			int result = 0;
			result = sqlSessionTemplate.insert("getCommentInsert", pMap);
			logger.info("getCommentInsert 메소드 < Dao > 종료");
			return result;
		}
		
		
		
		
		
		
		
		// 게시판 댓글 삭제
		
		
		
		// 게시판 댓글 수정
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
