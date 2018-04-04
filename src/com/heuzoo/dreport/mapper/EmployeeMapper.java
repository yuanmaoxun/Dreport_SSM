package com.heuzoo.dreport.mapper;

import java.util.List;

import com.heuzoo.dreport.pojo.EmployeeInfo;
import com.heuzoo.dreport.pojo.View_Employee;

public interface EmployeeMapper {
	//根据用户名和密查询用户
	public EmployeeInfo queryEmployeeByNumAndPwd(EmployeeInfo employeeInfo);
	//更新员工上次登录时间字段信息
	public int updateEmployeeLastLoginTime(EmployeeInfo employeeInfo);
	//根据这个传入对象的usernum改其他字段。
	public int updateEmployeeInfo(EmployeeInfo employeeInfo);
	//根据用户的工号直接取到用户
	public EmployeeInfo getEmployeeByNum(String empNum);
	//根据用户的Id直接取到用户
	public EmployeeInfo getEmployeeById(int empId);
	//向用户表插入新记录
	public int insertEmployeeInfo(EmployeeInfo employeeInfo);
	//查询未分配项目的员工
	public List<EmployeeInfo> queryEmployeeByGroup();
	//查询未分配项目的组长
	public List<EmployeeInfo> queryEmployerByGroup();
	
	
	/**
	 * @author 岳盈
	 * @project dreport
	 * @date 	2017-2-23 
	 * 查询用户信息
	 */
	public List<View_Employee> queryEmployeeInfoByName();
	
	/**
	 * @author 刘敏
	 * @param id 
	 * @project dreport
	 * @date 2017-2-26 下午06:14:23
	 * @description 将员工状态由未分配改为已分配
	 */
	public void updateEmpolyeeWorkgroupId(EmployeeInfo emp);
	
	/**
	 * @author 袁茂洵
	 * @project dreport
	 * @date 2017-2-27 19:44:34
	 * @description 更新员工部分信息
	 */
	public int updateEmployeeInfoById(EmployeeInfo employeeInfo);
}
