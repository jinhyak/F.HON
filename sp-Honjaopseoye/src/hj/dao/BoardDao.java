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
	
			// <ȥ��> ��� �Խñ� ��� ��ȸ (SELECT)
			public List<Map<String, Object>> getBabBoardList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardList method ����");
				logger.info("<Category> <<<<< ȥ�� >>>>> ");
				List<Map<String, Object>> getBabBoardList = null;
				
				getBabBoardList = sqlSessionTemplate.selectList("getBabBoardList", pMap);
				logger.info("<Dao> ---> getBabBoardList ��ü ��ȸ ������: " + getBabBoardList.size());
				
				return getBabBoardList;
			}
			
			
			
			// <ȥ��> ��� �Խñ� ��� ��ȸ (SELECT)
			public List<Map<String, Object>> getSulBoardList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getSulBoardList method ����");
				logger.info("<Category> <<<<< ȥ�� >>>>> ");
				List<Map<String, Object>> getSulBoardList = null;
				
				getSulBoardList = sqlSessionTemplate.selectList("getSulBoardList", pMap);
				logger.info("<Dao> ---> getSulBoardList ��ü ��ȸ ������: " + getSulBoardList.size());
				
				return getSulBoardList;
			}
			
			
			
			// <ȥ��> ��� �Խñ� ��� ��ȸ (SELECT)
			public List<Map<String, Object>> getNolBoardList(Map<String, Object> pMap){
						
				logger.info("<Dao> ---> getNolBoardList method ����");
				logger.info("<Category> <<<<< ȥ�� >>>>> ");
				List<Map<String, Object>> getNolBoardList = null;
						
				getNolBoardList = sqlSessionTemplate.selectList("getNolBoardList", pMap);
				logger.info("<Dao> ---> getSulBoardList ��ü ��ȸ ������: " + getNolBoardList.size());
						
				return getNolBoardList;
			}
			
			
			
			// <ȥ��> ���� �Խñ� ��� ���� ��ȸ (SELECT) - WHERE
			public List<Map<String, Object>> getBabBoardOneList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardOneList method ����");
				List<Map<String, Object>> getBabBoardOneList = null;
								
				getBabBoardOneList = sqlSessionTemplate.selectList("getBabBoardOneList", pMap);
				logger.info("<Dao> ---> getBabBoardOneList ��ü ��ȸ ������: " + getBabBoardOneList.size());
								
				return getBabBoardOneList;
			}
			
			
			
			// <ȥ��> ���� �Խñ� ��� ���� ��ȸ (SELECT) - WHERE
			public List<Map<String, Object>> getSulBoardOneList(Map<String, Object> pMap){
					
				logger.info("<Dao> ---> getSulBoardOneList method ����");
				List<Map<String, Object>> getSulBoardOneList = null;
									
				getSulBoardOneList = sqlSessionTemplate.selectList("getSulBoardOneList", pMap);
				logger.info("<Dao> ---> getSulBoardOneList ��ü ��ȸ ������: " + getSulBoardOneList.size());
									
				return getSulBoardOneList;
			}
			
			
				
			// <ȥ��> ���� �Խñ� ��� ���� ��ȸ (SELECT) - WHERE
			public List<Map<String, Object>> getNolBoardOneList(Map<String, Object> pMap){
					
				logger.info("<Dao> ---> getNolBoardOneList method ����");
				List<Map<String, Object>> getNolBoardOneList = null;
									
				getNolBoardOneList = sqlSessionTemplate.selectList("getNolBoardOneList", pMap);
				logger.info("<Dao> ---> getNolBoardOneList ��ü ��ȸ ������: " + getNolBoardOneList.size());
									
				return getNolBoardOneList;
			}
			
			
			
			// <ȥ��> ��� ��ȸ
			public List<Map<String, Object>> getBabBoardCommentList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardCommentList method ����");
				List<Map<String, Object>> getBabBoardCommentList = null;
				
				getBabBoardCommentList = sqlSessionTemplate.selectList("getBabBoardCommentList", pMap);
				logger.info("<Dao> ---> getBabBoardCommentList ��ü ��ȸ ������: " + getBabBoardCommentList.size());
				
				return getBabBoardCommentList;
			}
			
			
			
			// <ȥ��> ��� ��ȸ
			public List<Map<String, Object>> getSulBoardCommentList(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getSulBoardCommentList method ����");
				List<Map<String, Object>> getSulBoardCommentList = null;
				
				getSulBoardCommentList = sqlSessionTemplate.selectList("getSulBoardCommentList", pMap);
				logger.info("<Dao> ---> getSulBoardCommentList ��ü ��ȸ ������: " + getSulBoardCommentList.size());
				
				return getSulBoardCommentList;
			}
			
			
			
			
			// <ȥ��> ��� ��ȸ
			public List<Map<String, Object>> getNolBoardCommentList(Map<String, Object> pMap){
		
				logger.info("<Dao> ---> getNolBoardCommentList method ����");
				List<Map<String, Object>> getNolBoardCommentList = null;
		
				getNolBoardCommentList = sqlSessionTemplate.selectList("getNolBoardCommentList", pMap);
				logger.info("<Dao> ---> getNolBoardCommentList ��ü ��ȸ ������: " + getNolBoardCommentList.size());
		
				return getNolBoardCommentList;
			}
			
			
			
			
			// �Խ��� ȥ�� �Է�
			public int getBabBoardInsert(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardInsert method ����");
				int result = 0;
				result = sqlSessionTemplate.insert("getBabBoardInsert", pMap);
				logger.info("<Dao> ---> getBabBoardInsert �Է� ����: " + result);
				return result;
			}
			
			
			
		    // �Խ��� ȥ�� �Է�
			public int getSulBoardInsert(Map<String, Object> pMap) {
							
				logger.info("<Dao> ---> getSulBoardInsert method ����");
				int result = 0;
				result = sqlSessionTemplate.insert("getSulBoardInsert", pMap);
				logger.info("<Dao> ---> getSulBoardInsert �Է� ����: " + result);
				return result;
			}
			
			
			
			// �Խ��� ȥ�� �Է�
			public int getNolBoardInsert(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getNolBoardInsert method ����");
				int result = 0;
				result = sqlSessionTemplate.insert("getNolBoardInsert", pMap);
				logger.info("<Dao> ---> getNolBoardInsert �Է� ����: " + result);
				return result;
			}
			
			// �Խ��� ȥ�� ����
			public int getBabBoardDelete(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardDelete method ����");
				int result = 0;
				result = sqlSessionTemplate.delete("getBabBoardDelete", pMap);
				logger.info("<Dao> ---> getBabBoardDelete �Է� ����: " + result);
				return result;
				
			}
			
			
			// �Խ��� ȥ�� ����
			public int getSulBoardDelete(Map<String, Object> pMap) {

				logger.info("<Dao> ---> getSulBoardDelete method ����");
				int result = 0;
				result = sqlSessionTemplate.delete("getSulBoardDelete", pMap);
				logger.info("<Dao> ---> getSulBoardDelete �Է� ����: " + result);
				return result;

			}

			// �Խ��� ȥ�� ����
			public int getNolBoardDelete(Map<String, Object> pMap) {

				logger.info("<Dao> ---> getNolBoardDelete method ����");
				int result = 0;
				result = sqlSessionTemplate.delete("getNolBoardDelete", pMap);
				logger.info("<Dao> ---> getNolBoardDelete �Է� ����: " + result);
				return result;

			}
			
			
			
			// ȥ�� �Խ��� ��� �Է�
			public int getBabBoardCommentInsert(Map<String, Object> pMap) {
				
				int result = 0;
				logger.info("<Dao> ---> getBabBoardCommentInsert method ����");
				result = sqlSessionTemplate.insert("getBabBoardCommentInsert", pMap);
				logger.info("<Dao> ---> getBabBoardCommentInsert �Է� ����: " + result);
				
				return result;
			}
			

			// ȥ�� �Խ��� ��� �Է�
			public int getSulBoardCommentInsert(Map<String, Object> pMap) {
				
				int result = 0;
				logger.info("<Dao> ---> getSulBoardCommentInsert method ����");
				result = sqlSessionTemplate.insert("getSulBoardCommentInsert", pMap);
				logger.info("<Dao> ---> getSulBoardCommentInsert �Է� ����: " + result);
				
				return result;
			}
			

			// ȥ�� �Խ��� ��� �Է�
			public int getNolBoardCommentInsert(Map<String, Object> pMap) {
				
				int result = 0;
				logger.info("<Dao> ---> getNolBoardCommentInsert method ����");
				result = sqlSessionTemplate.insert("getNolBoardCommentInsert", pMap);
				logger.info("<Dao> ---> getNolBoardCommentInsert �Է� ����: " + result);
				
				return result;
			}
			
			
			
			// ȥ�� �Խ��� ����
			public int getBabBoardUpdate(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardUpdate method ����");
				int result = 0;
				result = sqlSessionTemplate.update("getBabBoardUpdate", pMap);
				logger.info("<Dao> ---> getBabBoardUpdate �Է� ����: " + result);
				
				return result;
			}
			
			
			
			// ȥ�� �Խ��� ����
			public int getSulBoardUpdate(Map<String, Object> pMap) {
	
				logger.info("<Dao> ---> getSulBoardUpdate method ����");
				int result = 0;
				result = sqlSessionTemplate.update("getSulBoardUpdate", pMap);
				logger.info("<Dao> ---> getSulBoardUpdate �Է� ����: " + result);
	
				return result;
			}
						
						
						
			// ȥ�� �Խ��� ����
			public int getNolBoardUpdate(Map<String, Object> pMap) {
							
				logger.info("<Dao> ---> getNolBoardUpdate method ����");
				int result = 0;
				result = sqlSessionTemplate.update("getNolBoardUpdate", pMap);
				logger.info("<Dao> ---> getNolBoardUpdate �Է� ����: " + result);
							
				return result;
			}

			
			
			// ��ȸ�� ī��Ʈ
			
			// ȥ�� ��ȸ�� ī��Ʈ
			public int getBabBoardHitUpdate(Map<String, Object> pMap) {
				
				logger.info("<Dao> ---> getBabBoardHitUpdate method ����");
				int result = 0;
				
				result = sqlSessionTemplate.update("getBabBoardHitUpdate", pMap);
				logger.info("<Dao> ---> getBabBoardHitUpdate �Է� ����: " + result);
				return result;
				
			}
			
			// ȥ�� ��ȸ�� ī��Ʈ
			public int getSulBoardHitUpdate(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getSulBoardHitUpdate method ����");
				int result = 0;
		
				result = sqlSessionTemplate.update("getSulBoardHitUpdate", pMap);
				logger.info("<Dao> ---> getSulBoardHitUpdate �Է� ����: " + result);
				return result;
		
			}
		
			// ȥ�� ��ȸ�� ī��Ʈ
			public int getNolBoardHitUpdate(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getNolBoardHitUpdate method ����");
				int result = 0;
		
				result = sqlSessionTemplate.update("getNolBoardHitUpdate", pMap);
				logger.info("<Dao> ---> getNolBoardHitUpdate �Է� ����: " + result);
				return result;
		
			}
			
			// �ְ� ��ȸ��
			
			// ȥ��
			public List<Map<String, Object>> getBabBoardHitMax(Map<String, Object> pMap){
				
				logger.info("<Dao> ---> getBabBoardHitMax method ����");
				List<Map<String, Object>> getBabBoardHitMax = null;
				getBabBoardHitMax = sqlSessionTemplate.selectList("getBabBoardHitMax", pMap);
				logger.info("<Dao> ---> getBabBoardList ��ü ��ȸ ������: " + getBabBoardHitMax.size());
				
				return getBabBoardHitMax;
			}
			
			
			// ȥ��
			public List<Map<String, Object>> getSulBoardHitMax(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getSulBoardHitMax method ����");
				List<Map<String, Object>> getSulBoardHitMax = null;
				getSulBoardHitMax = sqlSessionTemplate.selectList("getSulBoardHitMax", pMap);
				logger.info("<Dao> ---> getSulBoardHitMax ��ü ��ȸ ������: " + getSulBoardHitMax.size());
		
				return getSulBoardHitMax;
			}
					
			
			
			// ȥ�� 
			public List<Map<String, Object>> getNolBoardHitMax(Map<String, Object> pMap) {
		
				logger.info("<Dao> ---> getNolBoardHitMax method ����");
				List<Map<String, Object>> getNolBoardHitMax = null;
				getNolBoardHitMax = sqlSessionTemplate.selectList("getNolBoardHitMax", pMap);
				logger.info("<Dao> ---> getNolBoardHitMax ��ü ��ȸ ������: " + getNolBoardHitMax.size());
		
				return getNolBoardHitMax;
			}
			
			// ��� ī��Ʈ
			

}
