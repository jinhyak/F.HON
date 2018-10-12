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
		//문자열 치환 코드
		String searchWord = (String)pMap.get("searchWord");
		searchWord = searchWord.replace(" ","|");
		pMap.put("searchWord",searchWord);
		//구분+분류 해서 프로토콜로 만들어줌
		String store_business = 
				(String)pMap.get("gubun")+(String)pMap.get("store_business");
		pMap.remove("gubun");//구분은 삭제해주고
		pMap.put("store_business", store_business);
		logger.info(pMap);
		list = storeDao.searchStore8(pMap);

		return list;
	}
}
	