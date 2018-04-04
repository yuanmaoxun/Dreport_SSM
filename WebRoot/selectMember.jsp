<!-- Author：叶金幸    供选取某个用户给其发送提醒消息 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>选择要发送消息的员工</title>

  <link href="/dreport/css/style.default.css" rel="stylesheet">
  <link href="/dreport/css/jquery.datatables.css" rel="stylesheet">
  
  <link href="/dreport/css/sweetalert.css" rel="stylesheet">

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
      <h2><i class="fa fa-table"></i> 发送消息 <span>在这里选择雇员进行发送消息</span></h2>
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
          </div>
          <h4 class="panel-title">发送消息</h4>
        </div>
        <div class="panel-body panel-body-nopadding">
          <form class="form-horizontal form-bordered" id="form-notice">
            <div class="form-group">
              <label class="col-sm-3 control-label">发送用户</label>
              <div class="col-sm-5">
                <select id="select-project" class="form-control input-sm mb15" onchange="getMembers()">
				  <option value="0">unselected</option>
					<c:forEach items="${projects}" var="projectItem">  	
						<option value="${projectItem.proId}">${projectItem.proName}</option>
					</c:forEach>
                </select>
                <select onclick="changeUser()" id="select-member" name="toUserId" class="form-control mb15" onchange="changeUser()">
                  <option>unselected</option>
                </select>
              </div>
			  
            </div>
			
			<div class="form-group">
              <label class="col-sm-3 control-label"><!--在这里加“用户信息”--></label>
              <div class="col-sm-5">
                <div class="mb15">
                  用户名&nbsp;&nbsp;&nbsp;:
				  <label id="hint-username">unselected</label>
                </div>
				<div class="mb15">
                 员工ID&nbsp;&nbsp;&nbsp;:
				  <label id="hint-usernum">unselected</label>
                </div>
              </div>
            </div>

			
					
			<div class="form-group">
              <label class="col-sm-3 control-label">Select Rank</label>
              <div class="col-sm-5">
					  <div class="rdio rdio-success" style="float:left">
                        <input type="radio" name="noticeType" value="0" id="radioSuccess" checked/>
                        <label for="radioSuccess">普通提醒</label>
                      </div>
                      
                      <div class="rdio rdio-danger" style="margin-right: 40%;float: right">
                        <input type="radio" name="noticeType" value="1" id="radioDanger" />
                        <label for="radioDanger">警告提醒</label>
                      </div>
              </div>
			  
            </div>

			

			
			<div class="form-group">
              <label class="col-sm-3 control-label">Autogrow Textarea</label>
              <div class="col-sm-5">
                <textarea id="messageContent" name="messageContent" class="form-control" rows="5"></textarea>
              </div>
            </div>
            
            
           			 <div class="form-group">
						<button class="btn btn-primary btn-sm col-sm-2 col-sm-offset-5" id="sendNotice">发送</button>
					</div>
            
           
          </form>
          
          
          
        </div><!-- panelbody -->
        
        
      </div><!-- panel -->
      
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
		
	jQuery('#sendNotice').click(function(event){
		event.preventDefault();
		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				if(xmlhttp.responseText == "200"){
					swal("发送成功", "消息已被发送至该员工处！", "success");
					}
				else{
					swal("发送失败", "该员工已有未读信息，请稍后重试", "error");
					}
			}else{
				swal("连接失败", "消息发送失败，请重试", "error");
			}
		};
		xmlhttp.open("POST","/dreport/noticemessageController/createnoticerecord.action",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("messageContent="+$("#messageContent").val()+"&noticeType="+ jQuery('input:radio[name="noticeType"]:checked').val()+"&toUserId="+$("#hint-usernum").html());
		setTimeout('location.reload(true)',1500);
	});
  
  });
  
  function getMembers(){
  		var projectId = jQuery('#select-project').val();
  		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				if(xmlhttp.responseText != null){
				console.log(xmlhttp.responseText);
					var memberBox = jQuery('#select-member').get(0);
					memberBox.length = 0;
					membersObj = JSON.parse(xmlhttp.responseText);
					for(var i = 0 ; i < membersObj.length ; i++){
						memberBox.options.add(new Option(membersObj[i].name,membersObj[i].id))
					}
					jQuery('#hint-username').html(membersObj[0].name);
					jQuery('#hint-usernum').html(membersObj[0].id);
				}else{
					swal("请重试", "未能获取该项目负责人员列表", "error");
				}
			}else if(xmlhttp.readyState==4 && xmlhttp.status!=200){
				swal("连接失败", "请求失败，请重试", "error");
			}
		};
		xmlhttp.open("POST","/dreport/noticemessageController/getMembersByProject.action",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("projectId="+projectId);
  }
  
  function changeUser(){
  		var index = document.getElementById('select-member').selectedIndex;
  		var text = $("#select-member").find("option:selected").text();
  		var value = $("#select-member").val();
		jQuery('#hint-username').html(text);
		jQuery('#hint-usernum').html(value);
  }
  
  function submitNotice(event){
  		event.preventDefault();
  		document.getElementById('form-notice').submit();
  }
</script>

</body>
</html>
