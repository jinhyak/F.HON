package hj.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class BoardDao {
	
	
	Logger logger = Logger.getLogger(BoardDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
			// <혼밥> 모든 게시글 목록 조회 (SELECT)
			public List<Map<String, Object>> getBabBoardList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardList method 시작");
				logger.info("<Category> <<<<< 혼밥 >>>>> ");
				List<Map<String, Object>> getBabBoardList = null;
				
				getBabBoardList = sqlSessionTemplate.selectList("getBabBoardList", pMap);
				logger.info("<Dao> ---> getBabBoardList 전체 조회 사이즈: " + getBabBoardList.size());
				
				return getBabBoardList;
			}
			
			
			
			// <혼술> 모든 게시글 목록 조회 (SELECT)
			public List<Map<String, Object>> getSulBoardList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getSulBoardList method 시작");
				logger.info("<Category> <<<<< 혼술 >>>>> ");
				List<Map<String, Object>> getSulBoardList = null;
				
				getSulBoardList = sqlSessionTemplate.selectList("getSulBoardList", pMap);
				logger.info("<Dao> ---> getSulBoardList 전체 조회 사이즈: " + getSulBoardList.size());
				
				return getSulBoardList;
			}
			
			
			
			// <혼놀> 모든 게시글 목록 조회 (SELECT)
			public List<Map<String, Object>> getNolBoardList(Map<String, Object> pMap){
						
				logger.info("<Dao> ---> getNolBoardList method 시작");
				logger.info("<Category> <<<<< 혼놀 >>>>> ");
				List<Map<String, Object>> getNolBoardList = null;
						
				getNolBoardList = sqlSessionTemplate.selectList("getNolBoardList", pMap);
				logger.info("<Dao> ---> getSulBoardList 전체 조회 사이즈: " + getNolBoardList.size());
						
				return getNolBoardList;
			}
			
			
			
			// <혼밥> 선택 게시글 목록 내용 조회 (SELECT) - WHERE
			public List<Map<String, Object>> getBabBoardOneList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardOneList method 시작");
				List<Map<String, Object>> getBabBoardOneList = null;
								
				getBabBoardOneList = sqlSessionTemplate.selectList("getBabBoardOneList", pMap);
				logger.info("<Dao> ---> getBabBoardOneList 전체 조회 사이즈: " + getBabBoardOneList.size());
								
				return getBabBoardOneList;
			}
			
			
			
			// <혼술> 선택 게시글 목록 내용 조회 (SELECT) - WHERE
			public List<Map<String, Object>> getSulBoardOneList(Map<String, Object> pMap){
					
				logger.info("<Dao> ---> getSulBoardOneList method 시작");
				List<Map<String, Object>> getSulBoardOneList = null;
									
				getSulBoardOneList = sqlSessionTemplate.selectList("getSulBoardOneList", pMap);
				logger.info("<Dao> ---> getSulBoardOneList 전체 조회 사이즈: " + getSulBoardOneList.size());
									
				return getSulBoardOneList;
			}
			
			
				
			// <혼밥> 선택 게시글 목록 내용 조회 (SELECT) - WHERE
			public List<Map<String, Object>> getNolBoardOneList(Map<String, Object> pMap){
					
				logger.info("<Dao> ---> getNolBoardOneList method 시작");
				List<Map<String, Object>> getNolBoardOneList = null;
									
				getNolBoardOneList = sqlSessionTemplate.selectList("getNolBoardOneList", pMap);
				logger.info("<Dao> ---> getNolBoardOneList 전체 조회 사이즈: " + getNolBoardOneList.size());
									
				return getNolBoardOneList;
			}
			
			
			
			// <혼밥> 댓글 조회
			public List<Map<String, Object>> getBabBoardCommentList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardCommentList method 시작");
				List<Map<String, Object>> getBabBoardCommentList = null;
				
				getBabBoardCommentList = sqlSessionTemplate.selectList("getBabBoardCommentList", pMap);
				logger.info("<Dao> ---> getBabBoardCommentList 전체 조회 사이즈: " + getBabBoardCommentList.size());
				
				return getBabBoardCommentList;
			}
			
			
			
			// <혼술> 댓글 조회
			public List<Map<String, Object>> getSulBoardCommentList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getSulBoardCommentList method 시작");
				List<Map<String, Object>> getSulBoardCommentList = null;
				
				getSulBoardCommentList = sqlSessionTemplate.selectList("getSulBoardCommentList", pMap);
				logger.info("<Dao> ---> getSulBoardCommentList 전체 조회 사이즈: " + getSulBoardCommentList.size());
				
				return getSulBoardCommentList;
			}
			
			
			
			
			// <혼놀> 댓글 조회
			public List<Map<String, Object>> getNolBoardCommentList(Map<String, Object> pMap){
		
				logger.info("<Dao> ---> getNolBoardCommentList method 시작");
				List<Map<String, Object>> getNolBoardCommentList = null;
		
				getNolBoardCommentList = sqlSessionTemplate.selectList("getNolBoardCommentList", pMap);
				logger.info("<Dao> ---> getNolBoardCommentList 전체 조회 사이즈: " + getNolBoardCommentList.size());
		
				return getNolBoardCommentList;
			}
			
			
			
			
			// 게시판 혼밥 입력
			public int getBabBoardInsert(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardInsert method 시작");
				int result = 0;
				result = sqlSessionTemplate.insert("getBabBoardInsert", pMap);
				logger.info("<Dao> ---> getBabBoardInsert 입력 성공: " + result);
				return result;
			}
			
			
			
		    // 게시판 혼술 입력
			public int getSulBoardInsert(Map<String, Object> pMap) {
							
				logger.info("<Dao> ---> getSulBoardInsert method 시작");
				int result = 0;
				result = sqlSessionTemplate.insert("getSulBoardInsert", pMap);
				logger.info("<Dao> ---> getSulBoardInsert 입력 성공: " + result);
				return result;
			}
			
			
			
			// 게시판 혼놀 입력
			public int getNolBoardInsert(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getNolBoardInsert method 시작");
				int result = 0;
				result = sqlSessionTemplate.insert("getNolBoardInsert", pMap);
				logger.info("<Dao> ---> getNolBoardInsert 입력 성공: " + result);
				return result;
			}
			
			// 게시판 혼밥 삭제
			public int getBabBoardDelete(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardDelete method 시작");
				int result = 0;
				result = sqlSessionTemplate.delete("getBabBoardDelete", pMap);
				logger.info("<Dao> ---> getBabBoardDelete 입력 성공: " + result);
				return result;
				
			}
			
			
			// 게시판 혼밥 삭제
			public int getSulBoardDelete(Map<String, Object> pMap) {

				logger.info("<Dao> ---> getSulBoardDelete method 시작");
				int result = 0;
				result = sqlSessionTemplate.delete("getSulBoardDelete", pMap);
				logger.info("<Dao> ---> getSulBoardDelete 입력 성공: " + result);
				return result;

			}

			// 게시판 혼밥 삭제
			public int getNolBoardDelete(Map<String, Object> pMap) {

				logger.info("<Dao> ---> getNolBoardDelete method 시작");
				int result = 0;
				result = sqlSessionTemplate.delete("getNolBoardDelete", pMap);
				logger.info("<Dao> ---> getNolBoardDelete 입력 성공: " + result);
				return result;

			}
			
			
			
			// 혼밥 게시판 댓글 입력
			public int getBabBoardCommentInsert(Map<String, Object> pMap) {
				
				int result = 0;
				logger.info("<Dao> ---> getBabBoardCommentInsert method 시작");
				result = sqlSessionTemplate.insert("getBabBoardCommentInsert", pMap);
				logger.info("<Dao> ---> getBabBoardCommentInsert 입력 성공: " + result);
				
				return result;
			}
			

			// 혼밥 게시판 댓글 입력
			public int getSulBoardCommentInsert(Map<String, Object> pMap) {
				
				int result = 0;
				logger.info("<Dao> ---> getSulBoardCommentInsert method 시작");
				result = sqlSessionTemplate.insert("getSulBoardCommentInsert", pMap);
				logger.info("<Dao> ---> getSulBoardCommentInsert 입력 성공: " + result);
				
				return result;
			}
			

			// 혼밥 게시판 댓글 입력
			public int getNolBoardCommentInsert(Map<String, Object> pMap) {
				
				int result = 0;
				logger.info("<Dao> ---> getNolBoardCommentInsert method 시작");
				result = sqlSessionTemplate.insert("getNolBoardCommentInsert", pMap);
				logger.info("<Dao> ---> getNolBoardCommentInsert 입력 성공: " + result);
				
				return result;
			}
			
			
			
			// 혼밥 게시판 수정
			public int getBabBoardUpdate(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardUpdate method 시작");
				int result = 0;
				result = sqlSessionTemplate.update("getBabBoardUpdate", pMap);
				logger.info("<Dao> ---> getBabBoardUpdate 입력 성공: " + result);
				
				return result;
			}
			
			
			
			// 혼술 게시판 수정
			public int getSulBoardUpdate(Map<String, Object> pMap) {
	
				logger.info("<Dao> ---> getSulBoardUpdate method 시작");
				int result = 0;
				result = sqlSessionTemplate.update("getSulBoardUpdate", pMap);
				logger.info("<Dao> ---> getSulBoardUpdate 입력 성공: " + result);
	
				return result;
			}
						
						
						
			// 혼놀 게시판 수정
			public int getNolBoardUpdate(Map<String, Object> pMap) {
							
				logger.info("<Dao> ---> getNolBoardUpdate method 시작");
				int result = 0;
				result = sqlSessionTemplate.update("getNolBoardUpdate", pMap);
				logger.info("<Dao> ---> getNolBoardUpdate 입력 성공: " + result);
							
				return result;
			}

			
			
			// 조회수 카운트
			
			// 혼밥 조회수 카운트
			public int getBabBoardHitUpdate(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardHitUpdate method 시작");
				int result = 0;
				
				result = sqlSessionTemplate.update("getBabBoardHitUpdate", pMap);
				logger.info("<Dao> ---> getBabBoardHitUpdate 입력 성공: " + result);
				return result;
				
			}
			
			// 혼밥 조회수 카운트
			public int getSulBoardHitUpdate(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getSulBoardHitUpdate method 시작");
				int result = 0;
		
				result = sqlSessionTemplate.update("getSulBoardHitUpdate", pMap);
				logger.info("<Dao> ---> getSulBoardHitUpdate 입력 성공: " + result);
				return result;
		
			}
		
			// 혼밥 조회수 카운트
			public int getNolBoardHitUpdate(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getNolBoardHitUpdate method 시작");
				int result = 0;
		
				result = sqlSessionTemplate.update("getNolBoardHitUpdate", pMap);
				logger.info("<Dao> ---> getNolBoardHitUpdate 입력 성공: " + result);
				return result;
		
			}
			
			// 최고 조회수
			
			// 혼밥
			public List<Map<String, Object>> getBabBoardHitMax(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardHitMax method 시작");
				List<Map<String, Object>> getBabBoardHitMax = null;
				getBabBoardHitMax = sqlSessionTemplate.selectList("getBabBoardHitMax", pMap);
				logger.info("<Dao> ---> getBabBoardList 전체 조회 사이즈: " + getBabBoardHitMax.size());
				
				return getBabBoardHitMax;
			}
			
			
			// 혼술
			public List<Map<String, Object>> getSulBoardHitMax(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getSulBoardHitMax method 시작");
				List<Map<String, Object>> getSulBoardHitMax = null;
				getSulBoardHitMax = sqlSessionTemplate.selectList("getSulBoardHitMax", pMap);
				logger.info("<Dao> ---> getSulBoardHitMax 전체 조회 사이즈: " + getSulBoardHitMax.size());
		
				return getSulBoardHitMax;
			}
					
			
			
			// 혼놀 
			public List<Map<String, Object>> getNolBoardHitMax(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getNolBoardHitMax method 시작");
				List<Map<String, Object>> getNolBoardHitMax = null;
				getNolBoardHitMax = sqlSessionTemplate.selectList("getNolBoardHitMax", pMap);
				logger.info("<Dao> ---> getNolBoardHitMax 전체 조회 사이즈: " + getNolBoardHitMax.size());
		
				return getNolBoardHitMax;
			}
			
			// 댓글 카운트
			

}
