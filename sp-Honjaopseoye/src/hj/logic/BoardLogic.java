package hj.logic;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.BoardDao;

@Service
public class BoardLogic {
	
	// 로그
	Logger logger = Logger.getLogger(BoardLogic.class);
	
	
	@Autowired
	private BoardDao boardDao = null;


	/*
	 * Logic class에서 값을 전달받고 값에 대한 데이터 정보값을 계산하여 Controller에 보내줄거임 
	 * 	
	*/
	
	// <혼밥>, <혼술>, <혼놀> 모든 게시글 목록 조회 Logic
	public List<Map<String, Object>> boardListLogic(Map<String, Object> pMap, String key) 
	throws ServletException, IOException {
		
		logger.info("boardListLogic Logic 메소드 진입 - 혼밥 게시글 전체 목록 조회 Logic");
		
		// 재사용할 List
		List<Map<String, Object>> boardListLogic = null;
		pMap = new HashMap<String, Object>(); 
		// 받은 key값
		logger.info("<Logic> 받아온 key값" + key);
		
		// 혼밥 게시글 목록 조회
		if("혼밥".equals(key)) {
			logger.info("<Logic> 혼밥 if 진입");
			boardListLogic = boardDao.getBabBoardList(pMap);
			
		} else if("혼술".equals(key)) { // 혼술 게시글 목록 조회
			logger.info("<Logic> 혼술 if 진입");
			boardListLogic = boardDao.getSulBoardList(pMap);
			
		} else if("혼놀".equals(key)) { // 혼놀 게시글 목록 조회
			logger.info("<Logic> 혼놀 if 진입");
			boardListLogic = boardDao.getNolBoardList(pMap);
			
		} else { // 호출 실패
			
			logger.info("<Logic> 해당 조건을 만족 시키지 않습니다." + key);
		}
		
		
		logger.info("<Logic> boardListLogic의 값 : " + boardListLogic.size());
		
		return boardListLogic;
	}
	
	
	
	// 선택 게시글 목록 내용 조회
	public List<Map<String, Object>> boardOneListLogic(Map<String, Object> pMap, String key) 
			throws ServletException, IOException {
				
				logger.info("boardOneListLogic Logic 메소드 진입 - 해당  게시글 목록 조회 Logic");
				
				// 재사용할 List
				List<Map<String, Object>> boardOneListLogic = null;
				// 받은 key값
				logger.info("<Logic> 받아온 key값" + key);
				
				// 혼밥 게시글 목록 조회
				if("혼밥".equals(key)) {
					logger.info("<Logic> 혼밥 if 진입");
					boardOneListLogic = boardDao.getBabBoardOneList(pMap);
					
				} else if("혼술".equals(key)) { // 혼술 게시글 목록 조회
					logger.info("<Logic> 혼술 if 진입");
					boardOneListLogic = boardDao.getSulBoardOneList(pMap);
					
				} else if("혼놀".equals(key)) { // 혼놀 게시글 목록 조회
					logger.info("<Logic> 혼놀 if 진입");
					boardOneListLogic = boardDao.getNolBoardOneList(pMap);
					
				} else { // 호출 실패
					
					logger.info("<Logic> 해당 조건을 만족 시키지 않습니다." + key);
				}
				
				
				logger.info("<Logic> boardOneListLogic의 값 : " + boardOneListLogic.size());
				
				return boardOneListLogic;
			}

	
	
	// 입력 로직
	
	public int boardInsertLogic(Map<String, Object> pMap, String key)
			throws ServletException, IOException {

		logger.info("boardInsertLogic Logic 메소드 진입 - 해당 게시글 등록 Logic");

		int result = 0;

		// 받은 key값
		logger.info("<Logic> 받아온 key값" + key);

		result = boardDao.getBoardInsert(pMap, key);
		logger.info("<Logic> boardInsertLogic 메소드 종료 합니다. 결과: " + result);

		return result;

	}
	
	// 삭제 호직
	
	public int boardDeleteLogic(Map<String, Object> pMap, String key) 
			throws ServletException, IOException {
		logger.info("boardDeleteLogic Logic 메소드 진입 - 게시글 삭제 Logic");
		
		int result = 0;
		
		result = boardDao.getBoardDelete(pMap, key);
		
		logger.info("<Logic> 받아온 key값" + key);
		logger.info("<Logic> boardDeleteLogic 메소드 종료 합니다. 결과: " + result);
		
		return result;
	}
	
	
	// 업데이트 로직
	
	public int boardUpdateLogic(Map<String, Object> pMap, String key) 
			throws ServletException, IOException {
		logger.info("boardUpdateLogic Logic 메소드 진입 - 게시글 삭제 Logic");
		
		int result = 0;
		
		result = boardDao.getBoardUpdate(pMap, key);
		
		logger.info("<Logic> 받아온 key값" + key);
		logger.info("<Logic> boardUpdateLogic 메소드 종료 합니다. 결과: " + result);
		
		return result;
	}

	
	// 댓글 처리 LOGIC
	public List<Map<String, Object>> CommentListLogic(Map<String, Object> pMap, 
			String no, String category) {
		
		logger.info("<Logic> CommentListLogic 진입");
		List<Map<String, Object>> CommentListLogic = null;

		if("혼밥".equals(category)) {
			
			logger.info("<Logic> 혼밥 댓글 <id> Logic");
			CommentListLogic = boardDao.getBabCommentList(pMap);
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Logic> 혼밥 댓글 <id> Logic");
			CommentListLogic = boardDao.getSulCommentList(pMap);
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Logic> 혼밥 댓글 <id> Logic");
			CommentListLogic = boardDao.getNolCommentList(pMap);
			
		} else {
			
			logger.info("<Logic> 혼밥 댓글 Logic 실패 key값 확임점 " + category);
			
		}
		
		logger.info("<Logic> CommentListLogic 종료");
		
		return CommentListLogic;
	}
	
	public int CommentInsertLogic(Map<String, Object> pMap, String category, String no) {
		
		logger.info("<Logic> CommentInsertLogic 실행");
		int result = 0;
		result = boardDao.getCommentInsert(pMap);
		logger.info("<Logic> CommentInsertLogic 종료");
		return result;
		
	}
	
	
	
	
}




















