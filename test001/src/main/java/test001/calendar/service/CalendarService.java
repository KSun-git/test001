package test001.calendar.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {
	
	int selectCalendarSeq(Map<String, Object> params) throws Exception;
	
	int insertCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception;
	
	int insertCalendarEventAll(List<TboCalendarVO> claendarVoList) throws Exception;
	
	int updateCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception;
	
	Map<String, Object> selectCalendarEvent(Map<String, Object> params) throws Exception;
	
	List<Map<String, Object>> selectCalendarEventAll(Map<String, Object> params) throws Exception;
	
	int deleteCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception;
	
}
