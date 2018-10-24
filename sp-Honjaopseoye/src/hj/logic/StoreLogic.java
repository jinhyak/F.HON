package hj.logic;



import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.StoreDao;
import hj.util.PageBar;
@Service
public class StoreLogic {
	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private StoreDao storeDao = null;
	
	PageBar pageBar = null;

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
		try {
			list = storeDao.searchStore8(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0;i<list.size();i++) {
			if("2100".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�ѽ�";
			}
			else if("2101".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�߽�";
			}
			else if("2102".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�Ͻ�";
			}
			else if("2103".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "���";
			}
			else if("2104".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�н�";
			}
			else if("2105".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2200".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����";
			}
			else if("2201".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ȣ��";
			}
			else if("2202".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��";
			}
			else if("2203".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2204".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����ī��";
			}
			else if("2205".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2300".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ī��";
			}
			else if("2301".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�뷡��";
			}
			else if("2302".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "PC��";
			}
			else if("2303".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�������";
			}
			else if("2304".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�籸��";
			}
			else if("2305".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ȭ��";
			}
			else if("2306".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2307".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ũ���߱�";
			}
			else if("2308".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			list.get(i).put("STORE_BUSINESS", store_business);
			
		}////end of for
		//�ּ� �߶� �ٸ� Ű������ �־���
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
		String store_business = null;
		//���ڿ� ġȯ �ڵ�
		String searchWord = (String)pMap.get("searchWord");
		searchWord = searchWord.replace(" ","|");
		pMap.put("searchWord",searchWord);
		if(pMap.get("store_business")!=null&& !"null".equals(pMap.get("store_business"))) {
			//����+�з� �ؼ� �������ݷ� �������
			 store_business = 
					(String)pMap.get("gubun")+(String)pMap.get("store_business");
			pMap.remove("gubun");//������ �������ְ�
			pMap.put("store_business", store_business);
		}
		else {
			pMap.put("store_business", pMap.get("gubun"));
			pMap.remove("gubun");
			pMap.remove("store_price");
		}
		logger.info(pMap.get("store_business"));
		try {
			list = storeDao.searchStoreAll(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(int i=0;i<list.size();i++) {
			if("2100".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�ѽ�";
			}
			else if("2101".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�߽�";
			}
			else if("2102".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�Ͻ�";
			}
			else if("2103".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "���";
			}
			else if("2104".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�н�";
			}
			else if("2105".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2200".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����";
			}
			else if("2201".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ȣ��";
			}
			else if("2202".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��";
			}
			else if("2203".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2204".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����ī��";
			}
			else if("2205".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2300".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ī��";
			}
			else if("2301".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�뷡��";
			}
			else if("2302".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "PC��";
			}
			else if("2303".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�������";
			}
			else if("2304".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�籸��";
			}
			else if("2305".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ȭ��";
			}
			else if("2306".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2307".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ũ���߱�";
			}
			else if("2308".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			list.get(i).put("STORE_BUSINESS", store_business);
			
		}////end of for
		//�ּ� �߶� �ٸ� Ű������ �־���
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
	//����������
	public List<Map<String,Object>> searchStoreAllStar(Map<String,Object> pMap) throws IOException {
		List<Map<String,Object>> list = null;
		String store_business = null;
		//���ڿ� ġȯ �ڵ�
		String searchWord = (String)pMap.get("searchWord");
		searchWord = searchWord.replace(" ","|");
		pMap.put("searchWord",searchWord);
		if(pMap.get("store_business")!=null&& !"null".equals(pMap.get("store_business"))) {
			//����+�з� �ؼ� �������ݷ� �������
			store_business = 
					(String)pMap.get("gubun")+(String)pMap.get("store_business");
			pMap.remove("gubun");//������ �������ְ�
			pMap.put("store_business", store_business);
		}
		else {
			pMap.put("store_business", pMap.get("gubun"));
			pMap.remove("gubun");
			pMap.remove("store_price");
		}
		logger.info(pMap.get("store_business"));
		try {
			list = storeDao.searchStoreAllStar(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(int i=0;i<list.size();i++) {
			if("2100".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�ѽ�";
			}
			else if("2101".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�߽�";
			}
			else if("2102".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�Ͻ�";
			}
			else if("2103".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "���";
			}
			else if("2104".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�н�";
			}
			else if("2105".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2200".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����";
			}
			else if("2201".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ȣ��";
			}
			else if("2202".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��";
			}
			else if("2203".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2204".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����ī��";
			}
			else if("2205".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2300".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ī��";
			}
			else if("2301".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�뷡��";
			}
			else if("2302".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "PC��";
			}
			else if("2303".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�������";
			}
			else if("2304".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�籸��";
			}
			else if("2305".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ȭ��";
			}
			else if("2306".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2307".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ũ���߱�";
			}
			else if("2308".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			list.get(i).put("STORE_BUSINESS", store_business);
			
		}////end of for
		//�ּ� �߶� �ٸ� Ű������ �־���
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
				store_business = "�ѽ�";
			}
			else if("2101".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�߽�";
			}
			else if("2102".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�Ͻ�";
			}
			else if("2103".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "���";
			}
			else if("2104".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�н�";
			}
			else if("2105".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2200".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����";
			}
			else if("2201".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ȣ��";
			}
			else if("2202".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��";
			}
			else if("2203".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2204".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "����ī��";
			}
			else if("2205".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			else if("2300".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "ī��";
			}
			else if("2301".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�뷡��";
			}
			else if("2302".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "PC��";
			}
			else if("2303".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�������";
			}
			else if("2304".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "�籸��";
			}
			else if("2305".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ȭ��";
			}
			else if("2306".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "������";
			}
			else if("2307".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��ũ���߱�";
			}
			else if("2308".equals(list.get(i).get("STORE_BUSINESS").toString())) {
				store_business = "��Ÿ";
			}
			list.get(i).put("STORE_BUSINESS", store_business);
			
		}////end of for
		
		return list;
	}
	
}
	