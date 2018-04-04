package com.heuzoo.dreport.service;

import java.util.Date;
import java.util.List;

import com.heuzoo.dreport.pojo.EmployeeInfo;
import com.heuzoo.dreport.pojo.View_Employee;


/**
 * @author 高冬岩
 * @Time   2017年2月22日下午02:31:22
 * @todo   用于用户相关操作与查询的逻辑控制
 */
public interface EmployeeService {
	
	/**
	 * Create Date:2017.2.22
	 * @author 高冬岩
	 * 这一方法用于登录时候的查询数据库操作
	 * */
	public EmployeeInfo queryEmployeeByNumAndPwd(String num, String pwd);
	
	/**
	 * Create Date:2017.2.22
	 * @author 高冬岩
	 * 这一方法用于更新用户上次登录时间
	 * */
	public int updateEmployeeLastLoginTime(String num, Date date);
	
	/**
	 * Create Date:2017.2.22
	 * @author 高冬岩
	 * 这一方法用于更新用户上次登录时间
	 * */
	public int insertEmployeeInfo(EmployeeInfo employeeInfo);
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午03:22:17
	 * @project	dreport
	 * @return	boolean，更新是否成功
	 * @params	员工信息详情
	 * @todo	使用员工工号确定员工，然后更新其他信息
	 */
	public boolean updateEmployeeInfo(EmployeeInfo employeeInfo);
	/**
	 * @author  刘敏
	 * @project dreport
	 * @date    2017-2-24 下午04:57:08
	 * @description 查询未分配的员工
	 */
	public List<EmployeeInfo> queryEmployeeByGroup();
	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-26 下午12:17:00
	 * @description 查询未分配的组长
	 */
	public List<EmployeeInfo> queryEmployerByGroup();
	
	/**
	 * Create Date:2017.2.23
	 * @author 岳盈
	 * 查询用户信息
	 * */
	
	public List<View_Employee> queryEmployeeInfoByName();
	
	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-26 下午06:12:32
	 * @description 将员工状态由未分配改为已分配
	 */
	public void updateEmpolyeeWorkgroupId(EmployeeInfo emp);
	/**
	 * @author 袁茂洵
	 * @project dreport
	 * @date 2017-2-27 19:38:24
	 * @description 将更新员工部分信息
	 */
	public boolean updateEmployeeInfoById(EmployeeInfo employeeInfo);
}
