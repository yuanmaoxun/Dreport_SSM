package com.heuzoo.dreport.pojo;

import java.util.Date;

/**
 * @author  yuanmaoxun
 * @project dreport
 * @date 	2017-2-22
 * @ForTable日志表
 */
public class JournalInfo {
	private int jourId;						//日志ID					
	private Date jourSubmitTime;			//日志提交时间
	private int joursubmitPerson;			//日志提交人
	private int jourProjectId;				//日志对应的项目
	private int jourcurrStage;				//日志对应的PRP阶段
	private int jourState;					//日志对应的审核状态״̬
	private int jourOvertimeWork;			//当日是否加班
	private int jourWorkload;				//当日工作量
	private String jourTask;				//工作任务概述
	private int jourEnable;					//日志状态标注
	public int getJourId() {
		return jourId;
	}
	public void setJourId(int jourId) {
		this.jourId = jourId;
	}
	public Date getJourSubmitTime() {
		return jourSubmitTime;
	}
	public void setJourSubmitTime(Date jourSubmitTime) {
		this.jourSubmitTime = jourSubmitTime;
	}
	public int getJoursubmitPerson() {
		return joursubmitPerson;
	}
	public void setJoursubmitPerson(int joursubmitPerson) {
		this.joursubmitPerson = joursubmitPerson;
	}
	public int getJourProjectId() {
		return jourProjectId;
	}
	public void setJourProjectId(int jourProjectId) {
		this.jourProjectId = jourProjectId;
	}
	public int getJourcurrStage() {
		return jourcurrStage;
	}
	public void setJourcurrStage(int jourcurrStage) {
		this.jourcurrStage = jourcurrStage;
	}
	public int getJourState() {
		return jourState;
	}
	public void setJourState(int jourState) {
		this.jourState = jourState;
	}
	public int getJourOvertimeWork() {
		return jourOvertimeWork;
	}
	public void setJourOvertimeWork(int jourOvertimeWork) {
		this.jourOvertimeWork = jourOvertimeWork;
	}
	public int getJourWorkload() {
		return jourWorkload;
	}
	public void setJourWorkload(int jourWorkload) {
		this.jourWorkload = jourWorkload;
	}
	public String getJourTask() {
		return jourTask;
	}
	public void setJourTask(String jourTask) {
		this.jourTask = jourTask;
	}
	public int getJourEnable() {
		return jourEnable;
	}
	public void setJourEnable(int jourEnable) {
		this.jourEnable = jourEnable;
	}
}
