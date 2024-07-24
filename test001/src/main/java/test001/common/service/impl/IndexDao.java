package test001.common.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("indexDao")
public class IndexDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	String selectSysdate() throws Exception{
		return sqlSession.selectOne("IndexDao_SQL.selectSysdate");
	}
	
}
