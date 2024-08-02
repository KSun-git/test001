package test001.finance.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import test001.finance.service.FinanceService;

@Service("financeService")
public class FinanceServiceImpl implements FinanceService {
	
	@Resource(name="financeDao")
	private FinanceDao financeDao;

	@Override
	public List<Map<String, Object>> selectCateGroupList(Map<String, Object> params) throws Exception {
		return financeDao.selectCateGroupList(params);
	}

	@Override
	public int insertDeduction(Map<String, Object> params) throws Exception {
		return financeDao.insertDeduction(params);
	}

	@Override
	public Map<String, Object> selectDeductionList(Map<String, Object> params) throws Exception {
		Map<String, Object> resultMap = new HashMap<String ,Object>();
		resultMap.put("deductionList", financeDao.selectDeductionList(params));
		resultMap.put("deductionAmountMap", financeDao.selectDeductionAmount(params));
		return resultMap;
	}
	
}
