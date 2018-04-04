package com.heuzoo.dreport.pojo;

import java.util.Date;


/**
 * @author  yuanmaoxun
 * @project dreport
 * @date 	2017-2-22
 * @ForTables 项目信息表
 */
public class ProjectsInfo {
	private int proId;				//项目信息ID
	private String proName;			//项目名称
	private Date proStartTime;		//项目开始时间
	private Date proEndTime;		//项目结束时间
	private int proParticipateWg;	//项目对应的工作组
	private String proPrpStage;		//项目的prp工作阶段
	private int proEnable;			//项目信息状态״̬
	
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public Date getProStartTime() {
		return proStartTime;
	}
	public void setProStartTime(Date proStartTime) {
		this.proStartTime = proStartTime;
	}
	public Date getProEndTime() {
		return proEndTime;
	}
	public void setProEndTime(Date proEndTime) {
		this.proEndTime = proEndTime;
	}
	public int getProParticipateWg() {
		return proParticipateWg;
	}
	public void setProParticipateWg(int proParticipateWg) {
		this.proParticipateWg = proParticipateWg;
	}
	public String getProPrpStage() {
		return proPrpStage;
	}
	public void setProPrpStage(String proPrpStage) {
		this.proPrpStage = proPrpStage;
	}
	public int getProEnable() {
		return proEnable;
	}
	public void setProEnable(int proEnable) {
		this.proEnable = proEnable;
	}
}
