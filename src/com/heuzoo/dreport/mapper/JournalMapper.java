package com.heuzoo.dreport.mapper;

import java.util.List;

import com.heuzoo.dreport.pojo.Intradayproject;
import com.heuzoo.dreport.pojo.JournalInfo;
import com.heuzoo.dreport.pojo.Journal_CheckSum;
import com.heuzoo.dreport.pojo.View_Journal;


/**
 * @author  袁茂洵
 * @project dreport
 * @date 	2017-2-22 20:20:12
 * 完成对Journal表的数据库操作
 */


public interface JournalMapper {
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-22 20:21:45
	 * 根据用户Id查询所有未审核的日报信息
	 */
	public List<View_Journal> queryJournalInfoWithNoStateById(List<Integer> empIdList);
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 13:40:30
	 * 根据用户类别查询所有未审核的日报信息
	 */
	public List<View_Journal> queryJournalInfoWithNoStateType();
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-23 下午03:29:15
	 * @return	List<View_Journal>
	 * @todo	获得当天的项目列表
	 */
	public List<View_Journal> queryIntradayJournals(String Intraday);
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 16:26:30
	 * @ 实现根据日报Id修改未审核的日报信息为通过
	 */
	public int updateJournalStateIsAllowedsById(int jourId);
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-23 16:26:30
	 * @ 实现根据日报Id修改未审核的日报信息为不通过
	 */
	public int updateJournalStateIsUnallowedById(int jourId);
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-24 10:26:59
	 * @ 根据用户姓名，工号，审核状态的日报列表
	 */
	public List<View_Journal> queryJournalWithEmpnameOrEmpnumOrJourstate(View_Journal vJounal);
	
	
	/**
	 * @author	叶金幸
	 * @time	2017-2-24 下午12:06:28
	 * @project	dreport
	 * @return	List<View_Journal>
	 * @params	包含String:今天日期，int：项目ID
	 * @todo	获得今天某个项目的所有提交日报记录
	 */
	public List<View_Journal> queryIntradayJournalsByProject(Intradayproject intradayproject);

	/**
	 * @author	齐彤
	 * @time	下午03:47:37
	 * @project	dreport
	 * @todo	按人员分类查询日报信息人员姓名项目名称
	 */
	public List<Journal_CheckSum> queryJournalInfoByName();
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-25 13:31:22
	 * @todo 查询所有审核通过的日报信息
	 */
	public List<View_Journal>queryJournalInfoWithStateAllowed();
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-25 13:33:35
	 * @todo 查询所有审核未通过的日报信息
	 */
	public List<View_Journal>queryJournalInfoWithStateUnalowed();
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-26 11:23:35
	 * @todo 通过员工Id查询project和employee信息
	 */
	public View_Journal queryViewJournalInfoById(int empId);
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-26 13:40:21
	 * @todo 添加journal信息
	 */
	public int addJournalInfo(JournalInfo journalInfo);
	/**
	 * @author  袁茂洵
	 * @project dreport
	 * @date 	2017-2-27 10:10:21
	 * @todo查询自己的日报信息
	 */
	public List<View_Journal> queryJournalInfoIsMeAll(int empId);
	/**
	 * @author 齐彤
	 * @return	日報信息
	 * @param	項目名稱
	 * @todo	根據項目名稱查日報
	 */
	public List<Journal_CheckSum> queryJournalInfoByPro(String proName);
	
	/**
	 * @author	叶金幸
	 * @time	2017-3-1 上午09:25:29
	 * @project	dreport
	 * @return	List<View_Journal>
	 * @todo	找到所有Journal并结合Employee表以view_journal形式返回
	 */
	public List<View_Journal> getAllViewjournal();
}
