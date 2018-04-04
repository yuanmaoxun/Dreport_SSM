<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

  <title>根据项目统计日报</title>

  <link href="/dreport/css/style.default.css" rel="stylesheet">
  <link href="/dreport/css/jquery.datatables.css" rel="stylesheet">
  <link href="/dreport/css/sweetalert.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <style>
  #table2_filter {
  float: right;
  }
  #select {
        border: 1px solid #ddd;
    padding: 10px;
    font-zize: 13px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    margin-left: 5px;
  }
  .table>tbody>tr>td, .table>thead>tr>th {
      text-align: center;
      vertical-align: middle;
    }
  </style>
  <script>
		  var option = ['<form action="/dreport/projectsController/queryjournalinfo.action" method="post"><div id="table2_filter"><label>Search:<select id="select" type="search" aria-controls="table2" name="project"><option name="qingxuanze">请选择</option>'];
		  <c:forEach items="${pro}" var="item">
		  var temp = "${item.proName}";
		  option.push('<option '+ 'value="' + temp + '">'+temp+'</option>');
		</c:forEach>
		  option.push('</select></label><button type="submit" class="btn btn-primary" style="margin: 0 0 4px 4px;">查询</button></div></form>');
		   console.log(option.join(''));
		</script>
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
        <li class="nav-parent active"><a href="#"><i class="fa fa-suitcase"></i> <span>日报统计</span></a>
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
          <li>
            
          </li>
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h2><i class="fa fa-table"></i> 员工工作统计 <span>按项目查询员工工作统计信息</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">您现在在:</span>
        <ol class="breadcrumb">
          <li><a href="/dreport/index.jsp">Dreport</a></li>
          <li class="active">查看工作量</li>
        </ol>
      </div>
    </div>
    
    <div class="contentpanel">
      
      <div class="row"><!-- col-md-6 --><!-- col-md-6 -->

      <div class="table-responsive">

          <table class="table table-striped" id="table2">
              <thead>
               <tr>
				<th>工号</th>
				<th>人员姓名</th>
				<th>工作代码量</th>
				<th>加班代码量</th>
				<th>加班率</th>
				<th>已通过日报数</th>
				<th>所提交过的日报数</th>
				<th>日报通过率</th>
			</tr>
              </thead>
              <tbody>
              <c:forEach items="${journalbypro}" var="items">
  				<tr>
	  				<td>${items.empNum}</td>
	  				<td>${items.empUsername}</td>
	  				<td>${items.jourWorkSumTime}</td>
	  				<td>${items.jourOverWorkSumTime}</td>
	  				<td><fmt:formatNumber value="${items.jourOverWorkSumTime*100/(items.jourWorkSumTime+items.jourOverWorkSumTime)}" minFractionDigits="2"  maxFractionDigits="2"></fmt:formatNumber>%</td>
	  				<td class="ac">${items.accept}</td>
	  				<td class="sum">${items.sumstate}</td>
	  				<td><fmt:formatNumber value="${items.accept*100/(items.accept+items.sumstate)}" minFractionDigits="2" maxFractionDigits="2"></fmt:formatNumber>%</td>
	  			</tr>
  			</c:forEach>
              </tbody>
           </table>
          </div><!-- table-responsive -->
          
        </div><!-- panel-body -->
        <div id="charts"><div>
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
<script src="/dreport/js/raphael-2.1.0.min.js"></script>
<script src="/dreport/js/morris.min.js"></script>

<script src="/dreport/js/custom.js"></script>
<script src="/dreport/js/sweetalert.min.js"></script>
<script>
  jQuery(document).ready(function() {
    
    "use strict";
    
    var ac, sum;
    ac = sum = 0;
    $('tbody tr').each(function(){
      ac += parseInt($(this).find('.ac').text());
      sum += parseInt($(this).find('.sum').text());
    })
    Morris.Donut({
      element: 'charts',
      data: [
        {label: '已通过日报数', value: ac},
        {label: '未通过日报数', value: sum-ac}
      ]
    });
    
    jQuery('#table2').dataTable({
      "sPaginationType": "full_numbers"
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
    jQuery('.table-hidaction tbody tr').hover(function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 1});
    },function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 0});
    });
   $('#table2_filter').replaceWith(option.join(''));
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
