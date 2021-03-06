package hj.controller;

import java.io.File;
import java.io.IOException;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hj.dao.StoreDao;
import hj.logic.StoreLogic;

@Controller
@RequestMapping("/store")
public class StoreController{
	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private StoreDao storeDao = null;
	
	@Autowired
	private StoreLogic storeLogic = null;

/*메인페이지 이동 테스트*/
	@RequestMapping("/empty.hon")
	public String empty(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		List<Map<String,Object>> emptyList = null;
		logger.info("empty메소드 호출");
		//tLogic.test(pMap);
		/*try {
			mDao.check(pMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return "redirect:main.jsp";
	}
	//가게등록
	@ResponseBody
	@RequestMapping("/storeAdd.hon")
	public String insert(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap" + pMap);
		int result = 0;
		try {
			result = storeDao.storeAdd(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("@@@@@@@@@@@@    Dao 오류    @@@@@@@@@@@@@@@");
		}
		return String.valueOf(result);
	}
	//이미지등록
	@ResponseBody
	@RequestMapping(value= {"/storeImg.hon"},produces="text/html; charset=UTF-8")//리턴값으로 string가는데 한글이 깨져서 써줘야함
	public String imgUpload(MultipartHttpServletRequest multi) {
		logger.info("storeImg호출성공");
		//저장경로 설정
		String path = "C:\\Users\\516\\git\\F.HON\\sp-Honjaopseoye\\WebContent\\image\\storeImg";
		//파일 저장 경로 확인, 없으면 만듬
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//파일 이름 변경
		UUID uuid = UUID.randomUUID();
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();
			logger.info(uploadFile);
			
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			logger.info(fileName);
			String saveName = uuid+"_"+fileName; //파일중복 제거위한 이름변경
			logger.info("saveName:"+saveName);
			File saveFile = new File(path,saveName);
		
			try {
				mFile.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
				}
			return saveName; //@ResponseBody써서 리턴값이 경로가 아니라 string값으로 보내는게 가능함
		}//end of while
		
				
		
		return null;
	}
	//핫플 가게 검색	
	@RequestMapping(value= {"/storeSearch8.hon"},produces="text/html; charset=UTF-8")
	public String storeSearch8(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap="+pMap);
		List<Map<String,Object>> list = null;
		try {
			list = storeLogic.searchStore8(pMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("list"+list);
		mod.addAttribute("list",list);//모델은 셋뷰네임 안하고 바로 경로써줌
		return "forward:/main/honja/hotplace/hotplace_result.jsp";
	}
	//가게 전체 검색
	@RequestMapping(value= {"/storeSearchAll.hon"},produces="text/html; charset=UTF-8")
	public String storeSearchAll(Model mod,@RequestParam Map<String,Object> pMap, HttpServletRequest req) {
		
		pMap.put("searchWord", req.getParameter("searchWord"));
		pMap.put("gubun", req.getParameter("gubun"));
		pMap.put("store_business", req.getParameter("store_business"));
		pMap.put("store_price", req.getParameter("store_price"));
		List<Map<String,Object>> list = null;
		try {
			list = storeLogic.searchStoreAll(pMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String searchWord = (String)pMap.get("searchWord");
		mod.addAttribute("searchWord",searchWord);
		logger.info(searchWord);
		mod.addAttribute("list",list);//모델은 셋뷰네임 안하고 바로 경로써줌
		return "forward:/store/storeResult/storeAll.jsp";
	}
	//가게 정보 상세보기
	@RequestMapping(value= {"/storeDetail.hon"},produces="text/html; charset=UTF-8")
	public String storeDetail(Model mod,HttpServletRequest req) {
		String store_no = req.getParameter("store_no");
		logger.info(store_no);
		List<Map<String,Object>> list = null;
		try {
			list = storeLogic.storeDetail(store_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mod.addAttribute("list",list);
		return "forward:/store/storeResult/storeDetail.jsp";
	}
	//가게 별점 주기
	@ResponseBody
	@RequestMapping(value= {"/storeSetScore.hon"},produces="text/html; charset=UTF-8")
	public String storeSetScore(Model mod,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		int result = 0;
		pMap.put("setStore_score",Integer.parseInt((String)req.getParameter("setStore_score")));
		pMap.put("store_no",(String)req.getParameter("store_no"));
		logger.info(pMap);
		try {
			result = storeDao.stoeSetScore(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result==1) {
			return "별점 등록 성공";
		}
		return "별점 등록 실패";
	}

}