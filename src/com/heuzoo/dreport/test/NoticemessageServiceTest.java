package com.heuzoo.dreport.test;

import org.junit.Test;

import com.heuzoo.dreport.pojo.NoticemessageInfo;
import com.heuzoo.dreport.service.NoticemessageService;
import com.heuzoo.dreport.service.impl.NoticemessageServiceImpl;

public class NoticemessageServiceTest {
	/**
	 * @author	叶金幸
	 * @return 
	 * @time	2017-2-23 下午02:24:48
	 * @project	dreport
	 * @return	void
	 * @todo	单元测试类，测试noticemessageService内相关方法
	 */
	@Test
	public void insertNoticemessageTest(){
		NoticemessageInfo noticemessageInfo = new NoticemessageInfo();
		noticemessageInfo.setNmEnable(1);
		noticemessageInfo.setNmFromUserId(1);
		noticemessageInfo.setNmMessageContent("a test demo");
		noticemessageInfo.setNmRank(0);
		noticemessageInfo.setNmToUserId(2);
		noticemessageInfo.setNmState(1);
		NoticemessageService service = new NoticemessageServiceImpl();
		if(service.insertNoticemessage(noticemessageInfo)){
			System.out.println("插入成功："+noticemessageInfo.getNmId());
		}
	}
}
