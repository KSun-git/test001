package test001.calendar.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test001.calendar.service.CalendarService;
import test001.calendar.service.TboCalendarVO;

@RequestMapping("/test001")
@Controller
public class CalendarController {
	
	@Resource(name="calendarService")
	CalendarService calendarService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CalendarController.class);
	
	/**
	 * SEQ_CALENDAR 조회
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/calendar/selectCalendarSeq.do")
	public Map<String, Object> selectCalendarSeq(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			LOGGER.info("SEQ_CALENDAR 조회");
			int seqNo = calendarService.selectCalendarSeq(params);
			resultMap.put("seqNo", seqNo);
			resultMap.put("code", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", "fail");
		}
		return resultMap;
	}
	
	/**
	 * 캘린더 이벤트 단건 조회
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/calendar/selectCalendarEvent.do")
	public Map<String, Object> selectCalendarEvent(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			LOGGER.info("캘린더 이벤트 단건 조회");
			resultMap.put("data", calendarService.selectCalendarEvent(params));
			resultMap.put("code", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", "fail");
		}
		return resultMap;
	}
	
	/**
	 * 캘린더 이벤트 조회
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/calendar/selectCalendarEventAll.do")
	public Map<String, Object> selectCalendarEventAll(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			LOGGER.info("캘린더 이벤트 조회");
			resultMap.put("data", calendarService.selectCalendarEventAll(params));
			resultMap.put("code", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", "fail");
		}
		return resultMap;
	}
	
	/**
	 * 캘린더 이벤트 저장
	 * @param tboCalendarVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/calendar/insertCalendarEvent.do")
	public Map<String, Object> insertCalendarEvent(@ModelAttribute("tboCalendarVO")TboCalendarVO tboCalendarVO, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			LOGGER.info("캘린더 이벤트 저장");
			if(calendarService.insertCalendarEvent(tboCalendarVO) > 0) {
				resultMap.put("code", "success");
			} else {
				resultMap.put("code", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", "fail");
		}
		return resultMap;
	}
	
	
	/**
	 * 캘린더 이벤트 모두 저장
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/calendar/insertCalendarEventAll.do")
	public Map<String, Object> insertCalendarEventAll(@ModelAttribute("tboCalendarVO")TboCalendarVO tboCalendarVO, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			LOGGER.info("캘린더 이벤트 모두 저장");
			if(calendarService.insertCalendarEventAll(tboCalendarVO.getClaendarVoList()) > 0) {
				resultMap.put("code", "success");
			} else {
				resultMap.put("code", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", "fail");
		}
		return resultMap;
	}
	
	/**
	 * 캘린더 이벤트 수정
	 * @param tboCalendarVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/calendar/updateCalendarEvent.do")
	public Map<String, Object> updateCalendarEvent(@ModelAttribute("tboCalendarVO")TboCalendarVO tboCalendarVO, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			LOGGER.info("캘린더 이벤트 수정");
			if(calendarService.updateCalendarEvent(tboCalendarVO) > 0) {
				resultMap.put("code", "success");
			} else {
				resultMap.put("code", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", "fail");
		}
		return resultMap;
	}
	
	/**
	 * 캘린더 이벤트 삭제
	 * @param tboCalendarVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/calendar/deleteCalendarEvent.do")
	public Map<String, Object> deleteCalendarEvent(@ModelAttribute("tboCalendarVO")TboCalendarVO tboCalendarVO, ModelMap model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			LOGGER.info("캘린더 이벤트 삭제");
			if(calendarService.deleteCalendarEvent(tboCalendarVO) > 0) {
				resultMap.put("code", "success");
			} else {
				resultMap.put("code", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", "fail");
		}
		return resultMap;
	}
}