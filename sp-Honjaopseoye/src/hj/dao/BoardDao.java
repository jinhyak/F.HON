package hj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;


public class BoardDao{
		Logger logger = Logger.getLogger(BoardDao.class);
		
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
		
		
		
		
		
		// 해당 아이디 목록 게시글 조회 =============================================================
		
	/*	// <혼밥> 해당 아이디 게시글 목록 조회 (SELECT) - WHERE
		public List<Map<String, Object>> getBabBoardIdList(Map<String, Object> pMap){
			
			logger.info("<혼밥>: Dao - getBabBoardIdList 메소드 진입 - 해당 아이디 게시글 목록 조회");
			List<Map<String, Object>> getBabBoardIdList = null;
					
			getBabBoardIdList = sqlSessionTemplate.selectList("getBabBoardIdList", pMap);
			logger.info("<혼밥> Dao - 해당 아이디 조회 목록: " + getBabBoardIdList.size());
					
			return getBabBoardIdList;
		}
		
		// <혼술> 해당 아이디 게시글 목록 조회 (SELECT) - WHERE
		public List<Map<String, Object>> getSulBoardIdList(Map<String, Object> pMap){
				
			logger.info("<혼술>: Dao - getSulBoardIdList 메소드 진입 - 해당 아이디 게시글 목록 조회");
			List<Map<String, Object>> getSulBoardIdList = null;
						
			getSulBoardIdList = sqlSessionTemplate.selectList("getSulBoardIdList", pMap);
			logger.info("<혼술> Dao - 해당 아이디 조회 목록: " + getSulBoardIdList.size());
						
			return getSulBoardIdList;
		}
		
		// <혼놀> 해당 아이디 게시글 목록 조회 (SELECT) - WHERE
		public List<Map<String, Object>> getNolBoardIdList(Map<String, Object> pMap){
					
			logger.info("<혼놀>: Dao - getNolBoardIdList 메소드 진입 - 해당 아이디 게시글 목록 조회");
			List<Map<String, Object>> getNolBoardIdList = null;
							
			getNolBoardIdList = sqlSessionTemplate.selectList("getNolBoardIdList", pMap);
			logger.info("<혼놀> Dao - 해당 아이디 조회 목록: " + getNolBoardIdList.size());
							
			return getNolBoardIdList;
		}*/
		
		// 해당 아이디 목록 게시글 조회 끝 ============================================================
		
		
		
		
		
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
		
		
		
		
		
		// 해당 제목 목록 게시글 조회 ===============================================================
		
		// Update 준비중... 
		
		// 해당 제목 목록 게시글 조회 끝==============================================================
		
		
		
		
		
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
		
}
