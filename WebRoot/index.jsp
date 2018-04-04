<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
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
	<title>欢迎进入Dreport日报管理系统</title>
	<link href="/dreport/css/style.default.css" rel="stylesheet">
	<link href="/dreport/css/sweetalert.css" rel="stylesheet">
	<style>
	  .modal-body td, .modal-body th {
	    vertical-align: middle;
	    text-align: center;
	  }
	  .task {
        width: 200px;
      }
    .hidesomeinfo {
      line-height: normal;
      display: inline-block;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      width: 200px;
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
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
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
        <li class="active"><a href="/dreport/index.jsp"><i class="fa fa-home"></i> <span>主页</span></a></li>
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
              	<li onclick="getNoticeRecord()"><a href="#" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-user" ></i> <span>消息</span></a></li>
                <li><a href="/dreport/login.jsp"><i class="glyphicon glyphicon-log-out"></i> 登出</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div><!-- header-right -->

    </div><!-- headerbar -->
    <div class="pageheader">
      <h2><i class="fa fa-home"></i> 主页 <span>欢迎进入Dreport日报管理系统</span></h2>
      <div class="breadcrumb-wrapper">
        <span class="label">您现在在:</span>
        <ol class="breadcrumb">
          <li><a href="/dreport/index.jsp">Dreport</a></li>
          <li class="active">主页</li>
        </ol>
      </div>
    </div>

    <div class="contentpanel">

      <div class="row">

        <div class="col-sm-6 col-md-3">
          <div class="panel panel-success panel-stat">
            <div class="panel-heading">

              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="/dreport/images/is-user.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">现有员工数</small>
                    <h1><%=session.getAttribute("nowEmployeeCount") %></h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>

                
              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div><!-- col-sm-6 -->

        <div class="col-sm-6 col-md-3">
          <div class="panel panel-danger panel-stat">
            <div class="panel-heading">
              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="/dreport/images/is-user.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">现有工作组数</small>
                    <h1><%=session.getAttribute("nowWorkgroupCount") %></h1>
                  </div>
                </div><!-- row -->
                <div class="mb15"></div>
              </div><!-- stat -->
            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div><!-- col-sm-6 -->
        <div class="col-sm-6 col-md-3">
          <div class="panel panel-primary panel-stat">
            <div class="panel-heading">
              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="/dreport/images/is-document.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">当前进行的项目数</small>
                    <h1><%=session.getAttribute("nowProjectCount") %></h1>
                  </div>
                </div><!-- row -->
                <div class="mb15"></div>
              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div><!-- col-sm-6 -->

        <div class="col-sm-6 col-md-3">
          <div class="panel panel-dark panel-stat">
            <div class="panel-heading">

              <div class="stat">
                <div class="row">
                  <div class="col-xs-4">
                    <img src="/dreport/images/is-document.png" alt="" />
                  </div>
                  <div class="col-xs-8">
                    <small class="stat-label">现有日报数</small>
                    <h1><%=session.getAttribute("nowJournalCount") %></h1>
                  </div>
                </div><!-- row -->

                <div class="mb15"></div>
                </div><!-- row -->

              </div><!-- stat -->

            </div><!-- panel-heading -->
          </div><!-- panel -->
        </div><!-- col-sm-6 -->
      </div><!-- row -->

      

     

      
      </div>

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
    <div class="tab-content">
        <div class="tab-pane active" id="rp-alluser">
            <h5 class="sidebartitle">Online Users</h5>
            <ul class="chatuserlist">
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/userprofile.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Eileen Sideways</strong>
                            <small>Los Angeles, CA</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user1.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <span class="pull-right badge badge-danger">2</span>
                            <strong>Zaham Sindilmaca</strong>
                            <small>San Francisco, CA</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user2.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Nusja Nawancali</strong>
                            <small>Bangkok, Thailand</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user3.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Renov Leongal</strong>
                            <small>Cebu City, Philippines</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user4.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Weno Carasbong</strong>
                            <small>Tokyo, Japan</small>
                        </div>
                    </div><!-- media -->
                </li>
            </ul>

            <div class="mb30"></div>

            <h5 class="sidebartitle">Offline Users</h5>
            <ul class="chatuserlist">
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user5.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Eileen Sideways</strong>
                            <small>Los Angeles, CA</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user2.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Zaham Sindilmaca</strong>
                            <small>San Francisco, CA</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user3.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Nusja Nawancali</strong>
                            <small>Bangkok, Thailand</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user4.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Renov Leongal</strong>
                            <small>Cebu City, Philippines</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user5.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Weno Carasbong</strong>
                            <small>Tokyo, Japan</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user4.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Renov Leongal</strong>
                            <small>Cebu City, Philippines</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user5.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Weno Carasbong</strong>
                            <small>Tokyo, Japan</small>
                        </div>
                    </div><!-- media -->
                </li>
            </ul>
        </div>
        <div class="tab-pane" id="rp-favorites">
            <h5 class="sidebartitle">Favorites</h5>
            <ul class="chatuserlist">
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user2.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Eileen Sideways</strong>
                            <small>Los Angeles, CA</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user1.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Zaham Sindilmaca</strong>
                            <small>San Francisco, CA</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user3.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Nusja Nawancali</strong>
                            <small>Bangkok, Thailand</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user4.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Renov Leongal</strong>
                            <small>Cebu City, Philippines</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user5.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Weno Carasbong</strong>
                            <small>Tokyo, Japan</small>
                        </div>
                    </div><!-- media -->
                </li>
            </ul>
        </div>
        <div class="tab-pane" id="rp-history">
            <h5 class="sidebartitle">History</h5>
            <ul class="chatuserlist">
                <li class="online">
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user4.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Eileen Sideways</strong>
                            <small>Hi hello, ctc?... would you mind if I go to your...</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user2.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Zaham Sindilmaca</strong>
                            <small>This is to inform you that your product that we...</small>
                        </div>
                    </div><!-- media -->
                </li>
                <li>
                    <div class="media">
                        <a href="#" class="pull-left media-thumb">
                            <img alt="" src="images/photos/user3.png" class="media-object">
                        </a>
                        <div class="media-body">
                            <strong>Nusja Nawancali</strong>
                            <small>Are you willing to have a long term relat...</small>
                        </div>
                    </div><!-- media -->
                </li>
            </ul>
        </div>
        <div class="tab-pane pane-settings" id="rp-settings">

            <h5 class="sidebartitle mb20">Settings</h5>
            <div class="form-group">
                <label class="col-xs-8 control-label">Show Offline Users</label>
                <div class="col-xs-4 control-label">
                    <div class="toggle toggle-success"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-8 control-label">Enable History</label>
                <div class="col-xs-4 control-label">
                    <div class="toggle toggle-success"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-8 control-label">Show Full Name</label>
                <div class="col-xs-4 control-label">
                    <div class="toggle-chat1 toggle-success"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-8 control-label">Show Location</label>
                <div class="col-xs-4 control-label">
                    <div class="toggle toggle-success"></div>
                </div>
            </div>

        </div><!-- tab-pane -->

    </div><!-- tab-content -->
  </div><!-- rightpanel -->


</section>


<!--Big Modal For MessageList-->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
            <h4 class="modal-title">消息记录</h4>
        </div>
        <div class="modal-body">
			
          <table class="table table-striped mb30">
            <thead>
              <tr>
                <th>messageId</th>
                <th>消息内容</th>
                <th>消息等级</th>
                <th>发送时间</th>
              </tr>
            </thead>
            <tbody id="noticeBody">
              <tr>
                <td>1</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <td>2</td>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <td>3</td>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
          </table>
			
		</div>
    </div>
  </div>
</div><!--Big Modal For MessageList-->

<script src="/dreport/js/jquery-1.11.1.min.js"></script>
<script src="/dreport/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/dreport/js/jquery-ui-1.10.3.min.js"></script>
<script src="/dreport/js/bootstrap.min.js"></script>
<script src="/dreport/js/modernizr.min.js"></script>
<script src="/dreport/js/jquery.sparkline.min.js"></script>
<script src="/dreport/js/toggles.min.js"></script>
<script src="/dreport/js/retina.min.js"></script>
<script src="/dreport/js/jquery.cookies.js"></script>

<script src="/dreport/js/flot/jquery.flot.min.js"></script>
<script src="/dreport/js/flot/jquery.flot.resize.min.js"></script>
<script src="/dreport/js/flot/jquery.flot.spline.min.js"></script>
<script src="/dreport/js/morris.min.js"></script>
<script src="/dreport/js/raphael-2.1.0.min.js"></script>

<script src="js/custom.js"></script>
<script src="js/dashboard.js"></script>

<script src="/dreport/js/sweetalert.min.js"></script>

<div style="text-align:center;">
<p>来源：<a href="#" target="_blank">Dreport</a></p>
</div>
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
	
	function getNoticeRecord(event){
		//event.preventDefault();
		var xmlhttp;
		xmlhttp = new XMLHttpRequest;
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				//alert(xmlhttp.responseText);
				var noticeArray = JSON.parse(xmlhttp.responseText);
				//var tableBody = $('#noticeBody').get(0);
				var data = [];
				noticeArray.forEach(function (element) {
				  data.push('<tr>');
				  data.push('<td>' + element.nmId + '</td>');
				  data.push('<td class="task"><span class="hidesomeinfo">' + element.nmMessageContent + '</span></td>');
				  data.push('<td style="padding-top: 15px;"><span class="label ');
				  element.nmRank === 0 ? data.push('label-primary">提示') : data.push('label-danger">警告');
				  data.push('</td>');
				  data.push('<td>' + element.nmTime + '</td>');
				  data.push('</tr>');
				});
				document.getElementById('noticeBody').innerHTML = data.join('');
			}else if(xmlhttp.readyState==4 && xmlhttp.status!=200){
				swal("failed","服务器连接异常","success");
			}
		};
		xmlhttp.open("GET","/dreport/noticemessageController/querynoticerecord.action" + "?time=" + Math.random(),true);
		xmlhttp.send();
		//alert('sended!');
	}
	
		
	</script>
	<script>
	jQuery(document).ready(function() {
    
    "use strict";
	jQuery('.hidesomeinfo').tooltip({
      delay: {
        show: 800,
        hide: 0
      },
      title: function () {
        return $(this).text();
      }
    });
    })
	</script>
</html>
