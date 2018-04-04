package com.heuzoo.dreport.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heuzoo.dreport.mapper.JournalMapper;
import com.heuzoo.dreport.pojo.JournalInfo;
import com.heuzoo.dreport.pojo.Journal_CheckSum;
import com.heuzoo.dreport.pojo.View_Journal;
import com.heuzoo.dreport.service.JournalService;

/**
 * @author 袁茂洵
 * @Time   2017.2.22 20:06:30
 * @todo   JournalService的实现类
 * @params 
 */

@Service("journalService")
public class JournalServiceImpl implements JournalService{
	
	@Autowired
	private JournalMapper journalMapper;
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 13:42:42
	 * @ 实现根据empId查询所有未审核组员日报
	 */
	@Override
	public List<View_Journal> queryJournalInfoWithNoStateById(
			List<Integer> empIdList) {
		// TODO Auto-generated method stub
		return (List<View_Journal>) journalMapper.queryJournalInfoWithNoStateById(empIdList);
	}
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-22 20:08:22
	 * @ 实现根据empType查询所有未审核组长日报
	 */
	@Override
	public List<View_Journal> queryJournalInfoWithNoStateType() {
		// TODO Auto-generated method stub
		return journalMapper.queryJournalInfoWithNoStateType();
	}
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 16:26:30
	 * @ 实现根据日报Id修改未审核的日报信息为通过
	 */
	@Override
	public int updateJournalStateIsAllowedsById(int jourId) {
		
		return journalMapper.updateJournalStateIsAllowedsById(jourId);
	}
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 16:26:30
	 * @ 实现根据日报Id修改未审核的日报信息为不通过
	 */
	@Override
	public int updateJournalStateIsUnallowedById(int jourId) {
		
		return journalMapper.updateJournalStateIsUnallowedById(jourId);
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
	 * @author	袁茂洵
	 * @time	2017-2-24 10:25:44
	 * @todo	根据用户姓名，工号，审核状态的日报列表实现类
	 */
	@Override
	public List<View_Journal> queryJournalWithEmpnameOrEmpnumOrJourstate(
			String empNum, String empUsername, int jourState) {
		View_Journal viewJournal = new View_Journal();
		if(jourState != -1){
			viewJournal.setJourState(jourState);
		}
		viewJournal.setEmpNum(empNum);
		viewJournal.setEmpUsername(empUsername);
		
		return journalMapper.queryJournalWithEmpnameOrEmpnumOrJourstate(viewJournal);
	}
	/**
	 * @author	齐彤
	 * @time	下午03:56:21
	 * @project	dreport
	 * @todo	调用方法查数据库并返回list
	 */
	public List<Journal_CheckSum> queryJournalInfoByName (){
		
	/*	Journal_CheckSum checksum=new Journal_CheckSum();*/
		
		return (List<Journal_CheckSum>) journalMapper.queryJournalInfoByName();
		
	}
	/**
	 * @author	袁茂洵
	 * @time	2017-2-25 13:29:44
	 * @todo	根据审核状态为通过的日报列表实现类
	 */
	@Override
	public List<View_Journal> queryJournalInfoWithStateAllowed() {
		
		return journalMapper.queryJournalInfoWithStateAllowed();
	}
	/**
	 * @author	袁茂洵
	 * @time	2017-2-25 10:29:54
	 * @todo	根据审核状态为未通过的日报列表实现类
	 */
	@Override
	public List<View_Journal> queryJournalInfoWithStateUnallowed() {
		
		return journalMapper.queryJournalInfoWithStateUnalowed();
	}
	/**
	 * @author	袁茂洵
	 * @time	2017-2-25 11:21:45
	 * @project	dreport
	 * @todo	通过员工Id查询project和employee信息
	 */
	@Override
	public View_Journal queryViewJournalInfoById(int empId) {
		// TODO Auto-generated method stub
		return journalMapper.queryViewJournalInfoById(empId);
	}
	/**
	 * @author	袁茂洵
	 * @time	2017-2-26 13:39:42
	 * @project	dreport
	 * @todo	添加Journal信息
	 */
	@Override
	public boolean addJournal(JournalInfo journalInfo) {
		int result = journalMapper.addJournalInfo(journalInfo);
		if (result > 0) {
			return true;
		}
		else 
			return false;
	}
	/**
	 * @author	袁茂洵
	 * @time	2017-2-27 10:08:12
	 * @project	dreport
	 * @todo	查询自己的日报信息的实现类
	 */
	@Override
	public List<View_Journal> queryJournalInfoIsMeAll(int empId) {
		// TODO Auto-generated method stub
		return journalMapper.queryJournalInfoIsMeAll(empId);
	}
	/**
	 * @author	齐彤
	 * @time	2017-2-26 12:42:33
	 * @project	dreport
	 * @todo	按项目查询日报信息的实现类
	 */
	public List<Journal_CheckSum> queryJournalInfoByPro(String proName) {
		return (List<Journal_CheckSum>) journalMapper.queryJournalInfoByPro(proName);
	
	}
}
