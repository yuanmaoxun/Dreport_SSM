package com.heuzoo.dreport.service.impl;

import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.heuzoo.dreport.exception.CannotAccessDataException;
import com.heuzoo.dreport.mapper.EmployeeMapper;
import com.heuzoo.dreport.mapper.JournalMapper;
import com.heuzoo.dreport.mapper.NoticemessageMapper;
import com.heuzoo.dreport.mapper.ProjectsMapper;
import com.heuzoo.dreport.mapper.WorkgroupMapper;
import com.heuzoo.dreport.pojo.EmployeeInfo;
import com.heuzoo.dreport.pojo.Intradayproject;
import com.heuzoo.dreport.pojo.Json_Journal;
import com.heuzoo.dreport.pojo.NoticemessageInfo;
import com.heuzoo.dreport.pojo.ProjectsInfo;
import com.heuzoo.dreport.pojo.View_Journal;
import com.heuzoo.dreport.pojo.WorkgroupInfo;
import com.heuzoo.dreport.service.NoticemessageService;

/**
 * @author	叶金幸
 * @name	dreport	
 * @Time	2017-2-23 下午02:16:25 
 * Description	NoticemessageService接口实现类
 * @version
 */
@Service("NoticemessageService")
public class NoticemessageServiceImpl implements NoticemessageService{

	@Autowired
	NoticemessageMapper noticemessageMapper ;
	@Autowired
	JournalMapper journalMapper;
	@Autowired
	WorkgroupMapper workgroupMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	ProjectsMapper projectsMapper;
	
	/**
	 * @author	叶金幸
	 * @time	2017-3-2 下午04:05:00
	 * @project	dreport
	 * @return	List<NoticemessageInfo>
	 * @todo	通过用户ID获取消息提醒记录
	 */
	public List<NoticemessageInfo> getNoticeRecordByUser(int userId){
		return noticemessageMapper.queryNoticemessageByUser(userId);
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午02:17:35
	 * @project	dreport
	 * @return	插入数据是否成功
	 * @params	要进行插入的数据
	 */
	@Override
	public boolean insertNoticemessage(NoticemessageInfo noticemessageInfo) {
		int userId = noticemessageInfo.getNmToUserId();
		//取到当前登录用户
		EmployeeInfo employee = employeeMapper.getEmployeeById(userId);
		//如果他已经有未读信息，则不能再接受消息
		if(employee.getEmpHasnotice() ==  1){
			return false;
		}else{
			//存完用户表，开始存提醒记录表
			if(noticemessageMapper.insertNoticemessage(noticemessageInfo) > 0){
				//用户没有未读消息，先把这个人的三个提醒相关字段更新了
				employee.setEmpHasnotice(1);
				employee.setEmpMessage(noticemessageInfo.getNmId()+"");//把int转成String存进Employee表
				employee.setEmpLastNoticeTime(new Date());
				employeeMapper.updateEmployeeInfo(employee);
				return true;
			}
		}
		return false;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午03:45:51
	 * @return	当天提交的所有日报
	 * @todo	根据当日日期查询到所有日报信息并返回
	 */
	@Override
	public List<View_Journal> queryIntradayJournals() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String dateText = dateFormat.format(date);
		return journalMapper.queryIntradayJournals(dateText);
	}
	
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-24 下午02:14:05
	 * @project	dreport
	 * @return	当天某组的成员提交总情况列表
	 * @throws Exception 
	 */
	@Override
	public List<View_Journal> queryIntradayJournalsByProject(int projectId,String empNum,int empType) throws Exception {
		List<View_Journal> resultSet = queryIntradayByProject(projectId,empNum,empType);
		return resultSet;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017年2月28日16:01:17
	 * @project	dreport
	 * @return	List<View_Journal>
	 * @params	
	 * @todo	获得当天所有日报记录，注意包括未提交的
	 */
	public List<View_Journal> queryIntradayByWorkgroup(int groupId,String empNum,int empType) throws Exception{
		int projectId = projectsMapper.getWGIdById(groupId);
		return queryIntradayByProject(projectId, empNum, empType);
	}
	
	
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-24 下午03:09:09
	 * @project	dreport
	 * @return	List<View_Journal>
	 * @params	
	 * @todo	获得当天所有日报记录，注意包括未提交的
	 */
	private List<View_Journal> queryIntradayByProject(int projectId,String empNum,int empType) throws Exception{
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String dateText = dateFormat.format(date);
		Intradayproject intradayproject = new Intradayproject();
		intradayproject.setCurrDate(dateText);
		intradayproject.setCurrProject(projectId);
		//获得某一项目当天的所有已提交日报
		List<View_Journal> intradayprojectItems = journalMapper.queryIntradayJournalsByProject(intradayproject);
		ArrayList<View_Journal> resultSet = new ArrayList<View_Journal>();
		//通过项目ID取到参与工作组的ID
		int workgroupId = projectsMapper.getProjectWorkgroupById(projectId);
		String workgroup = workgroupMapper.queryWgMembersById(workgroupId) ;
		Type listType = new TypeToken<List<Json_Journal>>() {
			}.getType();
		List<Json_Journal> employees = new Gson().fromJson(workgroup, listType);
		//获得所有未提交者的ID
		for (Json_Journal employee : employees) {
			if(!existInJournal(Integer.parseInt(employee.getId()), intradayprojectItems)){
				View_Journal viewJournal = new View_Journal();
//				viewJournal.setEmpNum(empNum);
				viewJournal.setEmpNum(employee.getId()+"");
				viewJournal.setJoursubmitPerson(Integer.parseInt(employee.getId()));
				viewJournal.setEmpType(empType);
				viewJournal.setEmpUsername(employee.getName());
				viewJournal.setProName(projectsMapper.getProjectNameById(projectId));
				viewJournal.setProId(projectId);
				viewJournal.setJourState(-1);
				resultSet.add(viewJournal);
			}
		}
		for(View_Journal journal:intradayprojectItems)
			resultSet.add(journal);
		return resultSet;
		
	}
	
	//判断一个雇员的编号是否在已提交日报的列表中，返回false时说明他没有交
	private boolean existInJournal(int employeeId,List<View_Journal> journals){
		for (View_Journal journal : journals) {
			if(employeeId == journal.getJoursubmitPerson())
				return true;
		}
		return false;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午04:48:50
	 * @project	dreport
	 * @return	boolean
	 * @todo	用户从前台读取他的提醒信息
	 */
	public NoticemessageInfo handleNoticemessage(String userNum){
		NoticemessageInfo noticemessage = null;
		//取到当前登录用户
		EmployeeInfo employee = employeeMapper.getEmployeeByNum(userNum);
		if(employee.getEmpHasnotice() == 1){
			//用户有未读消息，将其取出
			noticemessage = noticemessageMapper.getNoticemessageById(Integer.parseInt(employee.getEmpMessage()));
			//用户未读信息状态转为已读
			employee.setEmpHasnotice(0);
			employee.setEmpLastNoticeTime(new Date());
			employeeMapper.updateEmployeeInfo(employee);
			//记录表中存入已读
			noticemessage.setNmState(2);
			noticemessageMapper.updateNoticemessageInfo(noticemessage);
		}
		return noticemessage;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-26 下午04:02:24
	 * @project	dreport
	 * @return	NoticemessageInfo
	 * @params	noticeId:message在record中的ID
	 * @todo	通过ID来获取指定的noticemessage
	 */
	public NoticemessageInfo getNoticemessageById(int noticeId){
		return noticemessageMapper.getNoticemessageById(noticeId);
	}
	
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-26 下午05:55:36
	 * @project	dreport
	 * @return	boolean 更新是否成功
	 * @params	
	 * @todo	将原有noticemessage的状态由未读改为已重发
	 */
	public boolean updateNoticeState(NoticemessageInfo noticemessageInfo){
		noticemessageInfo.setNmState(NoticemessageInfo.STATE_RESENDED);
		if(noticemessageMapper.updateNoticemessageInfo(noticemessageInfo) > 0){
			noticemessageInfo.setNmState(NoticemessageInfo.STATE_UNREAD);
			return true;
		}
		noticemessageInfo.setNmState(NoticemessageInfo.STATE_UNREAD);
		return false;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-27 上午10:27:48
	 * @project	dreport
	 * @return	List<ProjectsInfo>
	 * @todo	获取全部项目生成列表供给用户选取
	 */
	public List<ProjectsInfo> getAllProjects(){
		return projectsMapper.getAllProjects();
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-27 下午02:07:32
	 * @project	dreport
	 * @return	List<NoticemessageInfo>
	 * @todo	取得记录里的所有noticeMessage
	 */
	public List<NoticemessageInfo> getAllNoticemessages(){
		return noticemessageMapper.queryAllNoticemessage();
	}
	
	
	public List<WorkgroupInfo> getWorkgroups(){
		return workgroupMapper.getAllWorkgroups();
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-27 上午10:27:02
	 * @project	dreport
	 * @return	List<Json_Journal>
	 * @todo	通过项目ID获取成员列表
	 */
	public List<Json_Journal> getMembersByProject(int projectId) throws CannotAccessDataException{
		ArrayList<Json_Journal> resultSet ;
		try{
			String temp = getMemberStringByProject(projectId);
			Type listType = new TypeToken<List<Json_Journal>>() {
			}.getType();
			resultSet = new Gson().fromJson(temp,listType);
		}catch(NullPointerException e){
			throw new CannotAccessDataException("Gson解析异常");
		}
		return resultSet;
	}
	
	public String getMemberStringByProject(int projectId) throws CannotAccessDataException{
		int workgroupId;
		String temp;
		try{
			workgroupId = projectsMapper.getProjectWorkgroupById(projectId);
			//temp:workgroup表中存储的JSON结构成员列表
			temp = workgroupMapper.queryWgMembersById(workgroupId);
		}catch(NullPointerException e){
			throw new CannotAccessDataException("选定项目ID未指定工作组");
		}
		return temp;
	}

}
