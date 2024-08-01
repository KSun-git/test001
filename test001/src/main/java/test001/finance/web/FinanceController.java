package test001.finance.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/test001")
@Controller
public class FinanceController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FinanceController.class);
	
	@RequestMapping("/finance/f300000Deduction.do")
	public String f300000Deduction(@RequestParam Map<String, Object> params,
												@RequestParam(value="menuId", required = false, defaultValue = "020202")String menuId,
												ModelMap model) throws Exception {
		
		model.addAttribute("menuId", menuId);
		return "test001/finance/f300000Deduction.layout1"; 
	}
	
	@RequestMapping("/finance/popup/sample.do")
	public String popupSample(@RequestParam Map<String, Object> params,
												@RequestParam(value="menuId", required = false, defaultValue = "020202")String menuId,
												ModelMap model) throws Exception {
		
		model.addAttribute("menuId", menuId);
		return "test001/finance/popup/popsample.pop-layout1"; 
	}
}
