<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎进入HeuZoo日报管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="/dreport/css/sweetalert.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body onload="getMessage()">
    <h2>${name}</h2>
    <h2>${type}</h2>
    <a href="${pageContext.request.contextPath }/employeeController/checkJournal.action">审核日报模块测试</a>
    <br/>
    <a href="${pageContext.request.contextPath }/employeeController/prepareJournal.action">日报填写模块测试</a>
    </br>
    <a href="${pageContext.request.contextPath }/employeeController/queryJournalIsMe.action">日报查询模块测试</a>
    </br>
    <a href="${pageContext.request.contextPath }/employeeController/queryEmployee.action">用户查询模块测试</a>
    
  </body>
  
  <script src="/dreport/js/sweetalert.min.js"></script>
  
<script>
		function updateNotice(){
		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
			alert(xmlhttp.responseText);
				if(xmlhttp.responseText != NULL){
					var noticeObj = JSON.parse(xmlhttp.responseText);
					var type;
					console.log(noticeObj);
					if(noticeObj[0].nmRank == 0)
						type = "新的Info";
					else type= "新的Warining";
					swal(type, "消息来自ID：" + noticeObj[0].nmFromUserId +
						"\n消息内容：" + noticeObj[0].nmMessageContent +
						"\n时间：" + noticeObj[0].nmTime.toLocaleString, "success");
				}
			}
		};
		xmlhttp.open("GET","/dreport/noticemessageController/queryUserNotice.action" + "?time=" + Math.random(),true);
		xmlhttp.send();
	}
	function getMessage(){
		window.setInterval(updateNotice, 10000);
	}
		
	</script>
</html>
