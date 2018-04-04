package com.heuzoo.dreport.pojo;

/**
 * @author  yuanmaoxun
 * @project dreport
 * @date 	2017-2-22
 * @ForTables工作组表
 */
public class WorkgroupInfo {
	private int wgId;				//工作组ID
	private int wgLeaderId;			//领导者ID
	private String wgMembers;		//组内成员列表
	private String wgName;			//工作组名称
	private String wgRemarks;		//备注信息
	private int wgEnable;			//用于标记记录是否可用
	
	public int getWgId() {
		return wgId;
	}
	public void setWgId(int wgId) {
		this.wgId = wgId;
	}
	public int getWgLeaderId() {
		return wgLeaderId;
	}
	public void setWgLeaderId(int wgLeaderId) {
		this.wgLeaderId = wgLeaderId;
	}
	public String getWgMembers() {
		return wgMembers;
	}
	public void setWgMembers(String wgMembers) {
		this.wgMembers = wgMembers;
	}
	public String getWgName() {
		return wgName;
	}
	public void setWgName(String wgName) {
		this.wgName = wgName;
	}
	public String getWgRemarks() {
		return wgRemarks;
	}
	public void setWgRemarks(String wgRemarks) {
		this.wgRemarks = wgRemarks;
	}
	public int getWgEnable() {
		return wgEnable;
	}
	public void setWgEnable(int wgEnable) {
		this.wgEnable = wgEnable;
	}
	
}
