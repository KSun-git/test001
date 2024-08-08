package test001.common.web;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test001.common.service.IndexService;

@Controller
public class IndexController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);
	
	@Resource(name="indexService")
	IndexService indexService;
	
	@RequestMapping("/test001/index.do")
	public String indexPage(ModelMap model) throws Exception {
		String sysdate = indexService.selectSysdate();
		LOGGER.info("index.do" + sysdate);
		model.put("sysdate", sysdate);
		return "test001/main.layout1"; 
	}
	
	@RequestMapping("/test001/layoutModal.do")
	public String layoutModal(@RequestParam(required = true) String targetId
							,ModelMap model) throws Exception {
		
		model.put("targetId", targetId);
		return "common/include/layoutModal";
	}
	
	@RequestMapping("/test001/sampleModal.do")
	public String sampleModalVwM(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		model.put("params", params);
		return "test001/sampleModal";
	}
	
}
