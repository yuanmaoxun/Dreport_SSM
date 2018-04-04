package com.heuzoo.dreport.service;

import java.util.List;

import com.heuzoo.dreport.pojo.JournalInfo;
import com.heuzoo.dreport.pojo.Journal_CheckSum;
import com.heuzoo.dreport.pojo.View_Journal;

/**
 * @author  袁茂洵
 * @project dreport
 * @date 	2017-2-22 19:52:36
 * @todo  处理Journal有关的业务逻辑
 */

public interface JournalService {
	/**
	 * Create Date:2017.2.22 19:57
	 * @author 袁茂洵
	 * 用于根据用户Id查询所有未审核的员工日报信息
	 * */
	public List<View_Journal> queryJournalInfoWithNoStateById(List<Integer> empIdList);
	/**
	 * Create Date:2017.2.23 13:08
	 * @author 袁茂洵
	 * 用于根据用户类别查询所有未审核的组长日报信息
	 * */
	public List<View_Journal> queryJournalInfoWithNoStateType();
	/**
	 * Create Date:2017.2.23 16:23:42
	 * @author 袁茂洵
	 * 用于根据日报Id修改未审核的日报信息为通过
	 * */
	public int updateJournalStateIsAllowedsById(int jourId);
	/**
	 * Create Date:2017.2.23 16:23:42
	 * @author 袁茂洵
	 * 用于根据日报Id修改未审核的日报信息为不通过
	 * */
	public int updateJournalStateIsUnallowedById(int jourId);
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午03:29:15
	 * @return	List<View_Journal>
	 * @todo	获得当天的项目列表
	 */
	public List<View_Journal> queryIntradayJournals();
	/**
	 * @author	袁茂洵
	 * @time	2017-2-24 10:21:38
	 * @todo	获得根据用户姓名，工号，审核状态的日报列表
	 */
	public List<View_Journal> queryJournalWithEmpnameOrEmpnumOrJourstate(String empNum,String empUsername,int jourState);
	/**
	 * @author	齐彤
	 * @time	下午03:54:37
	 * @project	dreport
	 * @todo	获取用户姓名，工号，以及所提交日报信息
	 */
	public List<Journal_CheckSum> queryJournalInfoByName();
	/**
	 * @author	袁茂洵
	 * @time	2017-2-25 13:23:38
	 * @project	dreport
	 * @todo	获取未通过员工的日报信息
	 */
	public List<View_Journal> queryJournalInfoWithStateUnallowed();
	/**
	 * @author	袁茂洵
	 * @time	2017-2-25 13:23:38
	 * @project	dreport
	 * @todo	获取通过员工的日报信息
	 */
	public List<View_Journal> queryJournalInfoWithStateAllowed();
	/**
	 * @author	袁茂洵
	 * @time	2017-2-25 11:21:23
	 * @project	dreport
	 * @todo	通过员工Id查询project和employee信息
	 */
	public View_Journal queryViewJournalInfoById(int empId);
	/**
	 * @author	袁茂洵
	 * @time	2017-2-26 13:37:42
	 * @project	dreport
	 * @todo	插入Journal信息
	 */
	public boolean addJournal(JournalInfo journalInfo);
	/**
	 * @author	袁茂洵
	 * @time	2017-2-27 10:07:23
	 * @project	dreport
	 * @todo	查询自己日报信息
	 */
	public List<View_Journal> queryJournalInfoIsMeAll(int empId);
	/**
	 * @author	齐彤
	 * @time	2017-2-26 14:40:12
	 * @project	dreport
	 * @todo	查询自己日报信息
	 */
	public List<Journal_CheckSum> queryJournalInfoByPro(String proName);
}

