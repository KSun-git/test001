package test001.finance.web;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test001.finance.service.FinanceService;

@RequestMapping("/test001")
@Controller
public class FinanceController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FinanceController.class);
	
	@Resource(name="financeService")
	FinanceService financeService;
	
	@RequestMapping("/finance/f300000Deduction.do")
	public String f300000Deduction(@RequestParam Map<String, Object> params,
												@RequestParam(value="menuId", required = false, defaultValue = "020202") String menuId,
												@RequestParam(value="searchYYYYMM", required = false, defaultValue = "") String searchYYYYMM,
												ModelMap model) throws Exception {
		// 기본 검색대상
		if(searchYYYYMM.equals("")) {
			Date nowDate = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMM");
			String defaultYYYYMM = df.format(nowDate);
			searchYYYYMM = defaultYYYYMM;
		}
		
		// Deduction 리스트 조회
		params.put("gbn", "300000");
		params.put("searchYYYYMM", searchYYYYMM);
		Map<String, Object> deductionMap = financeService.selectDeductionList(params);
		model.addAttribute("deductionList", deductionMap.get("deductionList"));
		model.addAttribute("deductionStat", deductionMap.get("deductionStat"));
		model.addAttribute("deductionAmountMap", deductionMap.get("deductionAmountMap"));
		
		// 시작일, 종료일
		DateTimeFormatter formatter = new DateTimeFormatterBuilder().appendPattern("yyyyMM")
																								.parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
																								.toFormatter();
		LocalDate date = LocalDate.parse(searchYYYYMM, formatter);
		LocalDate firstDate = date.withDayOfMonth(1);
		LocalDate lastDate = date.withDayOfMonth(date.lengthOfMonth());
		model.addAttribute("firstDate", firstDate.format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
		model.addAttribute("lastDate", lastDate.format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));
		
		model.addAttribute("params", params);
		model.addAttribute("menuId", menuId);
		return "test001/finance/f300000Deduction.layout1"; 
	}
	
	@RequestMapping("/finance/popup/selectDeductionMonthVwP.do")
	public String selectDeductionMonthVwP(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		model.addAttribute("params", params);
		return "test001/finance/popup/selectDeductionMonthVwP.pop-layout1"; 
	}
	
	@RequestMapping("/finance/popup/insertDeductionVwP.do")
	public String insertDeductionVwP(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 카테고리 그룹 리스트 조회
		model.addAttribute("cateGroupList", financeService.selectCateGroupList(params));
		
		model.addAttribute("gbn", params.get("gbn"));
		return "test001/finance/popup/insertDeductionVwP.pop-layout1"; 
	}
	
	@ResponseBody
	@RequestMapping("/finance/popup/insertDeduction.do")
	public Map<String, Object> insertDeduction(@RequestParam Map<String, Object> params
																	, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// Deduction 등록
		if(financeService.insertDeduction(params) > 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
}
