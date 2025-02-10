package test001.calendar.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import test001.calendar.service.CalendarService;
import test001.calendar.service.TboCalendarVO;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Resource(name="calendarDao")
	private CalendarDao calendarDao;

	@Override
	public int selectCalendarSeq(Map<String, Object> params) throws Exception {
		return calendarDao.selectCalendarSeq(params);
	}
	
	@Override
	public int insertCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception {
		return calendarDao.updateCalendarEvent(tboCalendarVO);
	}

	@Override
	public int insertCalendarEventAll(List<TboCalendarVO> claendarVoList) throws Exception {
		int ret = 0;
		for(TboCalendarVO tboCalendarVO : claendarVoList) {
			ret += calendarDao.updateCalendarEvent(tboCalendarVO);
		}
		return ret;
	}
	
	@Override
	public int updateCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception {
		return calendarDao.updateCalendarEvent(tboCalendarVO);
	}

	@Override
	public Map<String, Object> selectCalendarEvent(Map<String, Object> params) throws Exception {
		return calendarDao.selectCalendarEvent(params);
	}
	
	@Override
	public List<Map<String, Object>> selectCalendarEventAll(Map<String, Object> params) throws Exception {
		return calendarDao.selectCalendarEventAll(params);
	}

	@Override
	public int deleteCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception {
		return calendarDao.deleteCalendarEvent(tboCalendarVO);
	}
	
}
