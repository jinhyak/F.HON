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
	
	// 濡쒓렇
	Logger logger = Logger.getLogger(BoardLogic.class);
	
	
	@Autowired
	private BoardDao boardDao = null;


	/*
	 * Logic class�뿉�꽌 媛믪쓣 �쟾�떖諛쏄퀬 媛믪뿉 ���븳 �뜲�씠�꽣 �젙蹂닿컪�쓣 怨꾩궛�븯�뿬 Controller�뿉 蹂대궡以꾧굅�엫 
	 * 	
	*/
	
	// <�샎諛�>, <�샎�닠>, <�샎��> 紐⑤뱺 寃뚯떆湲� 紐⑸줉 議고쉶 Logic
	public List<Map<String, Object>> boardListLogic(Map<String, Object> pMap, String key) 
	throws ServletException, IOException {
		
		
		// �옱�궗�슜�븷 List
		List<Map<String, Object>> boardListLogic = null;
		pMap = new HashMap<String, Object>(); 
		// 諛쏆� key媛�
		logger.info("<Logic> 諛쏆븘�삩 key媛�" + key);
		
		// �샎諛� 寃뚯떆湲� 紐⑸줉 議고쉶
		if("혼밥".equals(key)) {
			logger.info("<Logic> �샎諛� if 吏꾩엯");
			boardListLogic = boardDao.getBabBoardList(pMap);
			
		} else if("혼술".equals(key)) { // �샎�닠 寃뚯떆湲� 紐⑸줉 議고쉶
			logger.info("<Logic> �샎�닠 if 吏꾩엯");
			boardListLogic = boardDao.getSulBoardList(pMap);
			
		} else if("혼놀".equals(key)) { // �샎�� 寃뚯떆湲� 紐⑸줉 議고쉶
			logger.info("<Logic> �샎�� if 吏꾩엯");
			boardListLogic = boardDao.getNolBoardList(pMap);
			
		} else { // �샇異� �떎�뙣
			
			logger.info("<Logic> �빐�떦 議곌굔�쓣 留뚯” �떆�궎吏� �븡�뒿�땲�떎." + key);
		}
		
		
		logger.info("<Logic> boardListLogic�쓽 媛� : " + boardListLogic.size());
		
		return boardListLogic;
	}
	
	
	
	// �꽑�깮 寃뚯떆湲� 紐⑸줉 �궡�슜 議고쉶
	public List<Map<String, Object>> boardOneListLogic(Map<String, Object> pMap, String key) 
			throws ServletException, IOException {
				
				logger.info("boardOneListLogic Logic 硫붿냼�뱶 吏꾩엯 - �빐�떦  寃뚯떆湲� 紐⑸줉 議고쉶 Logic");
				
				// �옱�궗�슜�븷 List
				List<Map<String, Object>> boardOneListLogic = null;
				// 諛쏆� key媛�
				logger.info("<Logic> 諛쏆븘�삩 key媛�" + key);
				
				// �샎諛� 寃뚯떆湲� 紐⑸줉 議고쉶
				if("�샎諛�".equals(key)) {
					logger.info("<Logic> �샎諛� if 吏꾩엯");
					boardOneListLogic = boardDao.getBabBoardOneList(pMap);
					
				} else if("�샎�닠".equals(key)) { // �샎�닠 寃뚯떆湲� 紐⑸줉 議고쉶
					logger.info("<Logic> �샎�닠 if 吏꾩엯");
					boardOneListLogic = boardDao.getSulBoardOneList(pMap);
					
				} else if("�샎��".equals(key)) { // �샎�� 寃뚯떆湲� 紐⑸줉 議고쉶
					logger.info("<Logic> �샎�� if 吏꾩엯");
					boardOneListLogic = boardDao.getNolBoardOneList(pMap);
					
				} else { // �샇異� �떎�뙣
					
					logger.info("<Logic> �빐�떦 議곌굔�쓣 留뚯” �떆�궎吏� �븡�뒿�땲�떎." + key);
				}
				
				
				logger.info("<Logic> boardOneListLogic�쓽 媛� : " + boardOneListLogic.size());
				
				return boardOneListLogic;
			}

	
	
	// �엯�젰 濡쒖쭅
	
	public int boardInsertLogic(Map<String, Object> pMap, String key)
			throws ServletException, IOException {

		logger.info("boardInsertLogic Logic 硫붿냼�뱶 吏꾩엯 - �빐�떦 寃뚯떆湲� �벑濡� Logic");

		int result = 0;

		// 諛쏆� key媛�
		logger.info("<Logic> 諛쏆븘�삩 key媛�" + key);

		result = boardDao.getBoardInsert(pMap, key);
		logger.info("<Logic> boardInsertLogic 硫붿냼�뱶 醫낅즺 �빀�땲�떎. 寃곌낵: " + result);

		return result;

	}
	
	// �궘�젣 �샇吏�
	
	public int boardDeleteLogic(Map<String, Object> pMap, String key) 
			throws ServletException, IOException {
		logger.info("boardDeleteLogic Logic 硫붿냼�뱶 吏꾩엯 - 寃뚯떆湲� �궘�젣 Logic");
		
		int result = 0;
		
		result = boardDao.getBoardDelete(pMap, key);
		
		logger.info("<Logic> 諛쏆븘�삩 key媛�" + key);
		logger.info("<Logic> boardDeleteLogic 硫붿냼�뱶 醫낅즺 �빀�땲�떎. 寃곌낵: " + result);
		
		return result;
	}
	
	
	// �뾽�뜲�씠�듃 濡쒖쭅
	
	public int boardUpdateLogic(Map<String, Object> pMap, String key) 
			throws ServletException, IOException {
		logger.info("boardUpdateLogic Logic 硫붿냼�뱶 吏꾩엯 - 寃뚯떆湲� �궘�젣 Logic");
		
		int result = 0;
		
		result = boardDao.getBoardUpdate(pMap, key);
		
		logger.info("<Logic> 諛쏆븘�삩 key媛�" + key);
		logger.info("<Logic> boardUpdateLogic 硫붿냼�뱶 醫낅즺 �빀�땲�떎. 寃곌낵: " + result);
		
		return result;
	}

	
	// �뙎湲� 泥섎━ LOGIC
	public List<Map<String, Object>> CommentListLogic(Map<String, Object> pMap, 
			String no, String category) {
		
		logger.info("<Logic> CommentListLogic 吏꾩엯");
		List<Map<String, Object>> CommentListLogic = null;

		if("�샎諛�".equals(category)) {
			
			logger.info("<Logic> �샎諛� �뙎湲� <id> Logic");
			CommentListLogic = boardDao.getBabCommentList(pMap);
			
		} else if("�샎�닠".equals(category)) {
			
			logger.info("<Logic> �샎諛� �뙎湲� <id> Logic");
			CommentListLogic = boardDao.getSulCommentList(pMap);
			
		} else if("�샎��".equals(category)) {
			
			logger.info("<Logic> �샎諛� �뙎湲� <id> Logic");
			CommentListLogic = boardDao.getNolCommentList(pMap);
			
		} else {
			
			logger.info("<Logic> �샎諛� �뙎湲� Logic �떎�뙣 key媛� �솗�엫�젏 " + category);
			
		}
		
		logger.info("<Logic> CommentListLogic 醫낅즺");
		
		return CommentListLogic;
	}
	
	public int CommentInsertLogic(Map<String, Object> pMap, String category, String no) {
		
		logger.info("<Logic> CommentInsertLogic �떎�뻾");
		int result = 0;
		result = boardDao.getCommentInsert(pMap);
		logger.info("<Logic> CommentInsertLogic 醫낅즺");
		return result;
		
	}
	
	
	
	
}




















