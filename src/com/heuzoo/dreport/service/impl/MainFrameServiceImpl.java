package com.heuzoo.dreport.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heuzoo.dreport.mapper.MainFrameMapper;
import com.heuzoo.dreport.service.MainFrameService;

/**
 * @author 高冬岩
 * @Time   2017年2月22日下午02:31:22
 * @todo   用于用户相关操作与查询的逻辑控制功能的具体实现
 */
@Service("mainFrameService")
public class MainFrameServiceImpl implements MainFrameService {
	
	@Autowired
	MainFrameMapper mainFrameMapper;
	
	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询雇员总数
	 * */
	@Override
	public int getEmployeeCount() {
		return mainFrameMapper.getEmployeeCount();
	}

	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询日报总数
	 * */
	@Override
	public int getJournalCount() {
		return mainFrameMapper.getJournalCount();
	}

	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询项目总数
	 * */
	@Override
	public int getProjectCount() {
		return mainFrameMapper.getProjectCount();
	}

	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询工作组总数
	 * */
	@Override
	public int getWorkgroupCount() {
		return mainFrameMapper.getWorkgroupCount();
	}
}
