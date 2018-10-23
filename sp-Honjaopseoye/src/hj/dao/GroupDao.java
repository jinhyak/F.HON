package hj.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class GroupDao {
	Logger logger = Logger.getLogger(BoardDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//지도 옆에 목록에 뿌려질 그룹방 전체목록 list
		public List<Map<String, Object>> listSelect() {
			logger.info("listSelect");
			List<Map<String, Object>> bangList = null;
			bangList = sqlSessionTemplate.selectList("groupMapper.listSelect");
			logger.info("bangList:"+bangList);
			return bangList;
		}
		//검색조건에 따른 리스트 조회
		public List<Map<String, Object>> searchSelect(String value) {
			logger.info("searchSelect");
			List<Map<String, Object>> searchList = null;
			searchList = sqlSessionTemplate.selectList("groupMapper.searchSelect", value);
			logger.info("searchList:"+searchList);
			return searchList;
		}
		//지도 위 분류 필터에 따른 검색 - 다중체크시 모든 keyword 값을 받음 프로코콜값
		public List<Map<String, Object>> filterSelect(Map<String, Object> pMap) {
			logger.info("filterSelect");
			List<Map<String, Object>> filterList = null;
			logger.info(pMap);
			filterList = sqlSessionTemplate.selectList("groupMapper.filterSelect", pMap);
			logger.info("filterList:"+filterList);
			return filterList;
		}
		//지도 옆 목록에서 방 선택시 방의정보 store_no, bang_no 받음
		public List<Map<String, Object>> groupSelect(Map<String, Object> pMap) {
			logger.info("groupSelect");
			List<Map<String, Object>> groupInfoList = null;
			groupInfoList = sqlSessionTemplate.selectList("groupMapper.groupSelect", pMap);
			logger.info("groupInfoList:"+groupInfoList);
			return groupInfoList;
		}
		//방 선택후 친구목록보기 버튼 클릭시 보여줄 그 방 bang_no의 친구내용
		public List<Map<String, Object>> friendSelect(String bang_no) {
			logger.info("friendSelect");
			List<Map<String, Object>> friendList = null;
			friendList = sqlSessionTemplate.selectList("groupMapper.friendSelect", bang_no);
			logger.info("friendList:"+friendList);
			return friendList;
		}
		//모임방 개설생성 버튼 누를시 input에 박은값들 다 받음
		public int groupInsert(Map<String, Object> pMap) {
			logger.info("groupInsert");
			int result = 0;
			result = sqlSessionTemplate.insert("groupMapper.groupInsert", pMap);
			logger.info("result: " + result);
			return result;
		}
		//방등록시 주소등록 누를시 가게 주소정보 검색어 keyword 받음
		public List<Map<String, Object>> storeSelect(Map<String,Object> pMap) {
			logger.info("storeSelect");
			List<Map<String, Object>> storeList = null;
			storeList = sqlSessionTemplate.selectList("groupMapper.storeSelect", pMap);
			logger.info("storeList:"+storeList);
			return storeList;
		}
		//모임 참석버튼 누를시 info에 인서트 bang_no, mem_id, mem_memo받음
		public int groupAttend(Map<String, Object> pMap) {
			logger.info("groupAttend");
			sqlSessionTemplate.selectOne("groupMapper.groupAttend", pMap);
			int result = 0;		
			result = (int)pMap.get("result");		
			logger.info("result : "+result);
			return result;
		}
		//모임 취소버튼 누를시 info에 델리트 mem_id받음
		public int groupAbsent(Map<String, Object> pMap) {
			logger.info("groupAbsent");
			int result = 0;
			result = sqlSessionTemplate.delete("groupMapper.groupAbsent", pMap);
			logger.info("result : " + result);
			return result;
		}
		//모임방 삭제버튼(방장만) bang_no 받음
		public int groupDelete(Map<String, Object> pMap) {
			logger.info("groupDelete");
			sqlSessionTemplate.selectOne("groupMapper.groupDelete", pMap);
			int result = 0;
			result = (int)pMap.get("result");
			logger.info("result : " + result);
			return result;
		}
		//모임방 수정(��장) 가게수정은 불가 방폭파후 다시생성 input값들 다 받아옴
		public int groupUpdate(Map<String, Object> pMap) {
			logger.info("groupUpdate");
			int result = 0;
			result = sqlSessionTemplate.update("groupMapper.groupUpdate", pMap);
			logger.info("result: " + result);
			return result;
		}
}
