package com.heuzoo.dreport.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heuzoo.dreport.mapper.EmployeeMapper;
import com.heuzoo.dreport.pojo.EmployeeInfo;
import com.heuzoo.dreport.pojo.View_Employee;
import com.heuzoo.dreport.service.EmployeeService;

/**
 * @author 高冬岩
 * @Time   2017.2.22 02:36:57
 * @todo   EmployeeService的实现类，用于实现用户登录
 * @params 
 */
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeMapper employeeMapper;
	
	/**
	 * @author	高冬岩
	 * @time	2017-2-22 下午03:40:14
	 * @project	dreport
	 * @todo	根据用户名和密码查询员工信息
	 */
	@Override
	public EmployeeInfo queryEmployeeByNumAndPwd(String num, String pwd) {
		EmployeeInfo employeeInfo = new EmployeeInfo();
		employeeInfo.setEmpNum(num);
		employeeInfo.setEmpPassword(pwd);
		EmployeeInfo info = employeeMapper.queryEmployeeByNumAndPwd(employeeInfo);
		return info;
	}
	
	/**
	 * @author	高冬岩
	 * @time	2017-2-23 上午10:30:31
	 * @project	dreport
	 * @todo	更新员工上次登录时间字段
	 */
	@Override
	public int updateEmployeeLastLoginTime(String num, Date date) {
		EmployeeInfo employeeInfo = new EmployeeInfo();
		employeeInfo.setEmpNum(num);
		employeeInfo.setEmpLastlogin(date);
		int result = employeeMapper.updateEmployeeLastLoginTime(employeeInfo);
		return result;
	}
	
	/**
	 * @author	高冬岩
	 * @time	2017-2-24 上午9:30:17
	 * @project	dreport
	 * @todo	向用户表中查询新记录
	 */
	@Override
	public int insertEmployeeInfo(EmployeeInfo employeeInfo) {
		int result = employeeMapper.insertEmployeeInfo(employeeInfo);
		return result;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午03:23:22
	 * @project	dreport
	 * @todo	更新员工信息的实现类
	 */
	@Override
	public boolean updateEmployeeInfo(EmployeeInfo employeeInfo) {
		if(employeeMapper.updateEmployeeInfo(employeeInfo) > 0){
			return true;
		}
		return false;
	}

	/**
	 * @author	刘敏
	 * @time	2017-2-24 下午05:16:22
	 * @project	dreport
	 * @todo	查询未分配的员工
	 */
	@Override
	public List<EmployeeInfo> queryEmployeeByGroup() {
		List<EmployeeInfo> info = employeeMapper.queryEmployeeByGroup();
		return info;
	}
	/**
	 * @author	刘敏
	 * @time	2017-2-24 下午00:18:53
	 * @project	dreport
	 * @todo	查询未分配的组长
	 */
	@Override
	public List<EmployeeInfo> queryEmployerByGroup() {
		List<EmployeeInfo> info = employeeMapper.queryEmployerByGroup();
		return info;
	}
	
	/**
	 * @author  岳盈
	 * @project dreport
	 * @date 	2017-2-23
	 * @查询用户信息
	 */
	@Override
	public List<View_Employee> queryEmployeeInfoByName() {
		return employeeMapper.queryEmployeeInfoByName();
	}
	
	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-26 下午06:14:23
	 * @description 将员工状态由未分配改为已分配
	 */
	public void updateEmpolyeeWorkgroupId(EmployeeInfo emp) {
		employeeMapper.updateEmpolyeeWorkgroupId(emp);
	}
	/**
	 * @author 袁茂洵
	 * @project dreport
	 * @date 2017-2-27 19:41:32
	 * @description 更新员工部分信息
	 */
	@Override
	public boolean updateEmployeeInfoById(EmployeeInfo employeeInfo) {
		int res = employeeMapper.updateEmployeeInfoById(employeeInfo);
		if(res > 0)
			return true;
		else
			return false;
	}
	
}
