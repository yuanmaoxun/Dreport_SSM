package com.heuzoo.dreport.pojo;

import java.util.Date;

/**
 * @author  yuanmaoxun
 * @project dreport
 * @date 	2017-2-22
 * @ForTables 系统用户表 
 */
public class EmployeeInfo {
	private int empId;  			//客户ID
	private String empNum;  		//客户身份工号
	private String empUsername;  	//客户姓名
	private String empPassword;  	//客户密码
	private int empType;        	//客户类型
	private Date empLastlogin;		//客户上一次登录时间
	private int empEnable;			//用于标记用户状态״̬
	private int empHasnotice;		//用于记录消息通知状态֪״̬
	private String empMessage;		//用于记录发送的提醒信息
	private int empWorkgroupId;		//Ա员工对应的组号
	private Date empLastNoticeTime; //员工对应的组号
	
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	public String getEmpUsername() {
		return empUsername;
	}
	public void setEmpUsername(String empUsername) {
		this.empUsername = empUsername;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	public int getEmpType() {
		return empType;
	}
	public void setEmpType(int empType) {
		this.empType = empType;
	}
	public Date getEmpLastlogin() {
		return empLastlogin;
	}
	public void setEmpLastlogin(Date empLastlogin) {
		this.empLastlogin = empLastlogin;
	}
	public int getEmpEnable() {
		return empEnable;
	}
	public void setEmpEnable(int empEnable) {
		this.empEnable = empEnable;
	}
	public int getEmpHasnotice() {
		return empHasnotice;
	}
	public void setEmpHasnotice(int empHasnotice) {
		this.empHasnotice = empHasnotice;
	}
	public String getEmpMessage() {
		return empMessage;
	}
	public void setEmpMessage(String empMessage) {
		this.empMessage = empMessage;
	}
	public int getEmpWorkgroupId() {
		return empWorkgroupId;
	}
	public void setEmpWorkgroupId(int empWorkgroupId) {
		this.empWorkgroupId = empWorkgroupId;
	}
	public Date getEmpLastNoticeTime() {
		return empLastNoticeTime;
	}
	public void setEmpLastNoticeTime(Date empLastNoticeTime) {
		this.empLastNoticeTime = empLastNoticeTime;
	}
}
