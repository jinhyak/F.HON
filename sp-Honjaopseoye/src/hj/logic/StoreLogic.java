package hj.logic;



import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.StoreDao;
@Service
public class StoreLogic {
	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private StoreDao storeDao = null;

	public List<Map<String, Object>> searchStore8(Map<String, Object> pMap) throws IOException {
		List<Map<String,Object>> list = null;
		//���ڿ� ġȯ �ڵ�
		String searchWord = (String)pMap.get("searchWord");
		searchWord = searchWord.replace(" ","|");
		pMap.put("searchWord",searchWord);
		//����+�з� �ؼ� �������ݷ� �������
		String store_business = 
				(String)pMap.get("gubun")+(String)pMap.get("store_business");
		pMap.remove("gubun");//������ �������ְ�
		pMap.put("store_business", store_business);
		logger.info(pMap);
		list = storeDao.searchStore8(pMap);
		return list;
	}
	
	
	public List<Map<String,Object>> searchStore(Map<String,Object> pMap) throws IOException {
		List<Map<String,Object>> list = null;
		//���ڿ� ġȯ �ڵ�
		String searchWord = (String)pMap.get("searchWord");
		searchWord = searchWord.replace(" ","|");
		pMap.put("searchWord",searchWord);
		//����+�з� �ؼ� �������ݷ� �������
		String store_business = 
				(String)pMap.get("gubun")+(String)pMap.get("store_business");
		pMap.remove("gubun");//������ �������ְ�
		pMap.put("store_business", store_business);
		logger.info(pMap);
		list = storeDao.searchStore8(pMap);
		
		return list;
	}

}
	