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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.heuzoo.dreport.pojo.EmployeeInfo;
import com.heuzoo.dreport.pojo.Json_Journal;
import com.heuzoo.dreport.pojo.View_Employee;
import com.heuzoo.dreport.pojo.View_Journal;
import com.heuzoo.dreport.service.EmployeeService;
import com.heuzoo.dreport.service.JournalService;
import com.heuzoo.dreport.service.MainFrameService;
import com.heuzoo.dreport.service.WorkgroupService;
import com.heuzoo.dreport.common.CaptchaUtils;

/**
 * @author 高冬岩
 * @Time 2017.2.22 14:39:35
 * @todo 当前模块的任务，作用
 */
@Controller
@RequestMapping("/employeeController")
public class EmployeeController {

	private final int MANAGER = 3;
	private final int GROUPMAN = 2;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MainFrameService mainFrameService;
	/**
	 * @author 高冬岩
	 * @time 2017-2-22 下午04:30:22
	 * @project dreport
	 * @return ModelAndView
	 * @throws null
	 * @params HttpServletRequest, String, String
	 * @todo 完成登录校验及登录时期的数据库存储操作
	 */
	@RequestMapping("/handlerLogin")
	public ModelAndView handlerLogin(HttpServletRequest request, String userNum, String password, String capTcha) {
		System.out.println(userNum);
		System.out.println(password);
		Date date = new Date();
		//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String time = dateFormat.format(date);
		EmployeeInfo resultEmployeeInfo = employeeService.queryEmployeeByNumAndPwd(userNum, password);
		if (resultEmployeeInfo == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("loginFailed");
			return mav;
		}
		int judge = employeeService.updateEmployeeLastLoginTime(userNum, date);
		if (judge == 0) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("loginFailed");
			return mav;
		}
		String getedFromSession = (String) request.getSession(true).getAttribute("randomString");
		if(!getedFromSession.equals(capTcha)) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("loginFailed");
			return mav;
		}
		request.getSession().setAttribute("nowEmployeeCount", mainFrameService.getEmployeeCount());
		request.getSession().setAttribute("nowJournalCount", mainFrameService.getJournalCount());
		request.getSession().setAttribute("nowProjectCount", mainFrameService.getProjectCount());
		request.getSession().setAttribute("nowWorkgroupCount", mainFrameService.getWorkgroupCount());
		request.getSession().setAttribute("userName",resultEmployeeInfo.getEmpUsername());
		request.getSession().setAttribute("userId",resultEmployeeInfo.getEmpId());
		request.getSession().setAttribute("userNum",resultEmployeeInfo.getEmpNum());
		request.getSession().setAttribute("userType",resultEmployeeInfo.getEmpType());
		request.getSession().setAttribute("userGroupId",resultEmployeeInfo.getEmpWorkgroupId());
		request.getSession().setAttribute("userLastLoginTime", resultEmployeeInfo.getEmpLastlogin());
		ModelAndView mav = new ModelAndView();
		mav.addObject("name", request.getSession().getAttribute("userName"));
		mav.addObject("type", request.getSession().getAttribute("userType"));
		mav.addObject("lastlogintime", request.getSession().getAttribute("userLastLoginTime"));
		mav.setViewName("index");
//		mav.setViewName("test");
		return mav;
	}
	
	/**
	 * @author 高冬岩
	 * @time 2017-2-22 下午04:30:22
	 * @project dreport
	 * @return ModelAndView
	 * @throws null
	 * @params String, String, String, String
	 * @todo 完成用户信息插入
	 */
	@RequestMapping("/addEmployeeInfo")
	public String addEmployeeInfo(String employeeNum, String employeeName, String employeePwd, String confirmPwd, String employeeType) {
		EmployeeInfo employeeInfo = new EmployeeInfo();
		Date date = new Date();
		System.out.println(employeeNum);
		System.out.println(employeeName);
		System.out.println(employeePwd);
		System.out.println(employeeType);
		employeeInfo.setEmpLastlogin(date);
		employeeInfo.setEmpNum(employeeNum);
		employeeInfo.setEmpUsername(employeeName);
		employeeInfo.setEmpPassword(employeePwd);
		employeeInfo.setEmpType(Integer.parseInt(employeeType));
		int result = employeeService.insertEmployeeInfo(employeeInfo);
		if(result == 0) {
			return "addFailed";
		}
		return "redirect:/employeeController/queryEmployee.action";
	}
	
	/**
	 * @author 高冬岩
	 * @time 2017-2-23 下午07:20:22
	 * @project dreport
	 * @return void
	 * @throws null
	 * @params HttpServletRequest, HttpServletResponse
	 * @todo 完成验证码的生成及显示
	 */
	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CaptchaUtils.outputCaptcha(request, response);
	}

	/**
	 * @author 叶金幸
	 * @time 2017-2-22 下午06:53:39
	 * @project dreport
	 * @return void
	 * @throws IOException
	 * @params
	 * @todo 完成AJAX请求，输出流打出消息内容，否则不打
	 */
	@RequestMapping("/updateNotice")
	public void handlerGetNotice(String userId, HttpServletResponse response)
			throws IOException {
		OutputStream outputStream = response.getOutputStream();
		System.out.println(userId);
		// 写业务逻辑补充后端过来的提示信息，并修改相应字段
		String result = "test," + userId;
		outputStream.write(result.getBytes());
		outputStream.close();
	}

	/**
	 * @author 袁茂洵
	 * @time 2017-2-22 下午07:45:23
	 * @project dreport
	 * @todo 判断用户类别，根据类别返回相应的日报结果
	 */
	@Autowired
	private JournalService journalService;
	@Autowired
	private WorkgroupService workgroupService;

	@RequestMapping("/checkJournal")
	public ModelAndView checkEmployeeType(HttpServletRequest request) {
		int type = Integer.parseInt(request.getSession().getAttribute(
				"userType").toString());
		int emWorkgroupId = Integer.parseInt(request.getSession()
				.getAttribute("userGroupId").toString());
		ModelAndView modelAndView = new ModelAndView();
		switch (type) {
		case GROUPMAN: {
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
		case MANAGER: {
			List<View_Journal> journalList = journalService.queryJournalInfoWithNoStateType();
			modelAndView.addObject("journalList", journalList);
			modelAndView.setViewName("checkJournal");
			return modelAndView;
		}
		default:
			return modelAndView;
		}
	}
	/**
	 * @author 袁茂洵
	 * @time 2017-2-26 9:50:30
	 * @project dreport
	 * @todo 查询用户的和项目的相关信息
	 */
	@RequestMapping("/prepareJournal")
	public ModelAndView queryEmployeeAndProjects(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		int empId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		View_Journal viewJournal = journalService.queryViewJournalInfoById(empId);
		String nameString = viewJournal.getProPrpStage();
		Type listType = new TypeToken<List<Json_Journal>>() {
		}.getType();
		List<Json_Journal> resultList = new Gson().fromJson(nameString,listType);
		List<String> empNameList = new ArrayList<String>();
		for (int i = 0; i < resultList.size(); i++) {
			Json_Journal jsonJournal = resultList.get(i);
			empNameList.add(jsonJournal.getName());
		}/*：1 代表普通员工、2 代表组长、3 代表经理、4 代表日志管理员、5 代表人事管理员*/
		String empType = null;
		if(viewJournal.getEmpType() == 1)
			empType = "普通员工";
		else if(viewJournal.getEmpType() == 2)
			empType = "组长";
		else if(viewJournal.getEmpType() == 3)
			empType = "经理";
		else if(viewJournal.getEmpType() == 4)
			empType = "日志管理员";
		else {
			empType = "人事管理员";
		}
		modelAndView.addObject("empType",empType);
		modelAndView.addObject("empNameList",empNameList);
		modelAndView.addObject("viewJournal",viewJournal);
		modelAndView.setViewName("addJournal");
		return modelAndView;
	}
	/**
	 * @author 袁茂洵
	 * @time 2017-2-27 9:49:50
	 * @project dreport
	 * @todo 查询自己的日报信息
	 */
	@RequestMapping("/queryJournalIsMe")
	public ModelAndView queryJournalInfoIsMe(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		int empId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		List<View_Journal> journalList = journalService.queryJournalInfoIsMeAll(empId);
		modelAndView.addObject("journalList",journalList);
		modelAndView.setViewName("journalListOnlySelf");
		return modelAndView;
	}
	/**
	 * @author 岳盈
	 * @time 2017-2-23
	 * @project dreport
	 * TODO 返回用户信息
	 */
	@RequestMapping("/queryEmployee")
	public ModelAndView queryItems(HttpServletRequest request) throws Exception{
		


		List<View_Employee> employeeList;
		employeeList = employeeService.queryEmployeeInfoByName();


		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.addObject("employeeList", employeeList);
		modelAndView.setViewName("EmployeeQuery");
		
		return modelAndView;
	}
	
	/**
	 * @author 刘敏
	 * @time 2017-2-27
	 * @project dreport
	 * TODO 修改用户信息
	 */
	@RequestMapping("/updateEmployee")
	public ModelAndView updateEmployee(HttpServletRequest request, String empId, String empName, String empNum) throws Exception {
		EmployeeInfo empInfo = new EmployeeInfo();
		empInfo.setEmpId(Integer.parseInt(empId));
		empInfo.setEmpUsername(empName);
		empInfo.setEmpNum(empNum);
		employeeService.updateEmployeeInfoById(empInfo);
		System.out.println(empId);
		System.out.println(empName);
		System.out.println(empNum);
		return null;
	}	
}
