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

  <title>撰写日报</title>

  <link href="/dreport/css/style.default.css" rel="stylesheet">
  <link href="/dreport/css/jquery.datatables.css" rel="stylesheet">
 <link href="/dreport/css/font-awesome.min.css" rel="stylesheet">
 <link href="/dreport/css/sweetalert.css" rel="stylesheet">
 
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
    <style>
  .ok_prompt{
  	color:#90DCA8;
  	padding-top:10px;
  	margin-left:10px;
  }
  .error_prompt{
  	color:#EF5151;
  	padding-top:10px;
  	margin-left:10px;
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
              <li><a href="/dreport/login.jsp"><i class="fa fa-sign-out"></i> <span>登出</span></a></li>
            </ul>
        </div>

      <h5 class="sidebartitle">系统导航</h5>
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="/dreport/index.jsp"><i class="fa fa-home"></i> <span>主页</span></a></li>
        <li class="nav-parent active"><a href="#"><i class="fa fa-edit"></i> <span>日报管理</span></a>
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
                <li><a href="/dreport/login.jsp"><i class="glyphicon glyphicon-log-out"></i>登出</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h2><i class="fa fa-table"></i> 撰写日报 <span>请在此完成您今天日报的撰写任务</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">您目前在:</span>
        <ol class="breadcrumb">
          <li><a href="/dreport/index.jsp">Dreport</a></li>
          <li class="active">撰写日报</li>
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
          <h3 class="panel-title">撰写日报</h3>
          <p>在此撰写日报，进行提交</p>
        </div>
        <div class="panel-body">
   
          <div class="table-responsive">
          
          
          
          
          <!--添加form-->
          <div class="panel panel-default">
        <div class="panel-body panel-body-nopadding">
          
          <form id="myform" class="form-horizontal form-bordered" action="${pageContext.request.contextPath }/journalController/addJournal.action" method="post" onsubmit="return Check()" >  
            <input type="hidden" name="proId" value="${viewJournal.proId}"/>
            <div class="form-group">
				  <label class="col-sm-3 control-label" for="readonlyinput">员工工号</label>
				  <div class="col-sm-6">
					 <input type="text" value="${viewJournal.empNum}" id="readonlyinput" class="form-control" readonly="readonly" />
				  </div>
				</div>
                
            <div class="form-group">
				  <label class="col-sm-3 control-label" for="readonlyinput">员工姓名</label>
				  <div class="col-sm-6">
					 <input type="text" value="${viewJournal.empUsername}" id="readonlyinput" class="form-control" readonly="readonly" />
				  </div>
				</div>
                
                <div class="form-group">
				  <label class="col-sm-3 control-label" for="readonlyinput">员工类别</label>
				  <div class="col-sm-6">
					 <input type="text" value="${empType}" id="readonlyinput" class="form-control" readonly="readonly" />
				  </div>
				</div>
                
                <div class="form-group">
				  <label class="col-sm-3 control-label" for="readonlyinput">项目名称</label>
				  <div class="col-sm-6">
					 <input type="text" value="${viewJournal.proName}" id="readonlyinput" class="form-control" readonly="readonly" />
				  </div>
				</div>
                
                <div class="form-group">
              <label class="col-sm-3 control-label">项目prp阶段</label>
              <div class="col-sm-5">
                <select class="select5" data-placeholder="Choose a Country..." name="jourCurrStage" style="width:200px">
                  <%int count = 0; %>
  				<c:forEach items="${empNameList}" var="item">  	
  					<option value="<%=count++ %>">${item}</option>
  				</c:forEach>
                
                </select>
              </div>
            </div>
            
             <div class="form-group">
              <label class="col-sm-3 control-label">加班工作量：</label>
              <div class="col-sm-6">
                <input type="text" placeholder="请填写加班工作量" class="form-control" name="jourOvertimeWork" id="overWork" onfocus="overWorkFocus()" onblur="overWorkBlur()"  required="required" />
              </div>
                       <div id="overWorkId"></div>
            </div>
           
			<div class="form-group">
			<label class="col-sm-3 control-label">当日工作量：</label>
                <div class="col-sm-6">
              
 				<input type="text" placeholder="请填写当日工作量" class="form-control" name="jourWorkload" id="Work" onfocus="WorkFocus()" onblur="WorkBlur()" required="required"/>
                   	
                
                  	</div>
                  	 <div id="WorkId"></div>
                
            </div> 
                <div class="form-group">
                  <label class="col-sm-3 control-label">今日工作内容</label>
              <div class="col-sm-6">
                <textarea id="autoResizeTA" class="form-control" rows="5" name="jourTask" onfocus="TaskFocus()" onblur="TaskBlur()" required="required"></textarea>
              </div>
               <div id="TaskId"></div>
          </div>
            
          <div class="panel-footer">
			 <div class="row">
				<div class="col-sm-6 col-sm-offset-3">
				  <button id="btn-submit" class="btn btn-primary" OnClientClick="return Check()">提交</button>&nbsp;
				  
				</div>
			 </div>
		  </div><!-- panel-footer -->
        
          </form>
          
        </div><!-- panel-body -->
          
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
<script src="/dreport/js/sweetalert.min.js"></script>

<script src="/dreport/js/jquery.datatables.min.js"></script>
<script src="/dreport/js/select2.min.js"></script>

<script src="/dreport/js/custom.js"></script>

<script>
  jQuery(document).ready(function() {
    
    "use strict";
    jQuery('tbody tr').find('.glyphicon').animate({opacity: 1});
    var geted_1 = document.getElementsByName("currPrp");
    //console.log(geted_1);
    var geted_2 = document.getElementsByName("proPrp");
    //console.log(geted_2);
    for(var i = 0; i < geted_1.length; i++) {
      var num = geted_1[i].innerHTML;
      
      geted_2[i].innerHTML = (JSON.parse(geted_2[i].innerHTML)[num].name);
    }
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
    jQuery('tbody tr').hover(function(){
      jQuery(this).find('.glyphicon').animate({opacity: 1});
    },function(){
      jQuery(this).find('.glyphicon').animate({opacity: 0});
    });
  	
  	jQuery('#btn-submit').click(function(event){
  		event.preventEvent();
  		jQuery('#myform').submit();
  		
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
<script>


	
	function overWorkFocus(){
		var $overWorkId=$("#overWorkId");
		console.log(overWorkId);
		$overWorkId.addClass('ok_prompt');
		$overWorkId.text('请输入数字');
	}
	
	function overWorkBlur(){
		var $overWork=$("#overWork");
		var $overWorkId=$("#overWorkId");
		var reg=/^[0-9]*$/;
		if($overWork.val()===''){
			$overWorkId.addClass('error_prompt');
			$overWorkId.text("输入不可为空，未加班请如实填0");
			return false;
		}
		if(reg.test(overWork.value) === false){
			$overWorkId.addClass('error_prompt');
			$overWorkId.text('请输入合法数字');
			return false;
		}
		$overWorkId.addClass('ok_prompt');
		$overWorkId.text('输入正确');
		return true;
	}
	function WorkFocus(){
		var $WorkId=$("#WorkId");
		console.log(WorkId);
		$WorkId.addClass('ok_prompt');
		$WorkId.text('请输入数字');
	}
	
	function WorkBlur(){
		var $Work=$("#Work");
		var $WorkId=$("#WorkId");
		var reg=/^[0-9]*$/;
		if($Work.val()===''){
			$WorkId.addClass('error_prompt');
			$WorkId.text("输入不可为空，未工作请如实填0");
			return false;
		}
		if(reg.test(Work.value) === false){
			$WorkId.addClass('error_prompt');
			$WorkId.text('请输入合法数字');
			return false;
		}
		$WorkId.addClass('ok_prompt');
		$WorkId.text('输入正确');
		return true;
	}
		function TaskFocus(){
		var $TaskId=$("#TaskId");
		console.log("sdasd");
		$TaskId.addClass('ok_prompt');
		$TaskId.text('请输入文字');
	}
	function TaskBlur(){
		var $Task=$("#autoResizeTA");
		var $TaskId=$("#TaskId");
		if($Task.val()===''){
		$TaskId.addClass('error_prompt');
		$TaskId.text("输入不可为空，未工作请如实填写");
		return false;
		
		}
		$TaskId.addClass('ok_prompt');
		$TaskId.text('输入正确');
		return true;
		
	}
	function Check(){
		console.log("asda");
      var flagoverWorkBlur=overWorkBlur();
      var flagWorkBlur=WorkBlur();
      var flagTaskBlur=TaskBlur();

      overWorkBlur();
      WorkBlur();
      TaskBlur();

      if(flagoverWorkBlur==true &&lagWorkBlur==true &&flagTaskBlur==true ){
          return true;
          }
        else{
        console.log("sda");
            return false;
            }
    
    }
	

</script>
</html>


