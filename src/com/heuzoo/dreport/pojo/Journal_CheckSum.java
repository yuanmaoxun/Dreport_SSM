package com.heuzoo.dreport.pojo;

public class Journal_CheckSum extends JournalInfo{

	private String empNum;  		//客户身份工号
	private String empUsername;  	//客户姓名
	private int empType;			//客户类型
	private String proName;			//项目名称
	private int proId;				//项目信息ID
	private int jourWorkSumTime;				//工作总量
	private int jourOverWorkSumTime;            //工作加班
	private int accept;							//通过数
	private int sumstate;					//全部


	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
	public int getSumstate() {
		return sumstate;
	}
	public void setSumstate(int sumstate) {
		this.sumstate = sumstate;
	}
	public int getJourWorkSumTime() {
		return jourWorkSumTime;
	}
	public void setJourWorkSumTime(int jourWorkSumTime) {
		this.jourWorkSumTime = jourWorkSumTime;
	}
	public int getJourOverWorkSumTime() {
		return jourOverWorkSumTime;
	}
	public void setJourOverWorkSumTime(int jourOverWorkSumTime) {
		this.jourOverWorkSumTime = jourOverWorkSumTime;
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
}
