package com.heuzoo.dreport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 高冬岩
 * @Time   2017年2月27日 上午10:23:59
 * @todo   该模块用于用户权限控制，作为进入具体模块的入口
 */

@Controller
@RequestMapping("/authority")
public class AuthorityController {
	/**
	 * @author 高冬岩
	 * 此函数用于日报设定的权限控制
	 * */
	@RequestMapping("/journalSignup")
	public String journalSignup(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 4) {
			return "sign_up_izard";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于撰写日报的权限控制
	 * */
	@RequestMapping("/writeJournal")
	public String writeJournal(HttpServletRequest request){
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s <= 2) {
			return "redirect:/employeeController/prepareJournal.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于查看日报的权限控制
	 * */
	@RequestMapping("/queryJournal") 
	public String queryJournal(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s <= 2) {
			return "redirect:/employeeController/queryJournalIsMe.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于日报审核的权限控制
	 * */
	@RequestMapping("/checkJournal")
	public String checkJournal(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 2 || s == 3) {
			return "redirect:/employeeController/checkJournal.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于根据人员统计查询的权限控制
	 * */
	@RequestMapping("/countByPerson")
	public String countByPerson(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 3) {
			return "redirect:/journalController/queryJournalInfoByName.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于根据项目统计查询的权限控制
	 * */
	@RequestMapping("/countByProject")
	public String countByProject(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 3) {
			return "redirect:/projectsController/querypro.action";
		}
		return "accessDeny";
	}
	
	 /**
	 * @author 高冬岩
	 * 此函数用于根据审核统计查询的权限控制
	 * */
	@RequestMapping("/countByCheck")
	public String countByCheck(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 3) {
			return "redirect:/journalController/queryJournalInfoByState.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于发送提醒的权限控制
	 * */
	@RequestMapping("/sendNotice")
	public String sendNotice(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 4) {
			return "redirect:/noticemessageController/prepareProjectsList.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于发送消息的权限控制
	 * */
	@RequestMapping("/sendMessage")
	public String sendMessage(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 4) {
			return "redirect:/noticemessageController/prepareWorkgroupList.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于查看消息历史的权限控制
	 * */
	@RequestMapping("/messageHistory")
	public String messageHistory(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 4) {
			return "redirect:/noticemessageController/prepareHistory.action";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于雇员信息添加的权限控制
	 * */
	@RequestMapping("/addEmployee")
	public String addEmployee(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 5) {
			return "addEmployee";
		}
		return "accessDeny";
	}
	
	/**
	 * @author 高冬岩
	 * 此函数用于雇员信息查询的权限控制
	 * */
	@RequestMapping("/queryEmployee")
	public String queryEmployee(HttpServletRequest request) {
		if(request.getSession().getAttribute("userType") == null)
			return "sessionFailed";
		int s = (Integer)request.getSession().getAttribute("userType");
		if(s == 5) {
			return "redirect:/employeeController/queryEmployee.action";
		}
		return "accessDeny";
	}
}
