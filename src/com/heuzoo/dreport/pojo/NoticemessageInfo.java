package com.heuzoo.dreport.pojo;

import java.util.Date;

/**
 * @author  yuanmaoxun
 * @project dreport
 * @date 	2017-2-22
 * @ForTable 通知消息表
 */
public class NoticemessageInfo {
	public static final int STATE_UNREAD = 1;
	public static final int STATE_READ = 2;
	public static final int STATE_RESENDED = 3;
	
	private int nmId;					//通知消息表
	private int nmFromUserId;			//发送通知的人
	private int nmToUserId;				//接受通知的人
	private int nmState;				//消息状态̬
	private String nmMessageContent;	//消息内容
	private int nmRank;					//提醒等级
	private int nmEnable;				//标记消息状态
	private Date nmTime;				//消息发送时间
	public Date getNmTime() {
		return nmTime;
	}
	public void setNmTime(Date nmTime) {
		this.nmTime = nmTime;
	}
	public int getNmId() {
		return nmId;
	}
	public void setNmId(int nmId) {
		this.nmId = nmId;
	}
	public int getNmFromUserId() {
		return nmFromUserId;
	}
	public void setNmFromUserId(int nmFromUserId) {
		this.nmFromUserId = nmFromUserId;
	}
	public int getNmToUserId() {
		return nmToUserId;
	}
	public void setNmToUserId(int nmToUserId) {
		this.nmToUserId = nmToUserId;
	}
	public int getNmState() {
		return nmState;
	}
	public void setNmState(int nmState) {
		this.nmState = nmState;
	}
	public String getNmMessageContent() {
		return nmMessageContent;
	}
	public void setNmMessageContent(String nmMessageContent) {
		this.nmMessageContent = nmMessageContent;
	}
	public int getNmRank() {
		return nmRank;
	}
	public void setNmRank(int nmRank) {
		this.nmRank = nmRank;
	}
	public int getNmEnable() {
		return nmEnable;
	}
	public void setNmEnable(int nmEnable) {
		this.nmEnable = nmEnable;
	}
}
