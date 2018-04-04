package com.heuzoo.dreport.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heuzoo.dreport.mapper.ProjectsMapper;
import com.heuzoo.dreport.pojo.ProjectsInfo;
import com.heuzoo.dreport.service.ProjectsService;

/**
 * @author	刘敏
 * @time	上午09:53:25
 * @project	dreport
 * @todo	处理项目相关的业务逻辑
 */

@Service("projectsService")
public class ProjectsServiceImpl implements ProjectsService{
	@Autowired
	private ProjectsMapper projectsMapper;
	/**
	 * @author	刘敏
	 * @time	上午09:53:25
	 * @project	dreport
	 * @todo	新建新项目
	 */
	public void insertProjectsInfo(ProjectsInfo proInfo) {
		projectsMapper.insertProjectInfo(proInfo);
	}
	/**
	 * @author	齐彤
	 * @time	下午02:45:53
	 * @project	dreport
	 * @todo	查项目名
	 */
	public List<ProjectsInfo> queryPro(){
		return (List<ProjectsInfo>) projectsMapper.queryPro();
	}
}
