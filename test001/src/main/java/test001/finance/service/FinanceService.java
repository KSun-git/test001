package test001.finance.service;

import java.util.List;
import java.util.Map;

public interface FinanceService {
	
	List<Map<String, Object>> selectCateGroupList(Map<String, Object> params) throws Exception;
	
	int insertDeduction(Map<String, Object> params) throws Exception;
	
	Map<String, Object> selectDeductionList(Map<String, Object> params) throws Exception;
	
	Map<String, Object> selectDeductionMap(Map<String, Object> params) throws Exception;
	
	int updateDeduction(Map<String, Object> params) throws Exception;
}
