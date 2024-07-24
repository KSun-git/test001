package test001.common.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import test001.common.service.IndexService;

@Service("indexService")
public class IndexServiceImpl implements IndexService {
	
	@Resource(name="indexDao")
	private IndexDao indexDao;

	@Override
	public String selectSysdate() throws Exception {
		return indexDao.selectSysdate();
	}
	
	
}
