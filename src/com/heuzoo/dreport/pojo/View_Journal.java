package com.heuzoo.dreport.pojo;


/**
 * @author  袁茂洵
 * @project dreport
 * @date 	2017-2-22 22:03:33
 * @ 新建Journal继承类，添加Employee部分属性
 */
public class View_Journal extends JournalInfo{
	private String empNum;  		//客户身份工号
	private String empUsername;  	//客户姓名
	private int empType;			//客户类型
	private String proName;			//项目名称
	private int proId;				//项目信息ID
	private String proPrpStage;		//项目prp阶段Json串
	
	
	public String getProPrpStage() {
		return proPrpStage;
	}
	public void setProPrpStage(String proPrpStage) {
		this.proPrpStage = proPrpStage;
	}
	public int getEmpType() {
		return empType;
	}
	public void setEmpType(int empType) {
		this.empType = empType;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
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
}
