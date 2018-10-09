package hj.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hj.dao.MessageDao;
import hj.dao.StoreDao;

@Controller
@RequestMapping("/store")
public class StoreController{
	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private StoreDao storeDao = null;

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
	@ResponseBody
	@RequestMapping("/storeImg.hon")
	public String imgUpload(MultipartHttpServletRequest multi) {
		logger.info("storeImg호출성공");
		//저장경로 설정
		String path = "C:\\Users\\516\\git\\F.HON\\sp-Honjaopseoye\\WebContent\\store\\storeImg";
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

}
