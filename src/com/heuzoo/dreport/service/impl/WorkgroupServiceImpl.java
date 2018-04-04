package com.heuzoo.dreport.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heuzoo.dreport.mapper.WorkgroupMapper;
import com.heuzoo.dreport.pojo.WorkgroupInfo;
import com.heuzoo.dreport.service.WorkgroupService;

/**
 * @author 袁茂洵
 * @Time   2017.2.22 21:24:52
 * @todo   WorkgroupService的实现类
 * @params 
 */
@Service("workgroupService")
public class WorkgroupServiceImpl implements WorkgroupService{
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-22 21:26:22
	 * @ 实现根据emWorkgroupId查询组内成员信息
	 */
	@Autowired
	private WorkgroupMapper workgroupMapper;
	@Override
	public String queryWgMembersById(int emWorkgroupId) {
		
		return workgroupMapper.queryWgMembersById(emWorkgroupId);
	}
	@Override
	/**
	 * @author  刘敏
	 * @project dreport
	 * @date 	2017-2-22 上午10:56:23
	 * @ 创建工作组
	 */
	public int insertWorkgroup(WorkgroupInfo wg) {
		// TODO Auto-generated method stub
		workgroupMapper.insertWorkgroup(wg);
		return wg.getWgId();
	}

}
