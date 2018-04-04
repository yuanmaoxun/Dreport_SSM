package com.heuzoo.dreport.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.heuzoo.dreport.exception.CannotAccessDataException;
import com.heuzoo.dreport.pojo.NoticemessageInfo;
import com.heuzoo.dreport.pojo.ProjectsInfo;
import com.heuzoo.dreport.pojo.View_Journal;
import com.heuzoo.dreport.pojo.WorkgroupInfo;
import com.heuzoo.dreport.service.NoticemessageService;

@Controller
@RequestMapping("/noticemessageController")
public class NoticemessageController {
	 
	@Autowired
	NoticemessageService noticemessageService;
	@Autowired
	HttpServletRequest request;
	
//	/**
//	 * @author	叶金幸
//	 * @time	2017-2-23 下午03:59:51
//	 * @project	dreport
//	 * @return	显示当天所有记录的modelAndView
//	 * @todo	显示结果的页面，还没做
//	 */
//	@RequestMapping("/queryintradayrecord")
//	public ModelAndView prepareIntradayInfo(HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		
//		//已测试，可以查出当天的所有记录
//		System.out.println(noticemessageService.queryIntradayJournals().size());
//		
//		mav.setViewName("Aindex");
//		return mav;
//	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-3-2 下午03:56:52
	 * @project	dreport
	 * @return	void
	 * @throws IOException 
	 * @todo	用来给单个用户查看消息提醒列表
	 */
	@RequestMapping("/querynoticerecord")
	public void handleUserNoticeRecord(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		OutputStream outputStream = response.getOutputStream();
		List<NoticemessageInfo> result = noticemessageService.getNoticeRecordByUser(userId);
		Gson gson = new Gson();
		String output = gson.toJson(result);
		outputStream.write(output.getBytes("UTF-8"));
		outputStream.flush();
		outputStream.close();
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-3-1 下午02:57:52
	 * @project	dreport
	 * @return	void
	 * @todo	单独发送单条消息时使用此方法
	 */
	@RequestMapping("/createnoticerecord")
	public void createNoticeRecord(HttpServletRequest request,HttpServletResponse response) throws IOException {
		NoticemessageInfo noticemessageInfo = new NoticemessageInfo();
		//新消息，设置此条目可用
		noticemessageInfo.setNmEnable(1);
		noticemessageInfo.setNmFromUserId(Integer.parseInt(request.getSession().getAttribute("userId").toString()));
		noticemessageInfo.setNmMessageContent(request.getParameter("messageContent"));
		noticemessageInfo.setNmRank(Integer.parseInt(request.getParameter("noticeType")));
		noticemessageInfo.setNmToUserId(Integer.parseInt(request.getParameter("toUserId")));//接收这个提醒的用户的用户ID
		//初始状态一定是未读
		noticemessageInfo.setNmState(NoticemessageInfo.STATE_UNREAD);
		noticemessageInfo.setNmTime(new Date());
		OutputStream outputStream = response.getOutputStream();
		if(noticemessageService.insertNoticemessage(noticemessageInfo)){
			System.out.println("插入成功" + noticemessageInfo.getNmId());
			outputStream.write("200".getBytes());
		}else{
			outputStream.write("404".getBytes());
		}
		outputStream.close();			
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-24 上午11:14:09
	 * @project	dreport
	 * @return	void
	 * @todo	接收消息端AJAX请求，当有未读消息时将此消息以JSON形式返回给客户端
	 */
	@RequestMapping("/queryUserNotice")
	public void handleUpdateNotice(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String userNum = request.getSession().getAttribute("userNum").toString();
		NoticemessageInfo result = noticemessageService.handleNoticemessage(userNum);
		if(result != null){
			OutputStream outputStream = response.getOutputStream();
			Gson gson = new Gson();
			String output = gson.toJson(result);
			outputStream.write(output.getBytes("UTF-8"));
			outputStream.flush();
			outputStream.close();
		}
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-24 下午01:59:18
	 * @project	dreport
	 * @return	ModelAndView
	 * @params	groupId:今天
	 * 用户根据传入的工作组ID查到List并返回给页面
	 */
	@RequestMapping("/prepareNotice")
	public ModelAndView handlePrepareNotice(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		//取到用户类型
		try{
			int empType = Integer.parseInt(request.getSession().getAttribute("userType").toString());
			String empNum = request.getSession().getAttribute("userNum").toString();
			List<View_Journal> result = noticemessageService.queryIntradayByWorkgroup(groupId,empNum,empType);
			modelAndView.addObject("viewJournals", result);
		}catch (NullPointerException e) {
			System.out.println("用户未登录");
			e.printStackTrace();
			modelAndView.setViewName("login");
			return modelAndView;
		}catch (Exception e) {
			e.printStackTrace();
		}

		modelAndView.setViewName("preparenotice");
		return modelAndView;
	}
	
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-26 下午03:25:02
	 * @project	dreport
	 * @return	void
	 * @throws IOException 
	 * @todo	AJAX：日报管理员发送提醒消息后，若一段时间用户仍没有反应则可以重发消息
	 */
	@RequestMapping("/noticeResend")
	public void handleResend(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//从request中拿到要重新发送的ID
		int noticeId = Integer.parseInt(request.getParameter("resendNoticeId"));
		NoticemessageInfo noticemessageInfo ;
		noticemessageInfo = noticemessageService.getNoticemessageById(noticeId);
		OutputStream outputStream = response.getOutputStream();
		try{
			if(noticemessageInfo != null){
				noticemessageService.updateNoticeState(noticemessageInfo);
				//将发送人设置为当前登录用户
				noticemessageInfo.setNmFromUserId(Integer.parseInt(request.getSession().getAttribute("userId").toString()));
				noticemessageInfo.setNmTime(new Date());
				if(!noticemessageService.insertNoticemessage(noticemessageInfo))
					throw new CannotAccessDataException("数据插入失败");
				outputStream.write("200".getBytes());
			}
		}catch(Exception e){
			outputStream.write("500".getBytes());
		}finally{
			outputStream.close();
		}
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-27 下午03:03:45
	 * @project	dreport
	 * @return	void
	 * @throws CannotAccessDataException 
	 * @throws IOException 
	 * @todo	允许用户通过选取的项目号更新用户列表
	 */
	@RequestMapping("/getMembersByProject")
	public void handleMembersUpdate(HttpServletRequest request,HttpServletResponse response) throws CannotAccessDataException, IOException{
		int projectId = Integer.parseInt(request.getParameter("projectId").toString());
		String membersString = noticemessageService.getMemberStringByProject(projectId);
		System.out.println(membersString);
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(membersString.getBytes("UTF-8"));
		outputStream.close();
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-27 上午10:07:52
	 * @project	dreport
	 * @todo	允许用户获得全部工作组构成的列表，（后续还可以通过选定组来选定发送对象）
	 * 			用于消息发送、提醒发送
	 */
	@RequestMapping("/prepareWorkgroupList")
	public ModelAndView prepareMessage(){
		List<WorkgroupInfo> workgroups = noticemessageService.getWorkgroups();
		ModelAndView mav = new ModelAndView();
		mav.addObject("workgroups", workgroups);
		mav.setViewName("selectWorkgroup");
		return mav;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-27 下午12:43:19
	 * @project	dreport
	 * @return	ModelAndView
	 * @todo	准备好项目列表，供给用户选择发送对象
	 */
	@RequestMapping("/prepareProjectsList")
	public ModelAndView prepareProjectsForNotice(){
		List<ProjectsInfo> projects = noticemessageService.getAllProjects();
		ModelAndView mav = new ModelAndView();
		mav.addObject("projects", projects);
		System.out.println(projects.get(0).getProName());
		mav.setViewName("selectMember");
		return mav;
	}
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-27 下午02:10:12
	 * @project	dreport
	 * @return	ModelAndView
	 * @todo	获取之前的全部提醒历史记录，供给查看、重发功能来使用
	 */
	@RequestMapping("/prepareHistory")
	public ModelAndView prepareHistory(){
		List<NoticemessageInfo> noticemessageInfos = noticemessageService.getAllNoticemessages();
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticemessageInfos", noticemessageInfos);
		mav.setViewName("prepareresend");
		return mav;
	}
}
