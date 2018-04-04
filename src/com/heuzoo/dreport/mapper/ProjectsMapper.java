package com.heuzoo.dreport.mapper;

import java.util.List;

import com.heuzoo.dreport.pojo.ProjectsInfo;

public interface ProjectsMapper {
	
	//通过项目ID直接取到项目负责的工作组
	public int getProjectWorkgroupById(int projectId);
	public int getWGIdById(int workgroupId);
	//获得所有项目
	public List<ProjectsInfo> getAllProjects();

	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-27 上午10:04:30
	 * @description 新建工作组
	 */
	public void insertProjectInfo(ProjectsInfo proInfo);
	/**
	 * @author 齐彤
	 * @project dreport
	 * @date 2017-2-27 上午12:04:30
	 * @description 查询有哪些设定的项目
	 */
	public List<ProjectsInfo> queryPro();
	public String getProjectNameById(int projectId);
}
