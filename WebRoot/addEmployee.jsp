<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- Author:高冬岩 该界面为添加雇员信息界面 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加雇员信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  	<meta name="description" content="">
  	<meta name="author" content="">
  	<link rel="shortcut icon" href="images/favicon.png" type="image/png">
  	<title>雇员信息添加</title>
  <link href="/dreport/css/style.default.css" rel="stylesheet">
  <link href="/dreport/css/sweetalert.css" rel="stylesheet">
  <script src="/dreport/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript">
      $.validator.setDefaults( {
          submitHandler: function() {
            alert("提交事件");
          }
      });
      $().ready(function() {
          $("#commentForm").validate();
      });
  </script>

  </head>
  
  <body onload="getMessage()">
   	<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
  </div>
  <section>
    <div class="leftpanel">
      <div class="logopanel">
        <h1><span>[</span> Dreport <span>]</span></h1>
      </div>
      <!-- logopanel -->
      <div class="leftpanelinner">

        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">
            <div class="media userlogged">
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4>John Doe</h4>
                    <span>"Life is so..."</span>
                </div>
            </div>

            <h5 class="sidebartitle actitle">Account</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="/Dreport/login.jsp"><i class="fa fa-sign-out"></i> <span>登出</span></a></li>
            </ul>
        </div>

      <h5 class="sidebartitle">系统导航</h5>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li ><a href="/dreport/index.jsp"><i class="fa fa-home"></i> <span>主页</span></a></li>
        <li class="nav-parent"><a href="#"><i class="fa fa-edit"></i> <span>日报管理</span></a>
          <ul class="children">
            <li><a href="/dreport/authority/writeJournal.action"><i class="fa fa-caret-right"></i>撰写日报</a></li>
            <li><a href="/dreport/authority/queryJournal.action"><i class="fa fa-caret-right"></i>查询日报</a></li>
            <li><a href="/dreport/authority/checkJournal.action"><i class="fa fa-caret-right"></i>审核日报</a></li>
          </ul>
        </li>
        <li><a href="/dreport/authority/journalSignup.action"><i class="fa fa-th-list"></i> <span>日报设定</span></a></li>
        <li class="nav-parent"><a href="#"><i class="fa fa-suitcase"></i> <span>日报统计</span></a>
          <ul class="children">
            <li><a href="/dreport/authority/countByPerson.action"><i class="fa fa-caret-right"></i>根据人员信息统计</a></li>
            <li><a href="/dreport/authority/countByProject.action"><i class="fa fa-caret-right"></i>根据项目信息统计</a></li>
            <li><a href="/dreport/authority/countByCheck.action"><i class="fa fa-caret-right"></i>根据审核状态统计</a></li>
          </ul>
        </li>
        <li class="nav-parent"><a href="#"><i class="fa fa-laptop"></i> <span>日报提醒</span></a>
            <ul class="children">
              <li><a href="/dreport/authority/sendNotice.action"><i class="fa fa-caret-right"></i>发送提醒</a></li>
              <li><a href="/dreport/authority/sendMessage.action"><i class="fa fa-caret-right"></i>发送消息</a></li>
              <li><a href="/dreport/authority/messageHistory.action"><i class="fa fa-caret-right"></i>消息历史</a></li>
            </ul>
        </li>
        <li class="nav-parent active"><a href="#"><i class="fa fa-bug"></i> <span>雇员管理</span></a>
            <ul class="children">
                <li><a href="/dreport/authority/addEmployee.action"><i class="fa fa-caret-right"></i>雇员信息添加</a></li>
                <li><a href="/dreport/authority/queryEmployee.action"><i class="fa fa-caret-right"></i> 雇员信息查询</a></li>
            </ul>
        </li>
      </ul>
    </div><!-- leftpanelinner -->
    </div>
    <!-- leftpanel -->
    <div class="mainpanel">
      <div class="headerbar">
        <a class="menutoggle"><i class="fa fa-bars"></i></a>
        <div class="header-right">
          <ul class="headermenu">
            <li>
              <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                  <img src="/dreport/images/photos/loggeduser.png" alt="" /> 
                  <%=session.getAttribute("userName") %> 
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                  <li><a href="/dreport/login.jsp"><i class="glyphicon glyphicon-log-out"></i> 登出</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
        <!-- header-right -->
      </div>
      <!-- headerbar -->
      <div class="pageheader">
        <h2><i class="fa fa-home"></i> 雇员信息添加 <span>请在此添加要增加的雇员基本信息</span></h2>
        <div class="breadcrumb-wrapper">
          <span class="label">您目前在:</span>
          <ol class="breadcrumb">
            <li><a href="/dreport/index.jsp">Dreport</a></li>
            <li class="active">雇员添加</li>
          </ol>
        </div>
      </div>
      <div class="contentpanel">
      <div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-btns">
            <a href="" class="panel-close">&times;</a>
            <a href="" class="minimize">&minus;</a>
          </div>
          <h4 class="panel-title">添加雇员信息</h4>
          <p>人事管理员，您可以在此添加需要添加的雇员信息 </p>
        </div>
        <div class="panel-body panel-body-nopadding">
          
          <form class="form-horizontal form-bordered" action="${pageContext.request.contextPath }/employeeController/addEmployeeInfo.action" method="post">
            
            <div class="form-group">
              <label class="col-sm-3 control-label">请为您的新员工添加工号</label>
              <div class="col-sm-6">
                <input type="text" name="employeeNum" placeholder="在此添加员工工号，不可为空" class="form-control" required/>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">请输入您的新员工姓名</label>
              <div class="col-sm-6">
                <input type="text" name="employeeName" placeholder="在此添加员工姓名，不可为空" class="form-control" required/>
              </div>
            </div>
             <div class="form-group">
              <label class="col-sm-3 control-label">请输入新员工的登录密码</label>
             <div class="col-sm-6">
                <input type="password" id="employeePwd" name="employeePwd" placeholder="在此填写员工密码" class="form-control" required/>
              </div>
            </div>
             <div class="form-group">
              <label class="col-sm-3 control-label">请确认新员工的登录密码</label>
              <div class="col-sm-6">
                <input type="password" id="confirmpsw"  placeholder="请输入与员工密码相同的确认密码" class="form-control" required/>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">请您选择该雇员所属职位</label>
              <div class="col-sm-6">
                <select id="fruits" class="select2" name="employeeType" required data-placeholder="请选择">
                      <option value=""></option>
                      <option value="1">普通员工</option>
                      <option value="2">组长</option>
                      <option value="3">经理</option>
                      <option value="4">日报管理员</option>
                      <option value="5">人事管理员</option>
                    </select>
                    <label class="error" for="fruits"></label>
              </div>
              </div>
              <div class="form-group">
              	<label class="col-sm-3 control-label"></label>
              	<div class="col-sm-6">
                	<input type="submit" class="btn btn-primary" value="确认添加"/>
                	<input type="button" class="btn btn-default" value="取消"/>
              	</div>
              </div>
             
            
          </form>
          
        </div><!-- panel-body -->
        <!-- 
        <div class="panel-footer">
			 <div class="row">
				<div class="col-sm-6 col-sm-offset-3">
				  <button class="btn btn-primary">Submit</button>&nbsp;
				  <button class="btn btn-default">Cancel</button>
				</div>
			 </div>
		  </div>
        -->
      </div>
        <!-- content goes here... -->
      </div>
    </div>
    <!-- mainpanel -->
    <div class="rightpanel">
      <!-- Nav tabs -->
      <ul class="nav nav-tabs nav-justified">
        <li class="active"><a href="#rp-alluser" data-toggle="tab"><i class="fa fa-users"></i></a></li>
        <li><a href="#rp-favorites" data-toggle="tab"><i class="fa fa-heart"></i></a></li>
        <li><a href="#rp-history" data-toggle="tab"><i class="fa fa-clock-o"></i></a></li>
        <li><a href="#rp-settings" data-toggle="tab"><i class="fa fa-gear"></i></a></li>
      </ul>
      <!-- Tab panes -->
      
    </div>
    <!-- rightpanel -->
  </section>
  <script src="/dreport/js/jquery-1.11.1.min.js"></script>
  <script src="/dreport/js/jquery-migrate-1.2.1.min.js"></script>
  <script src="/dreport/js/bootstrap.min.js"></script>
  <script src="/dreport/js/modernizr.min.js"></script>
  <script src="/dreport/js/jquery.sparkline.min.js"></script>
  <script src="/dreport/js/toggles.min.js"></script>
  <script src="/dreport/js/retina.min.js"></script>
  <script src="/dreport/js/jquery.cookies.js"></script>

  <script src="/dreport/js/sweetalert.min.js"></script>
  <script src="/dreport/js/select2.min.js"></script>
  <script src="/dreport/js/jquery.validate.min.js"></script>

  <script src="/dreport/js/custom.js"></script>
  <script>
jQuery(document).ready(function(){
    
    "use strict";
    
    // Select2
  jQuery(".select2").select2({
    width: '100%',
    minimumResultsForSearch: -1
  });
  
  // Basic Form
  jQuery("#basicForm").validate({
    highlight: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-error');
    }
  });
  
  // Error Message In One Container
  jQuery("#basicForm2").validate({
   errorLabelContainer: jQuery("#basicForm2 div.error")
  });
  
  // With Checkboxes and Radio Buttons
  jQuery("#basicForm3").validate({
    highlight: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-error');
    }
  });
  
  // Validation with select boxes
  jQuery("#basicForm4").validate({
    highlight: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function(element) {
      jQuery(element).closest('.form-group').removeClass('has-error');
    }
  });
  
  
});
</script> 
  </body>
  
  
  <script>
		function updateNotice(){
		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				if(xmlhttp.responseText != ""){
					var noticeObj = JSON.parse(xmlhttp.responseText);
					var type;
					console.log(noticeObj);
					if(noticeObj.nmRank == 0)
						type = "新的Info";
					else type= "新的Warning";
					swal(type, "消息来自ID：" + noticeObj.nmFromUserId +
						"\n消息内容：" + noticeObj.nmMessageContent +
						"\n时间：" + noticeObj.nmTime.toLocaleString(), "success");
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
