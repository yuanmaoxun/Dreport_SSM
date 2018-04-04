package com.heuzoo.dreport.controller;

import java.io.OutputStream;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.heuzoo.dreport.pojo.EmployeeInfo;
import com.heuzoo.dreport.pojo.Journal_CheckSum;
import com.heuzoo.dreport.pojo.Json_Journal;
import com.heuzoo.dreport.pojo.ProjectsInfo;
import com.heuzoo.dreport.pojo.WorkgroupInfo;
import com.heuzoo.dreport.service.EmployeeService;
import com.heuzoo.dreport.service.JournalService;

import com.heuzoo.dreport.service.ProjectsService;
import com.heuzoo.dreport.service.WorkgroupService;

/**
 * @author	刘敏
 * @time	2017-2-24 下午05:18:10
 * @project	dreport
 * @todo	日报设定
 */
/**
 * @author	齐彤
 * @time	上午11:48:38
 * @project	dreport1
 * @todo	查找数据库中都有哪些项目
 */

@Controller
@RequestMapping("/projectsController")
public class ProjectsController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private WorkgroupService workgroupService;
	@Autowired
	private ProjectsService projectsService;
	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-24 下午05:18:07
	 * @description 查询可选员工
	 */
	@RequestMapping("/queryEmployee")
	public void queryEmployee(HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<EmployeeInfo> resultEmployeeInfo=employeeService.queryEmployeeByGroup();
		Gson resultJson = new Gson();
		String result = resultJson.toJson(resultEmployeeInfo);
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(result.getBytes("UTF-8"));
		outputStream.close();
	}
	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-26 下午12:15:22
	 * @description 查询可选组长
	 */
	@RequestMapping("/queryEmployer")
	public void queryEmployer(HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<EmployeeInfo> resultEmployeeInfo=employeeService.queryEmployerByGroup();
		Gson resultJson = new Gson();
		String result = resultJson.toJson(resultEmployeeInfo);
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(result.getBytes("UTF-8"));
		outputStream.close();
	}
	/**
	 * @author 刘敏
	 * @project dreport
	 * @date 2017-2-24 下午05:18:07
	 * @description 注册工作组
	 */
	@RequestMapping("/sign-up-workgroup")
	public void createWorkGroup(HttpServletRequest request, HttpServletResponse response, String groupName, String remarks, String leader, String members) throws Exception {
        WorkgroupInfo wgInfo = new WorkgroupInfo();
        wgInfo.setWgName(groupName);
        wgInfo.setWgRemarks(remarks);
        wgInfo.setWgLeaderId(Integer.parseInt(leader));
        wgInfo.setWgMembers(members);
		System.out.println("-----------------------"+wgInfo.getWgName()+"-----------------------");
		int result = workgroupService.insertWorkgroup(wgInfo);
		OutputStream outputStream = response.getOutputStream();
		outputStream.write((""+result).getBytes());
		outputStream.close();
		System.out.println("result = " + result);
		EmployeeInfo empInfo = new EmployeeInfo();
		empInfo.setEmpWorkgroupId(result);
		empInfo.setEmpId(Integer.parseInt(leader));
		employeeService.updateEmpolyeeWorkgroupId(empInfo);
		Type listType = new TypeToken<List<Json_Journal>>() {}.getType();
		List<Json_Journal> resultList = new Gson().fromJson(members, listType);
		for (int i = 0; i < resultList.size(); i++) {
			Json_Journal jsonJournal = resultList.get(i);
			System.out.println("added:" + jsonJournal.getId());
			empInfo.setEmpId(Integer.parseInt(jsonJournal.getId()));
			employeeService.updateEmpolyeeWorkgroupId(empInfo);
		}
	}
	
	@RequestMapping("/sign-up-project")
	public ModelAndView createProject(HttpServletRequest request, String proName, String startTime, String endTime, String workgroup, String prpStage) throws ParseException {
		System.out.println("proName   = " + proName);
		System.out.println("startTime = " + startTime);
		System.out.println("endTime   = " + endTime);
		System.out.println("workgroup = " + workgroup);
		System.out.println("prpStage  = " + prpStage);
		ProjectsInfo proInfo = new ProjectsInfo();
		DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
		Date startDate = df.parse(startTime);
		Date endDate = df.parse(endTime);
		proInfo.setProName(proName);
		proInfo.setProStartTime(startDate);
		proInfo.setProEndTime(endDate);
		proInfo.setProParticipateWg(Integer.parseInt(workgroup));
		proInfo.setProPrpStage(prpStage);
		projectsService.insertProjectsInfo(proInfo);
		return null;
	}
	/**
	 * @author	齐彤
	 * @time	上午11:48:38
	 * @project	dreport1
	 * @todo	查找数据库中都有哪些项目
	 */
	@Autowired
	private ProjectsService projectservice;
	
	
	@RequestMapping("/querypro")
	public ModelAndView queryPro(HttpServletRequest request){
		
		List<ProjectsInfo> pro=new ArrayList<ProjectsInfo>();
		pro=projectservice.queryPro();
		
		ModelAndView modelandview=new ModelAndView();
		modelandview.addObject("pro",pro);
		
		modelandview.setViewName("journalListByPro");
		
		
		return modelandview;
		
	}
	/**
	 * @author	齐彤
	 * @time	上午11:48:38
	 * @project	dreport1
	 * @todo	查找数据库中都有哪些项目名查日报信息
	 */
	@Autowired
	private JournalService journalservice;
	
	@RequestMapping("/queryjournalinfo")
	public ModelAndView queryjournalinfo(HttpServletRequest request, String project){
		System.out.println("project:"+project);
		List<Journal_CheckSum> journal=new ArrayList<Journal_CheckSum>();
		journal = journalservice.queryJournalInfoByPro(project);
		for(Journal_CheckSum i: journal) {
			System.out.println(i.getAccept());
		}
		
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("journalbypro",journal);
		
		modelandview.setViewName("journalListByPro");
		

		List<ProjectsInfo> pro=new ArrayList<ProjectsInfo>();
		pro=projectservice.queryPro();
		

		modelandview.addObject("pro",pro);
		
		modelandview.setViewName("journalListByPro");
		
		
		return modelandview;
		
	
		
	}

}
