package hj.logic;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.QnADao;

@Service
public class QnALogic {
	Logger logger = Logger.getLogger(QnALogic.class);

	@Autowired
	private QnADao qnaDao = null;
	

	// QnA 전체 게시글 조회 Logic
	public List<Map<String, Object>> qnaBoardListLogic() throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardListLogic 메소드 진입");

		List<Map<String, Object>> qnaBoardListLogic = null;

		qnaBoardListLogic = qnaDao.getQnAList();

		logger.info("<QnALogic> qnaBoardListLogic 메소드 종료 >>>>>>>>>>>>>>>>");

		return qnaBoardListLogic;
	}

	public List<Map<String, Object>> qnaBoardIdListLogic(Map<String, Object> pMap)
			throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardIdListLogic 메소드 진입");

		List<Map<String, Object>> qnaBoardIdListLogic = null;

		qnaBoardIdListLogic = qnaDao.getQnAIdList(pMap);

		logger.info("<QnALogic> qnaBoardIdListLogic 메소드 종료 >>>>>>>>>>>>>>>>");

		return qnaBoardIdListLogic;
	}

	// QnA 게시글 INSERT Logic
	public int qnaBoardInsertLogic(Map<String, Object> pMap) throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardInsertLogic 메소드 진입");

		int result = 0;

		result = qnaDao.getQnAInsert(pMap);
		logger.info("qnaBoardInsertLogic Logic INSERT 결과 : " + result);
		logger.info("<QnALogic> qnaBoardInsertLogic 메소드 종료 >>>>>>>>>>>>>>>>");

		return result;
	}

	// QnA 게시글 DELETE Logic
	public int qDelete(Map<String, Object> pMap) {
		logger.info("<QnALogic> qnaBoardDeleteLogic 메소드 진입");

		int result = 0;

		result = qnaDao.getQnADelete(pMap);
		logger.info("qnaBoardDeleteLogic Logic DELETE 결과 : " + result);
		logger.info("<QnALogic> qnaBoardDeleteLogic 메소드 종료 >>>>>>>>>>>>>>>>");

		return result;
	}

	// QnA 게시글 UPDATE Logic
	public int qnaBoardUpdateLogic(Map<String, Object> pMap) throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardUpdateLogic 메소드 진입");

		int result = 0;

		result = qnaDao.getQnAUpdate(pMap);
		logger.info("qnaBoardUpdateLogic Logic 결과 UPDATE : " + result);
		logger.info("<QnALogic> qnaBoardUpdateLogic 메소드 종료 >>>>>>>>>>>>>>>>");

		return result;
	}
}
