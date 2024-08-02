package test001.finance.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("financeDao")
public class FinanceDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> selectCateGroupList(Map<String, Object> params) throws Exception {
		return sqlSession.selectList("FinanceDao_SQL.selectCateGroupList", params);
	}
	
	public int insertDeduction(Map<String, Object> params) throws Exception {
		return sqlSession.insert("FinanceDao_SQL.insertDeduction", params);
	}
	
	public List<Map<String, Object>> selectDeductionList(Map<String, Object> params) throws Exception {
		return sqlSession.selectList("FinanceDao_SQL.selectDeductionList", params);
	}
	
	public Map<String, Object> selectDeductionAmount(Map<String, Object> params) throws Exception {
		return sqlSession.selectOne("FinanceDao_SQL.selectDeductionAmount", params);
	}
}
