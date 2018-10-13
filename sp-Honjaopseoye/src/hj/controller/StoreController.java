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

/*���������� �̵� �׽�Ʈ*/
	@RequestMapping("/empty.hon")
	public String empty(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		List<Map<String,Object>> emptyList = null;
		logger.info("empty�޼ҵ� ȣ��");
		//tLogic.test(pMap);
		/*try {
			mDao.check(pMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return "redirect:main.jsp";
	}
	//���Ե��
	@ResponseBody
	@RequestMapping("/storeAdd.hon")
	public String insert(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap" + pMap);
		int result = 0;
		try {
			result = storeDao.storeAdd(pMap);
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("@@@@@@@@@@@@    Dao ����    @@@@@@@@@@@@@@@");
		}
		return String.valueOf(result);
	}
	//�̹������
	@ResponseBody
	@RequestMapping(value= {"/storeImg.hon"},produces="text/html; charset=UTF-8")//���ϰ����� string���µ� �ѱ��� ������ �������
	public String imgUpload(MultipartHttpServletRequest multi) {
		logger.info("storeImgȣ�⼺��");
		//������ ����
		String path = "C:\\Users\\516\\git\\F.HON\\sp-Honjaopseoye\\WebContent\\store\\storeImg";
		//���� ���� ��� Ȯ��, ������ ����
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		//���� �̸� ����
		UUID uuid = UUID.randomUUID();
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();
			logger.info(uploadFile);
			
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			logger.info(fileName);
			String saveName = uuid+"_"+fileName; //�����ߺ� �������� �̸�����
			logger.info("saveName:"+saveName);
			File saveFile = new File(path,saveName);
		
			try {
				mFile.transferTo(saveFile);
			} catch (IOException e) {
				e.printStackTrace();
				}
			return saveName; //@ResponseBody�Ἥ ���ϰ��� ��ΰ� �ƴ϶� string������ �����°� ������
		}//end of while
		
				
		
		return null;
	}
	//���� �˻�	
	@RequestMapping(value= {"/storeSearch.hon"},produces="text/html; charset=UTF-8")
	public String storeSearch(Model mod, @RequestParam Map<String,Object> pMap, HttpServletResponse res) {
		logger.info("pMap="+pMap);
		List<Map<String,Object>> list = null;
		try {
			list = storeLogic.searchStore8(pMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("list"+list);
		mod.addAttribute("list",list);//���� �º���� ���ϰ� �ٷ� ��ν���
		return "forward:/main/honja/hotplace/hotplace_result.jsp";
	}
	//���� ���� �󼼺���
	@RequestMapping(value= {"/storeDetail.hon"},produces="text/html; charset=UTF-8")
	public String storeDetail(Model mod,HttpServletRequest req) {
		String store_no = req.getParameter("store_no");
		logger.info(store_no);
		List<Map<String,Object>> list = null;
		try {
			list = storeDao.storeDetail(store_no);
		} catch (Exception e) {
			// TODO: handle exception
		}
		logger.info("list"+list);
		mod.addAttribute("list",list);
		return "forward:/store/storeResult/storeDetail.jsp";
	}


}
