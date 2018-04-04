package com.heuzoo.dreport.service;

/**
 * @author 高冬岩
 * @Time   2017年3月2日下午02:20:12
 * @todo   用于用户相关操作与查询的逻辑控制
 */
public interface MainFrameService {
	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询雇员总数
	 * */
	public int getEmployeeCount();
	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询工作组总数
	 * */
	public int getWorkgroupCount();
	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询日报总数
	 * */
	public int getJournalCount();
	/**
	 * Create Date:2017.3.2
	 * @author 高冬岩
	 * 这一方法用于查询项目总数
	 * */
	public int getProjectCount();
}
