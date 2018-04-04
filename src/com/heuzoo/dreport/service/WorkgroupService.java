package com.heuzoo.dreport.service;

import com.heuzoo.dreport.pojo.WorkgroupInfo;


/**
 * @author  袁茂洵
 * @project dreport
 * @date 	2017-2-22 21:17:31
 * @ 处理Workgroup有关的业务逻辑
 */
public interface WorkgroupService {
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-22 21:21:22
	 * @ 根据emWorkgroupId查询组内成员信息
	 */
	public String queryWgMembersById(int emWorkgroupId);

	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-24 上午10:50:44
	 * @description 创建工作组
	 */
	public int insertWorkgroup(WorkgroupInfo wg);
}
