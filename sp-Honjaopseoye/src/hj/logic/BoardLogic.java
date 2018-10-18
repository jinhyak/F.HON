package hj.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.BoardDao;

@Service
public class BoardLogic {
	
	// Log Debug
	Logger logger = Logger.getLogger(BoardLogic.class);
	
	@Autowired
	private BoardDao boardDao = null;
	
	
	// 모든 게시글 목록 조회 Logic
	public List<Map<String, Object>> logBoardList(Map<String, Object> pMap, String category){
		
		logger.info("<Logic> ---> logBoardList method 시작");
		List<Map<String, Object>> logBoardList = null;
		
		if("혼밥".equals(category)) {
			
			logger.info("<Logic> ---> if(혼밥)시작");
			logBoardList = boardDao.getBabBoardList(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Logic> ---> if(혼술)시작");
			logBoardList = boardDao.getSulBoardList(pMap);
			logger.info("<Logic> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Logic> ---> if(혼놀)시작");
			logBoardList = boardDao.getNolBoardList(pMap);
			logger.info("<Logic> ---> if(혼놀)종료");
			
		} else {
			
			logger.info("<Logic> ---> logBoardList 오류 파라미터: category 값을 확인해 주세요 " + category);
			
		}
		
		logger.info("<Logic> ---> logBoardList 전체 조회 사이즈: " + logBoardList.size());
		
		return logBoardList;
	}
	
	
	
	// 해당 게시글 조회 Logic
	public List<Map<String, Object>> logBoardOneList(Map<String, Object> pMap, String category, String no){
		
		logger.info("<Logic> ---> logBoardOneList method 시작");
		List<Map<String, Object>> logBoardOneList = null;
		pMap = new HashMap<String, Object>();
		
		if("혼밥".equals(category)) {
			
			pMap.put("bab_no", no);
			logger.info("<Logic> ---> if(혼밥)시작");
			logBoardOneList = boardDao.getBabBoardOneList(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			pMap.put("sul_no", no);
			logger.info("<Logic> ---> if(혼술)시작");
			logBoardOneList = boardDao.getSulBoardOneList(pMap);
			logger.info("<Logic> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			pMap.put("nol_no", no);
			logger.info("<Logic> ---> if(혼놀)시작");
			logBoardOneList = boardDao.getNolBoardOneList(pMap);
			logger.info("<Logic> ---> if(혼놀)종료");
			
		} else {
			
			logger.info("<Logic> ---> logBoardOneList 오류 파라미터: category 값을 확인해 주세요 " + category);
			
		}
		
		logger.info("<Logic> 종료 ---> logBoardOneList 전체 조회 사이즈: " + logBoardOneList.size());
		
		return logBoardOneList;
	}
	
	// 해당 게시글  -> 댓글 리스트 조회 Logic
	public List<Map<String, Object>> logBoardCommentList(Map<String, Object> pMap, String category, String no){
		
		 logger.info("<Logic> ---> logBoardCommentList method 시작");
		 List<Map<String, Object>> logBoardCommentList = null;
		 
		 if("혼밥".equals(category)) {
			 
			 logger.info("<Logic> ---> if(혼밥)시작");
			 logBoardCommentList = boardDao.getBabBoardCommentList(pMap);
			 logger.info("<Logic> ---> if(혼밥)종료");
			 
		 } else if("혼술".equals(category)) {
			 
			 logger.info("<Logic> ---> if(혼술)시작");
			 logBoardCommentList = boardDao.getSulBoardCommentList(pMap);
			 logger.info("<Logic> ---> if(혼술)종료");
			 
		 } else if("혼놀".equals(category)) {
			 
			 logger.info("<Logic> ---> if(혼놀)시작");
			 logBoardCommentList = boardDao.getNolBoardCommentList(pMap);
			 logger.info("<Logic> ---> if(혼놀)종료");
			 
		 } else {
			 
			 logger.info("<Logic> ---> logBoardCommentList 오류 파라미터: category, no 값을 확인해 주세요 " + category + " , " + no);
		 }
		 
		 logger.info("<Logic> 종료 ---> logBoardCommentList 전체 조회 사이즈: " + logBoardCommentList.size());
		 
		 return logBoardCommentList;
		
	}
	
	
	// 게시글 입력 Logic 
	public int logBoardInsert(Map<String, Object> pMap, String category) {
		
		logger.info("<Logic> ---> logBoardInsert method 시작");
		int result = 0;

		
		if("혼밥".equals(category)) {
			
			logger.info("<Logic> ---> if(혼밥)시작");
			result = boardDao.getBabBoardInsert(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Logic> ---> if(혼술)시작");
			result = boardDao.getSulBoardInsert(pMap);
			logger.info("<Logic> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Logic> ---> if(혼놀)시작");
			result = boardDao.getNolBoardInsert(pMap);
			logger.info("<Logic> ---> if(혼놀)종료");
			
		} else {
			
			 logger.info("<Logic> ---> logBoardInsert 오류 파라미터: category 값을 확인해 주세요 " + category);
		}
		
		 logger.info("<Logic> 종료 ---> logBoardInsert 성공 여부: " + result);
		
		return result;
	}
	
	
	
	// 댓글 입력 Logic
	public int logBoardCommentInsert(Map<String, Object> pMap, String category, String no) {
		
		logger.info("<Logic> CommentInsertLogic Start");
		int result = 0;
		logger.info("값 : "+ category +" , "+ no);
		
		if("혼밥".equals(category)) {
			
			logger.info("<Logic> ---> if(혼밥)시작");
			result = boardDao.getBabBoardCommentInsert(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Logic> ---> if(혼술)시작");
			result = boardDao.getSulBoardCommentInsert(pMap);
			logger.info("<Logic> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Logic> ---> if(혼놀)시작");
			result = boardDao.getNolBoardCommentInsert(pMap);
			logger.info("<Logic> ---> if(혼놀)종료");
			
		} else {
			
			logger.info("<Logic> ---> logBoardCommentInsert 오류 파라미터: category 값을 확인해 주세요 " + category);
		
		}
		
		logger.info("<Logic> 종료 ---> logBoardCommentInsert 성공 여부: " + result);
		
		return result;
		
	}
	
	
	// 게시글 삭제
	public int logBoardDelete(Map<String, Object> pMap, String category) {
			
			logger.info("<Logic> ---> logBoardDelete method 시작");
			int result = 0;
			
			if("혼밥".equals(category)) {
				
				logger.info("<Logic> ---> if(혼밥)시작");
				result = boardDao.getBabBoardDelete(pMap);
				logger.info("<Logic> ---> if(혼밥)종료");
				
			} else if("혼술".equals(category)) {
				
				logger.info("<Logic> ---> if(혼술)시작");
				result = boardDao.getSulBoardDelete(pMap);
				logger.info("<Logic> ---> if(혼술)종료");
				
			} else if("혼놀".equals(category)) {
				
				logger.info("<Logic> ---> if(혼놀)시작");
				result = boardDao.getNolBoardDelete(pMap);
				logger.info("<Logic> ---> if(혼놀)종료");
				
			} else {
				
				 logger.info("<Logic> ---> logBoardDelete 오류 파라미터: category 값을 확인해 주세요 " + category);
			}
			
			 logger.info("<Logic> 종료 ---> logBoardDelete 성공 여부: " + result);
			
			return result;
		}
	
	
	
	
	// 게시판 수정
	public int logBoardUpdate(Map<String, Object> pMap, String category) {
		
		logger.info("<Logic> ---> logBoardUpdate method 시작");
		int result = 0;
		
		if("혼밥".equals(category)) {
			
			logger.info("<Logic> ---> if(혼밥)시작");
			result = boardDao.getBabBoardUpdate(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else if("혼술".equals(category)) {
			
			logger.info("<Logic> ---> if(혼술)시작");
			result = boardDao.getSulBoardUpdate(pMap);
			logger.info("<Logic> ---> if(혼술)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Logic> ---> if(혼놀)시작");
			result = boardDao.getNolBoardUpdate(pMap);
			logger.info("<Logic> ---> if(혼놀)종료");
			
		} else {
			
			logger.info("<Logic> ---> logBoardUpdate 오류 파라미터: category 값을 확인해 주세요 " + category);
			
		}
			
		logger.info("<Logic> 종료 ---> logBoardUpdate 성공 여부: " + result);
		
		return result;
	}
	
	// 조회수 Hit Logic
	public int logBoardHitUpdate(Map<String, Object> pMap, String category) {
		
		logger.info("<Logic> ---> logBoardHitUpdate method 시작");
		int result = 0;
		
		if("혼밥".equals(category)) {
			
			logger.info("<Logic> ---> if(혼밥)시작");
			result = boardDao.getBabBoardHitUpdate(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else if ("혼술".equals(category)) {
			
			logger.info("<Logic> ---> if(혼밥)시작");
			result = boardDao.getSulBoardHitUpdate(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else if("혼놀".equals(category)) {
			
			logger.info("<Logic> ---> if(혼밥)시작");
			result = boardDao.getNolBoardHitUpdate(pMap);
			logger.info("<Logic> ---> if(혼밥)종료");
			
		} else {
			
			logger.info("<Logic> ---> logBoardHitUpdate 오류 파라미터: category 값을 확인해 주세요 " + category);
		}
		
		
		logger.info("<Logic> 종료 ---> logBoardHitUpdate 성공 여부: " + result);
		
		return result;
	}
	
	
	
	
	// 최고 조회수 조회
	
	// 혼밥
	public List<Map<String, Object>> logBabBoardHitMax(Map<String, Object> pMap){
	
		logger.info("<Logic> ---> logBabBoardHitMax method 시작");
		List<Map<String, Object>> logBabBoardHitMax = null;
		logBabBoardHitMax = boardDao.getBabBoardHitMax(pMap);
		logger.info("<Logic> ---> logBabBoardHitMax 전체 조회 사이즈: " + logBabBoardHitMax.size());
		
		return logBabBoardHitMax;
		
	}
	
	// 혼술
	public List<Map<String, Object>> logSulBoardHitMax(Map<String, Object> pMap){
		
		logger.info("<Logic> ---> logSulBoardHitMax method 시작");
		List<Map<String, Object>> logSulBoardHitMax = null;
		logSulBoardHitMax = boardDao.getSulBoardHitMax(pMap);
		logger.info("<Logic> ---> logSulBoardHitMax 전체 조회 사이즈: " + logSulBoardHitMax.size());
		
		return logSulBoardHitMax;
		
	}
	
	// 혼놀
	public List<Map<String, Object>> logNolBoardHitMax(Map<String, Object> pMap){
		
		logger.info("<Logic> ---> logNolBoardHitMax method 시작");
		List<Map<String, Object>> logNolBoardHitMax = null;
		logNolBoardHitMax = boardDao.getNolBoardHitMax(pMap);
		logger.info("<Logic> ---> logNolBoardHitMax 전체 조회 사이즈: " + logNolBoardHitMax.size());
		
		return logNolBoardHitMax;
		
	}
	
	
	
	
	
	
	
}

