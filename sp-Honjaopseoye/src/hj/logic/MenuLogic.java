package hj.logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import hj.dao.MenuDao;

@Service
public class MenuLogic {
	Logger logger = Logger.getLogger(MenuLogic.class);

	@Autowired
	private MenuDao menuDao = null;

	public List<Map<String, Object>> qSelect(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("qSelect ����");
		List<Map<String, Object>> list = null;
		list = menuDao.qSelect(pMap);
		return list;
	}
	//������ȣ�� ����, ������ȣ�� ���� ��ȸ
	public List<Map<String, Object>> PN_select(String NOTI_NO) {
		logger.info("Logic : You Succeed in calling next_select!!");
		List<Map<String, Object>> PN_select = null;
		PN_select = menuDao.PN_select(NOTI_NO);
		return PN_select;
	}
	//�������� ����Ʈ ��ȸ
	public List<Map<String, Object>> nSelect() {
		logger.info("Logic : You Succeed in calling nSelect!!");
		List<Map<String, Object>> getNselect = new ArrayList<Map<String, Object>>();
		getNselect = menuDao.nSelect();
		return getNselect;
	}
	// �󼼺��� ��ȸ
	public List<Map<String, Object>> nView(String NOTI_NO) {
		logger.info("Logic : You Succeed in calling nView!!");
		List<Map<String, Object>> notiList = new ArrayList<Map<String, Object>>();
		int hitUp = 0;
		hitUp = menuDao.hitUpdate(NOTI_NO);
		notiList = menuDao.nView(NOTI_NO);
		return notiList;
	}
	/*1. �Խñ� ����� ������ ���(qna_no�� �������� �߰�)
	 *2. �Խñ��� ��۴ޱ⸦ ������ ���(qView���� ����) 
	a. depth - if(��۴ޱ⸦ �������� �����ִ� depth���� 1�� �߰��ǰ�)
	 	- else{ �����϶� �׳� 0��}
	b. step �� ��������� ���� ��������. 
		1. �߰� �ɶ� ��� ��ġ�ϴ��� �Ǵ��ؾ���.
		2. �߰� �� ��ġ �ٷ� ������ step+1�� ���� �ο�
		3. �߰��� �ۺ��� �Ʒ��� ��ġ�ϴ� �۵��� ��� step�� 1�� �߰���.
	c. group - if(ù���̸� �׷��ȣ�� ���� �׷��ȣ���� ���� ū ��ȣ�� +1�ȴ�.)
		- else if( ù���� �ƴҰ��(����� ���)�� �׷��ȣ�� �״�� �ο��޴´�.*/
	@Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor={DataAccessException.class})
	@Pointcut(value="execution(* hj.logic.*Logic.*(..)")
	public int txqInsert(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		logger.info("���ǰԽñ� ����");
		int result = 0;
		int depth = 0;
		int group = 0;
		int step = 0;
		String keyword = null;
		//����� ��� �������� depth,group,step���� �޾ƿ´�.
		keyword = pMap.get("keyword").toString();
		//stepĿ�� ������ ���� ���� Ʈ����� ó��
		try {
		//������ ��쿣 �۾��� ��ư -> keyword="new" 
		if("����".equals(keyword)){
			logger.info("���۷���");
			step = menuDao.getStep();
			group = menuDao.getGroup();// �ִ� �׷찪�� ä���ϴ� ������
			pMap.put("qna_group",group);//�ִ� �׷찪 �Է�
			pMap.put("qna_depth",0);//���̴� 0
			pMap.put("qna_step",step);// �ִ� ���ܰ� �Է�
			logger.info("������ �� pMap��: "+pMap);
		}
		//����� ��쿣 �۾��� ��ư -> keyword="reply"
		else if("���".equals(keyword)){
			logger.info("��۷���");
			depth = Integer.parseInt(pMap.get("qna_depth").toString())+1;//��� ���� +1�߰�
			//pMap.put("qna_step",Integer.parseInt(pMap.get("qna_step").toString())+1);//���� �Է�
			//���� �۵� step1�� �߰� (where qna_step>=#{qna_step}}
			logger.info("step"+pMap.get("qna_step").toString()+"depth"+pMap.get("qna_depth").toString());
			step = Integer.parseInt(pMap.get("qna_step").toString());
			menuDao.stepUp(step);
			step = step+1;
		}
			//�� ���
			pMap.put("qna_depth", depth);
			pMap.put("qna_step", step);
			result = menuDao.qInsert(pMap);
		} catch (DataAccessException de) {
			throw de;//�� �ڵ尡 �ݵ�� �־�� ��. �ֳ��ϸ� Exception�߻��� �����ؾ� �ϴϱ�
		}
		return result;
	}


}
