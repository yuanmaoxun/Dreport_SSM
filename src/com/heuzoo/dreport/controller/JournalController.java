package com.heuzoo.dreport.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.heuzoo.dreport.pojo.JournalInfo;
import com.heuzoo.dreport.pojo.Journal_CheckSum;
import com.heuzoo.dreport.pojo.Json_Journal;
import com.heuzoo.dreport.pojo.View_Journal;
import com.heuzoo.dreport.service.JournalService;
import com.heuzoo.dreport.service.WorkgroupService;
import com.sun.org.apache.xpath.internal.operations.Mod;

/**
 * @author  袁茂洵
 * @project dreport
 * @date 	2017-2-23 15:25:23
 * @ 新建Journal处理日报有关任务
 */

@Controller
@RequestMapping("/journalController")
public class JournalController {
	 /**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 15:32:30
	 * @获取JournalId，根据JournalId来修改日报审核状态为通过
	 */
	@Autowired
	private JournalService journalService;
	@Autowired
	private WorkgroupService workgroupService;
	@RequestMapping("/journalAllowed")
	public ModelAndView updateJournalStateIsAllowed(HttpServletRequest request,int jourid){
		int emWorkgroupId = Integer.parseInt(request.getSession().getAttribute("userGroupId").toString());
		int empType = Integer.parseInt(request.getSession().getAttribute("userType").toString());
		ModelAndView modelAndView = new ModelAndView();
		int result = journalService.updateJournalStateIsAllowedsById(jourid);
		if(result>0 && empType==2){
			String members = workgroupService.queryWgMembersById(emWorkgroupId);
			/* Json串解析 */
			Type listType = new TypeToken<List<Json_Journal>>() {
			}.getType();
			List<Json_Journal> resultList = new Gson().fromJson(members,
					listType);
			List<Integer> empIdList = new ArrayList<Integer>();
			for (int i = 0; i < resultList.size(); i++) {
				Json_Journal jsonJournal = resultList.get(i);
				empIdList.add(Integer.parseInt(jsonJournal.getId()));
			}
			List<View_Journal> journalList = journalService
					.queryJournalInfoWithNoStateById(empIdList);
			modelAndView.addObject("journalList", journalList);
			modelAndView.setViewName("checkJournal");
			return modelAndView;
		}
		else if(result>0 && empType==3){
			List<View_Journal> journalList = journalService.queryJournalInfoWithNoStateType();
			modelAndView.addObject("journalList", journalList);
			modelAndView.setViewName("checkJournal");
			return modelAndView;
		}
			
		else{ 
			modelAndView.setViewName("updateFailed");
			return modelAndView;
		}
	}
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 17:08:13
	 * @获取JournalId，根据JournalId来修改日报审核状态为未通过
	 */
	@RequestMapping("journalUnallowed")
	public ModelAndView updateJournalStateIsUnallowed(HttpServletRequest request,int jourid) {
		int emWorkgroupId = Integer.parseInt(request.getSession().getAttribute("userGroupId").toString());
		int empType = Integer.parseInt(request.getSession().getAttribute("userType").toString());
		ModelAndView modelAndView = new ModelAndView();
		int result = journalService.updateJournalStateIsUnallowedById(jourid);
		if(result>0 && empType==2){
			String members = workgroupService.queryWgMembersById(emWorkgroupId);
			/* Json串解析 */
			Type listType = new TypeToken<List<Json_Journal>>() {
			}.getType();
			List<Json_Journal> resultList = new Gson().fromJson(members,
					listType);
			List<Integer> empIdList = new ArrayList<Integer>();
			for (int i = 0; i < resultList.size(); i++) {
				Json_Journal jsonJournal = resultList.get(i);
				empIdList.add(Integer.parseInt(jsonJournal.getId()));
			}
			List<View_Journal> journalList = journalService
					.queryJournalInfoWithNoStateById(empIdList);
			modelAndView.addObject("journalList", journalList);
			modelAndView.setViewName("checkJournal");
			return modelAndView;
		}
		else if(result>0 && empType==3){
			List<View_Journal> journalList = journalService.queryJournalInfoWithNoStateType();
			modelAndView.addObject("journalList", journalList);
			modelAndView.setViewName("checkJournal");
			return modelAndView;
		}
		else{ 
			modelAndView.setViewName("updateFailed");
			return modelAndView;
		}
	}
	/**
	 * @author	齐彤
	 * @time	上午11:18:08
	 * @project	dreport1
	 * @todo	实现根据名字查询日报信息并统计工作量
	 */
		@Autowired
		private JournalService journalservice;
		
		@RequestMapping("/queryJournalInfoByName")
		public ModelAndView queryJournalInfoByTage(HttpServletRequest request){
			//调用service查找数据库，查询日报信息 
			List<Journal_CheckSum> journalinfo = new ArrayList<Journal_CheckSum>();
			journalinfo = journalservice.queryJournalInfoByName();
			//相当 于request的setAttribut，在jsp页面中通过journalinfo取数据
			ModelAndView modelandview =new ModelAndView();
			modelandview.addObject("journalinfo",journalinfo);
			
			modelandview.setViewName("journalListByName");
			
			return modelandview;
			
		}
		/**
		 * @author  袁茂洵
		 * @project dreport
		 * @date 	2017-2-25 13:14:24
		 * @todo 查询审核状态为通过和不通过的  返回两个list
		 */
		@RequestMapping("/queryJournalInfoByState")
		public ModelAndView queryJournalInfoByState(HttpServletRequest request){
			ModelAndView modelAndView = new ModelAndView();
			List<View_Journal> journalListUnallowed = journalservice.queryJournalInfoWithStateUnallowed();
			List<View_Journal> journalListAllowed = journalservice.queryJournalInfoWithStateAllowed();
			modelAndView.addObject("journalListUnallowed",journalListUnallowed);
			modelAndView.addObject("journalListAllowed",journalListAllowed);
			modelAndView.setViewName("journalListByState");
			return modelAndView;
		}
		/**
		 * @author  袁茂洵
		 * @throws IOException 
		 * @project dreport
		 * @date 	2017-2-26 9:44:24
		 * @todo 填写日报功能
		 */
		@RequestMapping("/addJournal")
		public ModelAndView addJournalInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
			ModelAndView modelAndView = new ModelAndView();
			int empId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
			Date jourSubmitTime = new Date();
			int joursubmitPerson= Integer.parseInt(request.getSession().getAttribute("userId").toString());
			int jourProjectId = Integer.parseInt(request.getParameter("proId"));
			int stage = Integer.parseInt(request.getParameter("jourCurrStage"));
			
			int jourCurrStage = stage;
			int jourState = 0;
			int jourOvertimeWork = Integer.parseInt(request.getParameter("jourOvertimeWork"));
			int jourWorkload = Integer.parseInt(request.getParameter("jourWorkload"));
			String jourTask = request.getParameter("jourTask");
			int jourEnable = 1;
			JournalInfo journalInfo = new JournalInfo();
			journalInfo.setJourSubmitTime(jourSubmitTime);
			journalInfo.setJoursubmitPerson(joursubmitPerson);
			journalInfo.setJourProjectId(jourProjectId);
			journalInfo.setJourcurrStage(jourCurrStage);
			journalInfo.setJourState(jourState);
			journalInfo.setJourOvertimeWork(jourOvertimeWork);
			journalInfo.setJourWorkload(jourWorkload);
			journalInfo.setJourTask(jourTask);
			journalInfo.setJourEnable(jourEnable);
			boolean result = journalservice.addJournal(journalInfo);
			List<View_Journal> journalList = journalService.queryJournalInfoIsMeAll(empId);
			
			if (result) {
				modelAndView.addObject("journalList",journalList);
				modelAndView.setViewName("journalListOnlySelf");
			}
			else{
				modelAndView.setViewName("addFailed");
			}
			
			return modelAndView;
		}
}
