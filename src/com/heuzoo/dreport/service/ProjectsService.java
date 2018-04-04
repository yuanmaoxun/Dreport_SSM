/**
 * 
 */
package com.heuzoo.dreport.service;

import java.util.List;

import com.heuzoo.dreport.pojo.ProjectsInfo;

/**
 * @author	刘敏
 * @time	上午09:34:03
 * @project	dreport
 * @todo	处理项目相关的业务逻辑
 */

/**
 * @author	齐彤
 * @time	下午02:44:04
 * @project	dreport
 * @todo	找项目名称
 */
public interface ProjectsService {
    public void insertProjectsInfo(ProjectsInfo proInfo);
 /*   齐彤*/
    public List<ProjectsInfo> queryPro();
}
