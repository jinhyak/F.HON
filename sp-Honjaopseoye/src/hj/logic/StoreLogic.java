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
		try {
			list = storeDao.searchStore8(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0;i<list.size();i++) {
			if("2100".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "한식";
			}
			else if("2101".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "중식";
			}
			else if("2102".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "일식";
			}
			else if("2103".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "양식";
			}
			else if("2104".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "분식";
			}
			else if("2105".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			else if("2200".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "포차";
			}
			else if("2201".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "호프";
			}
			else if("2202".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "바";
			}
			else if("2203".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "선술집";
			}
			else if("2204".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "이자카야";
			}
			else if("2205".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			else if("2300".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "카페";
			}
			else if("2301".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "노래방";
			}
			else if("2302".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "PC방";
			}
			else if("2303".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "보드게임";
			}
			else if("2304".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "당구장";
			}
			else if("2305".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "만화방";
			}
			else if("2306".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "볼링장";
			}
			else if("2307".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "스크린야구";
			}
			else if("2308".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			list.get(i).put("STORE_BUSINESS", store_business);
			
		}////end of for
		//주소 잘라서 다른 키값으로 넣어줌
		String little_addrs[] = null;
		String little_addr = null;
		String addr = null;
		for(int i=0;i<list.size();i++) {
			addr = list.get(i).get("STORE_ADDR").toString();
			little_addrs = addr.split("\\s");
			little_addr = little_addrs[0]+" "+little_addrs[1]+" "+little_addrs[2];
			list.get(i).put("STORE_LITTLEADDR",little_addr);
			logger.info(list.get(i).get("STORE_LITTLEADDR"));
		}
		return list;
	}
	
	
	public List<Map<String,Object>> searchStoreAll(Map<String,Object> pMap) throws IOException {
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
		try {
			list = storeDao.searchStoreAll(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(int i=0;i<list.size();i++) {
			if("2100".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "한식";
			}
			else if("2101".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "중식";
			}
			else if("2102".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "일식";
			}
			else if("2103".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "양식";
			}
			else if("2104".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "분식";
			}
			else if("2105".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			else if("2200".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "포차";
			}
			else if("2201".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "호프";
			}
			else if("2202".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "바";
			}
			else if("2203".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "선술집";
			}
			else if("2204".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "이자카야";
			}
			else if("2205".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			else if("2300".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "카페";
			}
			else if("2301".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "노래방";
			}
			else if("2302".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "PC방";
			}
			else if("2303".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "보드게임";
			}
			else if("2304".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "당구장";
			}
			else if("2305".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "만화방";
			}
			else if("2306".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "볼링장";
			}
			else if("2307".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "스크린야구";
			}
			else if("2308".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			list.get(i).put("STORE_BUSINESS", store_business);
			
		}////end of for
		//주소 잘라서 다른 키값으로 넣어줌
		String little_addrs[] = null;
		String little_addr = null;
		String addr = null;
		for(int i=0;i<list.size();i++) {
			addr = list.get(i).get("STORE_ADDR").toString();
			little_addrs = addr.split("\\s");
			little_addr = little_addrs[0]+" "+little_addrs[1]+" "+little_addrs[2];
			list.get(i).put("STORE_LITTLEADDR",little_addr);
			logger.info(list.get(i).get("STORE_LITTLEADDR"));
		}

		
		return list;
	}
	public List<Map<String,Object>> storeDetail(String store_no) throws IOException{
		List<Map<String,Object>> list = null;
		String store_business = null;
		try {
			list = storeDao.storeDetail(store_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(int i=0;i<list.size();i++) {
			if("2100".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "한식";
			}
			else if("2101".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "중식";
			}
			else if("2102".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "일식";
			}
			else if("2103".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "양식";
			}
			else if("2104".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "분식";
			}
			else if("2105".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			else if("2200".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "포차";
			}
			else if("2201".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "호프";
			}
			else if("2202".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "바";
			}
			else if("2203".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "선술집";
			}
			else if("2204".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "이자카야";
			}
			else if("2205".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			else if("2300".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "카페";
			}
			else if("2301".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "노래방";
			}
			else if("2302".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "PC방";
			}
			else if("2303".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "보드게임";
			}
			else if("2304".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "당구장";
			}
			else if("2305".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "만화방";
			}
			else if("2306".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "볼링장";
			}
			else if("2307".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "스크린야구";
			}
			else if("2308".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "기타";
			}
			list.get(i).put("STORE_BUSINESS", store_business);
			
		}////end of for
		
		return list;
	}
}
	