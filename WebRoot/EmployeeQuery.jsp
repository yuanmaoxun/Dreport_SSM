<!-- 岳盈 -->

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
  <link rel="shortcut icon" href="/dreport/images/favicon.png" type="image/png">

  <title>雇员信息查询</title>

  <link href="/dreport/css/style.default.css" rel="stylesheet">
  <link href="/dreport/css/jquery.datatables.css" rel="stylesheet">
	<link href="/dreport/css/sweetalert.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <style type="text/css">
  	.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
  		vertical-align:middle;
  		text-align: center;
  	}
  </style>
</head>

<body onload="getMessage()">



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
      <h2><i class="fa fa-table"></i>查询雇员信息 <span>您可以在此查询雇员信息</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">您现在在：</span>
        <ol class="breadcrumb">
          <li><a href="/dreport/index.jsp">Dreport</a></li>
          <li class="active">查询用户信息</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel"><!-- row --><!-- row -->

  <div class="row"></div><!-- row -->
      
      <div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-btns">
            <a href="" class="panel-close">&times;</a>
            <a href="" class="minimize">&minus;</a>
          </div><!-- panel-btns -->
          <h3 class="panel-title">用户信息查询</h3>
          <p>在此处可以查询用户信息</p>
        </div>
        <div class="panel-body">
   
          <div class="table-responsive">
          <table class="table table-striped" id="table2">
              <thead>
                 <tr>
                     <th style="display:none">ID</th> 
                    <th>工号</th>
                    <th>姓名</th>
                    <th>类型</th>
                    <th>工作组号</th>
                    <th>状态</th>
                    
                    <th>上一次登录时间</th>
                    <th>修改</th>
                    
                 </tr>
              </thead>
              <tbody>
                 <c:forEach items="${employeeList}" var="item">
  				<tr>
	  				<td style="display:none">${item.empId}</td>
	  				<td>${item.empNum}</td>
	  				<td>${item.empUsername}</td>	
            <c:choose>
              <c:when test="${item.empType == 1}">
                <td>普通员工</td>
              </c:when>
              <c:when test="${item.empType == 2}">
                <td>组长</td>
              </c:when>
              <c:when test="${item.empType == 3}">
                <td>经理</td>
              </c:when>
              <c:when test="${item.empType == 4}">
                <td>日报管理员</td>
              </c:when>
              <c:when test="${item.empType == 5}">
                <td>人事管理员</td>
              </c:when>
              <c:otherwise>
                <td>未有职位</td>
              </c:otherwise>
            </c:choose>
	  				<td>${item.empWorkgroupId}</td>
	  				<c:choose>
              <c:when test="${item.empEnable == 1}">
                <td>在职</td>
              </c:when>
              <c:when test="${item.empEnable == 0}">
                <td>辞职</td>
              </c:when>
              <c:otherwise>
                <td>无信息</td>
              </c:otherwise>
            </c:choose>
	  		<!-- <td  height="20" align="center">${item.empLastlogin}</td> -->
	  		<td> <fmt:formatDate value="${item.empLastlogin}" /></td>
	  		<td><a  class="btn btn-primary update" data-toggle="modal" data-target=".bs-example-modal-static"><i class="fa fa-pencil"></i></td>
	  		</tr>
  			</c:forEach>
              </tbody>
           </table>
          </div><!-- table-responsive -->
          
        </div><!-- panel-body -->
      </div><!-- panel -->
        
    </div><!-- contentpanel -->
    
  </div><!-- mainpanel -->
  
  <div class="rightpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-justified">
        <li class="active"><a href="#rp-alluser" data-toggle="tab"><i class="fa fa-users"></i></a></li>
        <li><a href="#rp-favorites" data-toggle="tab"><i class="fa fa-heart"></i></a></li>
        <li><a href="#rp-history" data-toggle="tab"><i class="fa fa-clock-o"></i></a></li>
        <li><a href="#rp-settings" data-toggle="tab"><i class="fa fa-gear"></i></a></li>
    </ul>
        
    <!-- Tab panes -->
    
        
    
  </div><!-- rightpanel -->
  <div class="modal fade bs-example-modal-static" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="panel panel-dark panel-alt">
            <div class="panel-heading">
              <div class="panel-btns">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
              </div>
              <!-- panel-btns -->
              <h1 class="panel-title">修改雇员信息</h1>
            </div>
            <div class="panel-body">
              <div class="form-group">
              <label class="col-sm-3 control-label">ID</label>
              <div class="col-sm-8">
                <input type="text" value="Read Only Input" id="readonlyinput" class="form-control" readonly="readonly">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">姓名</label>
              <div class="col-sm-8">
                <input type="text" id="name" placeholder="Default Input" class="form-control">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">类型</label>
              <div class="col-sm-8">
                   <input type="text" value="不可更改项" id="readonlyinput" class="form-control" readonly="readonly">                 
                </div>
              </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">工号</label>
              <div class="col-sm-8">
                <input type="text" id="empNum" placeholder="请输入要修改的工号" class="form-control">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">手机</label>
              <div class="col-sm-8">
                <input type="text" placeholder="请输入手机号码" class="form-control">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">邮箱</label>
              <div class="col-sm-8">
                <input type="text" placeholder="请输入邮箱号码" class="form-control">
              </div>
            </div>
            <button class="btn btn-primary" id="send" style="float:right">提交</button>
            </div>
          </div>
    </div>
  </div>
</div>

  
  
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
<script src="/dreport/js/sweetalert.min.js">
</script>
<script>

  jQuery(document).ready(function() {
    
    "use strict";
    var $info; //临时接收 click 的对象
    
    $('.update').on('click', function() {
      $info = $(this).parent().parent().children();
      $('#readonlyinput').val($info[0].innerHTML);
      $('#empNum').val($info[1].innerHTML);
      $('#name').val($info[2].innerHTML);
    })
    
    $('#send').on('click', function() {
      $.ajax({
        type: 'POST',
        url: 'updateEmployee.action',
        data: {
          "empId":   $('#readonlyinput').val(),
          "empName": $('#name').val(),
          "empNum":  $('#empNum').val()
        }
      }).done(function (data) {
        $('.close').first().click();
        swal({
                title: "修改成功!",
                text: "您已经成功修改数据!",
                type: "success",
                timer: 3000,
                showConfirmButton: false
            });
            $info.first().text($('#readonlyinput').val());
            $info.first().next().text($('#empNum').val());
            $info.first().next().next().text($('#name').val());
      })
    })
    
    
   ////jQuery('tbody tr').find('.fa').animate({opacity: 1});
    ////var geted_1 = document.getElementsByName("currPrp");
    //console.log(geted_1);
    ////var geted_2 = document.getElementsByName("proPrp");
    //console.log(geted_2);
    ////for(var i = 0; i < geted_1.length; i++) {
      ////var num = geted_1[i].innerHTML;
      //console.log(num);
      //console.log(JSON.parse(geted_2[i].innerHTML)[num]);
     //// geted_2[i].innerHTML = (JSON.parse(geted_2[i].innerHTML)[num].name);
    ////}

    
    
    
    jQuery('#table1').dataTable();
    
    jQuery('#table2').dataTable({
      "sPaginationType": "full_numbers"
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
        jQuery(this).closest('tr').fadeOut(function(){
          jQuery(this).remove();
        });
        
        return false;
    });
    
    // Show aciton upon row hover
    ////jQuery(' tbody tr').hover(function(){
      ////jQuery(this).find('.fa').animate({opacity: 1});
    ////},function(){
      ////jQuery(this).find('.fa').animate({opacity: 0});
   //// });
  
  
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

