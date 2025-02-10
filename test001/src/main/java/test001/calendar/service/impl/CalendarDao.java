package test001.calendar.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test001.calendar.service.TboCalendarVO;

@Repository("calendarDao")
public class CalendarDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int selectCalendarSeq(Map<String, Object> params) throws Exception {
		return (Integer)sqlSession.selectOne("CalendarDao_SQL.selectCalendarSeq", params);
	}
	
	public int updateCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception {
		return sqlSession.update("CalendarDao_SQL.updateCalendarEvent", tboCalendarVO);
	}
	
	public Map<String, Object> selectCalendarEvent(Map<String, Object> params) throws Exception {
		return sqlSession.selectOne("CalendarDao_SQL.selectCalendarEvent", params);
	}
	
	public List<Map<String, Object>> selectCalendarEventAll(Map<String, Object> params) throws Exception {
		return sqlSession.selectList("CalendarDao_SQL.selectCalendarEventAll", params);
	}
	
	public int deleteCalendarEvent(TboCalendarVO tboCalendarVO) throws Exception {
		return sqlSession.delete("CalendarDao_SQL.deleteCalendarEvent", tboCalendarVO);
	}
	
}
