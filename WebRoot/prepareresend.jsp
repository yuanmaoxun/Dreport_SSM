<!-- Author:叶金幸    作用：显示今天应提交日报列表，供给发送提醒 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>消息重发</title>

  <link href="/dreport/css/style.default.css" rel="stylesheet">
  <link href="/dreport/css/jquery.datatables.css" rel="stylesheet">
  
  <link href="/dreport/css/sweetalert.css" rel="stylesheet">
  <style>
    .table>tbody>tr>td, .table>thead>tr>th {
      text-align: center;
      vertical-align: middle;
    }
    .task {
      width: 350px;
    }
    .hidesomeinfo {
      display: inline-block;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      width: 350px;
      padding: 20px 0px;
    }
  </style>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body>



<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>


<section>
  
  <div class="leftpanel">
    
    <div class="logopanel">
        <h1><span>[</span> Dreport <span>]</span></h1>
    </div><!-- logopanel -->
    
    <div class="leftpanelinner">

        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">
            <div class="media userlogged">
                <img alt="" src="/dreport/images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4>John Doe</h4>
                    <span>"Life is so..."</span>
                </div>
            </div>

            <h5 class="sidebartitle actitle">Account</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="signout.html"><i class="fa fa-sign-out"></i> <span>登出</span></a></li>
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
        <li class="nav-parent active"><a href="#"><i class="fa fa-laptop"></i> <span>日报提醒</span></a>
            <ul class="children">
              <li><a href="/dreport/authority/sendNotice.action"><i class="fa fa-caret-right"></i>发送提醒</a></li>
              <li><a href="/dreport/authority/sendMessage.action"><i class="fa fa-caret-right"></i>发送消息</a></li>
              <li><a href="/dreport/authority/messageHistory.action"><i class="fa fa-caret-right"></i>消息历史</a></li>
            </ul>
        </li>
        <li class="nav-parent"><a href="#"><i class="fa fa-bug"></i> <span>雇员管理</span></a>
            <ul class="children">
                <li><a href="/dreport/authority/addEmployee.action"><i class="fa fa-caret-right"></i>雇员信息添加</a></li>
                <li><a href="/dreport/authority/queryEmployee.action"><i class="fa fa-caret-right"></i>雇员信息查询</a></li>
            </ul>
        </li>
      </ul>
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
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
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h2><i class="fa fa-table"></i> 重发消息 <span>在这里，你可以重发消息</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">您现在在:</span>
        <ol class="breadcrumb">
          <li><a href="/dreport/index.jsp">Dreport</a></li>
          <li class="active">重发消息</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      
      
      
      <div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-btns">
            <a href="" class="panel-close">&times;</a>
            <a href="" class="minimize">&minus;</a>
          </div><!-- panel-btns -->
          <h3 class="panel-title">重发消息</h3>
          <p></p>
        </div>
        <div class="panel-body">
          <h5 class="subtitle mb5"></h5>
          <p class="m20">进行重发消息</p>
          <br />
          <div class="table-responsive">
            <table class="table" id="table1">
              <thead>
                 <tr>
                    <th>来自ID</th>
                    <th>接收ID</th>
                    <th>消息状态</th>
                    <th >消息内容</th>
                    <th>消息等级</th>
					<th>发送时间</th>
					<th>操作</th>
                 </tr>
              </thead>
              <tbody>
                 
                
					 <c:forEach items="${noticemessageInfos}" var="view">
                 	<tr class="gradeA">
                 		<td>${view.nmFromUserId }</td>
	                    <td>${view.nmToUserId }</td>
						<c:choose>
								<c:when test="${view.nmState == 1}">
									<td><span class="label label-danger">
									未读
									</span></td>
								</c:when>
								<c:when test="${view.nmState == 2}">
									<td><span class="label label-success">
									已读
									</span></td>
								</c:when>
								<c:when test="${view.nmState == 3}">
									<td><span class="label label-primary">
									已重发
									</span></td>
								</c:when>								
						</c:choose>
						<td class="center task"><span class="hidesomeinfo"> ${view.nmMessageContent }</span></td>
	                    <c:choose>
								<c:when test="${view.nmRank == 0}">
									<td><span class="label label-primary">
									提示
									</span></td>
								</c:when>
								<c:when test="${view.nmRank == 1}">
									<td><span class="label label-warning">
									警告
									</span></td>
								</c:when>								
						</c:choose>
						<td>
							<fmt:formatDate value="${view.nmTime }" type="both" />  
						</td>
						<td class="table-action">
							<a href="" id="${view.nmId }" class="send-message" data-toggle="modal" data-target=".bs-example-modal-static" ><i class="fa fa-send"></i></a>
						</td>
                 	</tr>
                 </c:forEach>
              </tbody>
           </table>
         
          
        </div><!-- panel-body -->
      </div><!-- panel -->
        
    </div><!-- contentpanel -->
    
  </div><!-- mainpanel -->
  
  
</section>

		

<script src="/dreport/js/jquery-1.11.1.min.js"></script>
<script src="/dreport/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/dreport/js/bootstrap.min.js"></script>
<script src="/dreport/js/modernizr.min.js"></script>
<script src="/dreport/js/jquery.sparkline.min.js"></script>
<script src="/dreport/js/toggles.min.js"></script>
<script src="/dreport/js/retina.min.js"></script>
<script src="/dreport/js/jquery.cookies.js"></script>


<script src="/dreport/js/jquery.datatables.min.js"></script>
<script src="/dreport/js/select2.min.js"></script>

<script src="/dreport/js/custom.js"></script>

<script src="/dreport/js/sweetalert.min.js"></script>
<script>
  jQuery(document).ready(function() {
    
    "use strict";
    
    jQuery('#table1').dataTable();
    
    jQuery('.hidesomeinfo').tooltip({
      delay: {
        show: 800,
        hide: 0
      },
      title: function () {
        return $(this).text();
      }
    });
    
    // Select2
    jQuery('select').select2({
        minimumResultsForSearch: -1
    });
    
    jQuery('select').removeClass('form-control');
    
    // Delete row in a table
    jQuery('.delete-row').click(function(){
      var c = confirm("Continue delete?");
      if(c)
        jQuery(this).closest('a').fadeOut(function(){
          jQuery(this).remove();
        });
        return false;
    });
    
    // Show aciton upon row hover
    jQuery('.table-hidaction tbody tr').hover(function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 1});
    },function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 0});
    });
	
	
	
	jQuery('.send-message').live('click', function(event){
		//event.preventDefault();
		var noticeId = $(this).attr('id');
		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				if(xmlhttp.responseText == "200"){
					swal("发送成功", "消息已被重发至该员工处！", "success");
					jQuery(this).closest('tr').fadeOut(function(){
					  jQuery(this).remove();
					});
					setTimeout('location.reload(true)',1500);
				}
				else
					swal("发送失败", "该员工已有未读信息，请稍后重试", "error");
			}else{
				swal("连接失败", "消息发送失败，请重试", "error");
			}
		};
		xmlhttp.open("POST","/dreport/noticemessageController/noticeResend.action",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("resendNoticeId=" + noticeId );
	});
  
  });
</script>

</body>
</html>
