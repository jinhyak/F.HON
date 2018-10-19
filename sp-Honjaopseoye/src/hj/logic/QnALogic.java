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
	

	// QnA ��ü �Խñ� ��ȸ Logic
	public List<Map<String, Object>> qnaBoardListLogic() throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardListLogic �޼ҵ� ����");
		List<Map<String, Object>> qnaBoardListLogic = null;
		qnaBoardListLogic = qnaDao.getQnAList();
		logger.info("<QnALogic> qnaBoardListLogic �޼ҵ� ���� >>>>>>>>>>>>>>>>");
		return qnaBoardListLogic;
	}

	public List<Map<String, Object>> qnaBoardIdListLogic(Map<String, Object> pMap)
			throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardIdListLogic �޼ҵ� ����");

		List<Map<String, Object>> qnaBoardIdListLogic = null;

		qnaBoardIdListLogic = qnaDao.getQnAIdList(pMap);

		logger.info("<QnALogic> qnaBoardIdListLogic �޼ҵ� ���� >>>>>>>>>>>>>>>>");

		return qnaBoardIdListLogic;
	}

	// QnA �Խñ� INSERT Logic
	public int qnaBoardInsertLogic(Map<String, Object> pMap) throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardInsertLogic �޼ҵ� ����");

		int result = 0;

		result = qnaDao.getQnAInsert(pMap);
		logger.info("qnaBoardInsertLogic Logic INSERT ��� : " + result);
		logger.info("<QnALogic> qnaBoardInsertLogic �޼ҵ� ���� >>>>>>>>>>>>>>>>");

		return result;
	}

	// QnA �Խñ� DELETE Logic
	public int qDelete(Map<String, Object> pMap) {
		logger.info("<QnALogic> qnaBoardDeleteLogic �޼ҵ� ����");

		int result = 0;

		result = qnaDao.getQnADelete(pMap);
		logger.info("qnaBoardDeleteLogic Logic DELETE ��� : " + result);
		logger.info("<QnALogic> qnaBoardDeleteLogic �޼ҵ� ���� >>>>>>>>>>>>>>>>");

		return result;
	}

	// QnA �Խñ� UPDATE Logic
	public int qnaBoardUpdateLogic(Map<String, Object> pMap) throws ServletException, IOException {

		logger.info("<QnALogic> qnaBoardUpdateLogic �޼ҵ� ����");

		int result = 0;

		result = qnaDao.getQnAUpdate(pMap);
		logger.info("qnaBoardUpdateLogic Logic ��� UPDATE : " + result);
		logger.info("<QnALogic> qnaBoardUpdateLogic �޼ҵ� ���� >>>>>>>>>>>>>>>>");

		return result;
	}
}
