<!-- Author:叶金幸    作用：显示今天应提交日报列表，供给发送提醒 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

  <title>准备发送消息</title>

  <link href="/dreport/css/style.default.css" rel="stylesheet">
  <link href="/dreport/css/jquery.datatables.css" rel="stylesheet">
  
  <link href="/dreport/css/sweetalert.css" rel="stylesheet">
  <style>
    .table>tbody>tr>td, .table>thead>tr>th {
      text-align: center;
      vertical-align: middle;
    }
    .task {
      width: 250px;
    }
    .hidesomeinfo {
      display: inline-block;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      width: 250px;
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
      <h2><i class="fa fa-table"></i> 发送提醒<span>请在此发送提醒</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">您现在在:</span>
        <ol class="breadcrumb">
          <li><a href="/dreport/index.jsp">Dreport</a></li>
          <li class="active">发送消息</li>
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
          <h3 class="panel-title">发送提醒</h3>
          <p></p>
        </div>
        <div class="panel-body">
         
          <br />
          <div class="table-responsive">
            <table class="table" id="table1">
              <thead>
                 <tr>
                    <th>姓名</th>
                    <th>工号</th>
                    <th>项目</th>
                    <th >工作量(h)</th>
                    <th>日报内容</th>
					<th>审核状态</th>
					<th>操作</th>
                 </tr>
              </thead>
              <tbody>
                
				<c:forEach items="${viewJournals}" var="view">
                 	<tr class="gradeA">
                 		<td>${view.empUsername }</td>
	                    <td>${view.empNum }</td>
	                    <td>${view.proName }</td>
	                    <td class="center"> ${view.jourWorkload }</td>
	                    <td class="center task"><span class="hidesomeinfo">${view.jourTask }</span></td>
						<td>
							<c:choose>
								<c:when test="${view.jourState == -1}">
									<span class="label label-danger">
									未提交
									</span>
								</c:when>
								<c:when test="${view.jourState == 0}">
									<span class="label label-primary">
									未审核
									</span>
								</c:when>
								<c:when test="${view.jourState == 1}">
									<span class="label label-success">
									审核通过
									</span>
								</c:when>
								<c:when test="${view.jourState == 2}">
									<span class="label label-danger">
									未通过
									</span>
								</c:when>
								
							</c:choose>
						 </td>
						<td class="table-action">
						  <a href="" id="${view.joursubmitPerson }" class="send-message" data-toggle="modal" data-target=".bs-example-modal-static"><i class="fa fa-pencil"></i></a>
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

		
		<!--这里面装载弹出窗口，给一个编辑框用来编写提示信息等等-->
		<div class="modal fade bs-example-modal-static modal-sendmessage" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" data-dismiss="modal" id="btn-close" class="close" type="button">&times;</button>
					<h4 class="modal-title">编辑提示信息</h4>
				</div>
				<div class="modal-body">
					<label>您可以在此处选择提示信息等级、编辑消息内容</label>
					<hr />
					<div class="form-group">
					<label class="col-sm-3 control-label">发送对象</label>
					    <div class="col-sm-6">
							 ID：<label id="set-notice-info">--</label>
					   </div>
					   
					</div>
					
					<div class="form-group">
					  <label class="col-sm-3 control-label">消息等级</label>
					    <div class="col-sm-6">
							 <div class="radio"> <label><input type="radio" value="0" name="noticeType" checked> Info</label></div>
							 <div class="radio"><label><input type="radio" value="1" name="noticeType"> Warning</label></div>
					   </div>
					</div>
					
					<div class="form-group">
					  <label class="col-sm-3 control-label">消息内容</label>
					  <div class="col-sm-8">
						<input type="text" id="noticeContent" placeholder="消息内容" class="form-control" />
					  </div>
					</div>
					
					<div class="form-group">
						<button class="btn btn-primary btn-sm col-sm-2 col-sm-offset-5" id="sendNotice">发送</button>
					</div>
			
				</div>
			</div>
		  </div>
		</div>


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
	
	//确定选定单元ID
	jQuery('.send-message').click(function(event){
		var infoBox = document.getElementById('set-notice-info');
		infoBox.innerHTML = $(this).attr('id');
		console.log(infoBox.innerHTML);
		//应避免页面跳转
		event.preventDefault();
	});
	
	jQuery('#sendNotice').click(function(){
		jQuery('#btn-close').click();
		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				if(xmlhttp.responseText == "200")
					swal("发送成功", "消息已被发送至该员工处！", "success");
				else
					swal("发送失败", "该员工已有未读信息，请稍后重试", "error");
			}else{
				swal("连接失败", "消息发送失败，请重试", "error");
			}
		};
		xmlhttp.open("POST","/dreport/noticemessageController/createnoticerecord.action",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("messageContent="+$("#noticeContent").val()+"&noticeType="+ jQuery('input:radio[name="noticeType"]:checked').val() +"&toUserId="+$("#set-notice-info").html());
	});
  
  });
</script>

</body>
</html>
