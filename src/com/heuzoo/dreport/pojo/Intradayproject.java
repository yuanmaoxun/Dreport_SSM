package com.heuzoo.dreport.pojo;

/**
 * @author	叶金幸
 * @name	dreport	
 * @Time	2017-2-24 下午12:02:40 
 * Description 用来作为参数传mapper，查当天某一组的全部日报
 * @version
 */
public class Intradayproject {
	
	public String getCurrDate() {
		return currDate;
	}
	public void setCurrDate(String currDate) {
		this.currDate = currDate;
	}
	public int getCurrProject() {
		return currProject;
	}
	public void setCurrProject(int currProject) {
		this.currProject = currProject;
	}
	String currDate;
	int	currProject;
}
