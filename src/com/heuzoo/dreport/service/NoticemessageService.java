package com.heuzoo.dreport.service;

import java.util.List;

import com.heuzoo.dreport.exception.CannotAccessDataException;
import com.heuzoo.dreport.pojo.NoticemessageInfo;
import com.heuzoo.dreport.pojo.ProjectsInfo;
import com.heuzoo.dreport.pojo.View_Journal;
import com.heuzoo.dreport.pojo.WorkgroupInfo;

/**
 * @author	叶金幸
 * @name	dreport	
 * @Time	2017-2-23 下午02:15:05 
 * Description  为消息提醒记录表提供服务的服务类
 * @version
 */
public interface NoticemessageService {
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午03:29:15
	 * @return	List<View_Journal>
	 * @todo	获得当天的项目列表
	 */
	public List<View_Journal> queryIntradayJournals();
	public boolean insertNoticemessage(NoticemessageInfo noticemessageInfo);
	public NoticemessageInfo handleNoticemessage(String userNum);
	public List<View_Journal> queryIntradayJournalsByProject(int projectId,String empNum,int empType) throws Exception;
	public NoticemessageInfo getNoticemessageById(int noticeId);
	public boolean updateNoticeState(NoticemessageInfo noticemessageInfo);
	public List<ProjectsInfo> getAllProjects();
	public List<WorkgroupInfo> getWorkgroups();
	public List<NoticemessageInfo> getAllNoticemessages();
	public List<View_Journal> queryIntradayByWorkgroup(int groupId,String empNum,int empType) throws Exception;
	public String getMemberStringByProject(int projectId) throws CannotAccessDataException;
	public List<NoticemessageInfo> getNoticeRecordByUser(int userId);
}
