package com.heuzoo.dreport.mapper;

import java.util.List;

import com.heuzoo.dreport.pojo.NoticemessageInfo;

/**
 * @author	叶金幸
 * @name	dreport	
 * @Time	2017-2-23 上午11:54:58 
 * Description	mapper，查提醒历史记录表
 * @version
 */
public interface NoticemessageMapper {
	//获取所有提醒信息
	public List<NoticemessageInfo> queryAllNoticemessage();
	//插入一条提醒信息
	public int insertNoticemessage(NoticemessageInfo noticemessageInfo);
	//获取指定ID的一条提醒信息
	public NoticemessageInfo getNoticemessageById(int nmId);
	//根据这个传入对象的ID改其他字段。
	public int updateNoticemessageInfo(NoticemessageInfo noticemessageInfo);
	//获取某个指定用户的消息记录
	public List<NoticemessageInfo> queryNoticemessageByUser(int userId);
}
