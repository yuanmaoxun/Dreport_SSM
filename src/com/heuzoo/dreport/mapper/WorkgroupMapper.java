package com.heuzoo.dreport.mapper;


import java.util.List;

import com.heuzoo.dreport.pojo.WorkgroupInfo;


public interface WorkgroupMapper {
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-22 21:30:34
	 * @ 根据用户组ID（emWorkgroupId）查询所在组的成员信息
	 */
	public String queryWgMembersById(int emWorkgroupId);
	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-24 上午10:57:18
	 * @description 创建工作组
	 */
	public int insertWorkgroup(WorkgroupInfo wg);
	//取得所有工作组
	public List<WorkgroupInfo> getAllWorkgroups();
}
