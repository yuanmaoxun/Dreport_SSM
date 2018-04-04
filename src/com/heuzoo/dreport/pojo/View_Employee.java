package com.heuzoo.dreport.pojo;
/**
 * @author  岳盈
 * @project dreport
 * @date 	2017-2-23 
 * @ 新建继承类，添加Workgroup部分属性
 */
public class View_Employee extends EmployeeInfo{
	private int wgId;
	private int wgLeaderId;
	private String wgName;
	
	public int getWgId(){
		return wgId;
	}
	public void setWgId(int wgId){
		this.wgId=wgId;
	}
	
	public int getWgLeaderId(){
		return wgLeaderId;
	}
	public void setWgLeaderId(int wgLeaderId){
		this.wgLeaderId=wgLeaderId;
	}
	
	public String getWgName(){
		return wgName;
	}
	public void setWgName(String wgName){
		this.wgName=wgName;
	}

}
