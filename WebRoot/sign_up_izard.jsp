<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="/dreport/images/favicon.png" type="image/png">
  <title>日报制定</title>
  <link rel="stylesheet" href="/dreport/css/sweetalert.css">
  <link rel="stylesheet" href="/dreport/css/style.default.css" />
  <link rel="stylesheet" href="/dreport/css/bootstrap-timepicker.min.css" />
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
  <script src="/dreport/js/jquery-1.11.1.min.js">
</script>
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
      </div>
      <!-- logopanel -->
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
        <li><a href="/dreport/index.jsp"><i class="fa fa-home"></i> <span>主页</span></a></li>
        <li class="nav-parent"><a href="#"><i class="fa fa-edit"></i> <span>日报管理</span></a>
          <ul class="children">
            <li><a href="/dreport/authority/writeJournal.action"><i class="fa fa-caret-right"></i>撰写日报</a></li>
            <li><a href="/dreport/authority/queryJournal.action"><i class="fa fa-caret-right"></i>查询日报</a></li>
            <li><a href="/dreport/authority/checkJournal.action"><i class="fa fa-caret-right"></i>审核日报</a></li>
          </ul>
        </li>
        <li class="active"><a href="/dreport/authority/journalSignup.action"><i class="fa fa-th-list"></i> <span>日报设定</span></a></li>
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
        <h2><i class="fa fa-home"></i>日报制定 <span>请按照需求设定日报</span></h2>
        <div class="breadcrumb-wrapper">
          <span class="label">您现在在:</span>
          <ol class="breadcrumb">
            <li><a href="/dreport/index.jsp">Dreport</a></li>
            <li class="active">日报制定</li>
          </ol>
        </div>
      </div>
      <div class="contentpanel">
        <div class="panel panel-default">
          <div class="panel-heading">
            <div class="panel-btns">
              <a href="" class="panel-close">×</a>
              <a href="" class="minimize">−</a>
            </div>
            <h4 class="panel-title">设定新日报</h4>
            <p>请输入需要设定的日报的基本信息</p>
          </div>
          <div class="panel-body panel-body-nopadding">
            <!-- BASIC WIZARD -->
            <div id="progressWizard" class="basic-wizard">
              <ul class="nav nav-pills nav-justified">
                <li class="active"><a href="#ptab1" data-toggle="tab"><span>Step 1:</span> 设定组别</a></li>
                <li><a href="#ptab2" data-toggle="tab"><span>Step 2:</span> 设定项目</a></li>
              </ul>
              <div class="tab-content">
                <div class="progress progress-striped">
                  <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 33.3333%;"></div>
                </div>
                <div class="tab-pane active" id="ptab1">
                  <form class="form" id="WGForm" onsubmit="return Check()">
                    <div class="form-group">
                      <label class="col-sm-4" style="width:200px; ">组别名称 <span class="asterisk">*</span></label><div id="groupId"style="float:left"></div>
                      <div class="col-sm-8" style="float:right">
                        <input type="text" name="groupName" class="form-control" required="required" id="groupName" onblur="groupNameBlur()" onfocus="groupNameFocus()">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4">备注</label>
                      <div class="col-sm-8">
                        <input type="text" name="remarks" class="form-control">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4"  style="width:200px; ">组长名称 <span class="asterisk">*</span></label><div id="empId"style="float:left"></div>
                      <div class="col-sm-8" style="float:right;">
                        <input id="employer" type="hidden" class="select2" required="required" id="emp" onblur="empBlur()">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4">员工名称 <span class="asterisk">*</span></label>
                      <div class="col-sm-8">
                        <input id="employee" type="hidden" class="select2" required="required">
                      </div>
                    </div>
                  </form>
                </div>
                <div class="tab-pane" id="ptab2">
                  <form class="form">
                    <div class="form-group">
                      <label class="col-sm-4 control-label" for="disabledinput">工作组 ID</label>
                      <div class="col-sm-8">
                        <input type="text" id="groupId" class="form-control" disabled="">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4">项目名称 <span class="asterisk">*</span></label>
                      <div class="col-sm-8">
                        <input type="text" name="proName" class="form-control" required="required">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4">开始时间 <span class="asterisk">*</span></label>
                      <div class="col-sm-8">
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="curTime">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4">结束时间  <span class="asterisk">*</span></label>
                      <div class="col-sm-8">
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="mm/dd/yyyy" id="tarTime">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-4">PRP 阶段 <span class="asterisk">*</span></label>
                      <div class="col-sm-8">
                        <table class="table mb30" id="prp">
                          <thead>
                            <tr>
                              <th>名称</th>
                              <th>缩写</th>
                              <th>备注</th>
                              <th>#</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>
                                <input type="text" class="form-control">
                              </td>
                              <td>
                                <input type="text" class="form-control">
                              </td>
                              <td>
                                <input type="text" class="form-control">
                              </td>
                              <td style="vertical-align: middle;">
                                <a class="glyphicon glyphicon-plus"></a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
              <!-- tab-content -->
              <ul class="pager wizard">
                <li class="previous disabled"><a href="javascript:void(0)">上一步</a></li>
                <li class="next"><a href="javascript:void(0)">下一步</a></li>
                <li class="finish hidden" style="float: right;"><a href="javascript:void(0)">完成</a></li>
              </ul>
            </div>
            <!-- #basicWizard -->
          </div>
          <!-- panel-body -->
        </div>
        <!-- content goes here... -->
      </div>
    </div>
    <!-- mainpanel -->
  </section>
  <script src="/dreport/js/jquery-migrate-1.2.1.min.js">
</script>
  <script src="/dreport/js/bootstrap.min.js">
</script>
  <script src="/dreport/js/modernizr.min.js">
</script>
  <script src="/dreport/js/jquery.sparkline.min.js">
</script>
  <script src="/dreport/js/toggles.min.js">
</script>
  <script src="/dreport/js/retina.min.js">
</script>
  <script src="/dreport/js/jquery.cookies.js">
</script>
  <script src="/dreport/js/bootstrap-wizard.min.js">
</script>
  <script src="/dreport/js/select2.min.js">
</script>
  <script src="/dreport/js/jquery.validate.min.js">
</script>
  <script src="/dreport/js/custom.js">
</script>
  <script src="/dreport/js/jquery-ui-1.10.3.min.js">
</script>
  <script src="/dreport/js/sweetalert.min.js">
</script>

<script>
jQuery(document).ready(function() {
    "use strict";
    // Date Picker
    jQuery('#curTime').datepicker();
    jQuery('#tarTime').datepicker();
    $.ajax({
        url: "/dreport/projectsController/queryEmployer.action",
    }).done(function(data) {
        var result = JSON.parse(data);
        jQuery("#employer").select2({
            id: 'empId',
            data: result,
            width: '100%',
            minimumResultsForSearch: -1,
            formatSelection: function(item) {
                return item.empUsername;
            },
            formatResult: function(item) {
                return item.empUsername;
            }
        });
    });
    
    $.ajax({
        url: "/dreport/projectsController/queryEmployee.action",
    }).done(function(data) {
        var result = JSON.parse(data);
        jQuery("#employee").select2({
            id: 'empId',
            data: result,
            width: '100%',
            multiple: true,
            minimumResultsForSearch: -1,
            formatSelection: function(item) {
                return item.empUsername;
            },
            formatResult: function(item) {
                return item.empUsername;
            }
        });
    
    
    });
    function addPRP() {
        var node = '<tr><td><input type="text" class="form-control"></td>\
                      <td><input type="text" class="form-control"></td>\
                      <td><input type="text" class="form-control"></td>\
                      <td style="vertical-align: middle;">\
                      <a class="glyphicon glyphicon-plus"></a>\
                      <a class="glyphicon glyphicon-minus"></a></td></tr>';
        $('.glyphicon-plus').parent().parent().after(node);
        $('.glyphicon-plus').first().remove();
        $('tr').length === 3 || $('.glyphicon-minus').first().remove();
        $('.glyphicon-plus').last().bind('click', addPRP);
        $('.glyphicon-minus').last().bind('click', delPRP);
    }
    
    function delPRP() {
        $('.glyphicon-minus').last().parent().parent().prev().find('td').last().append('<a class="glyphicon glyphicon-plus"></a><a class="glyphicon glyphicon-minus"></a>');
        $('tr').length !== 3 || $('.glyphicon-minus').first().remove();
        $('.glyphicon-minus').last().parent().parent().remove();
        $('.glyphicon-plus').last().bind('click', addPRP);
        $('.glyphicon-minus').last().bind('click', delPRP);
    }
    $('.glyphicon-plus').bind('click', addPRP);
    $('.glyphicon-minus').bind('click', delPRP);
})
</script>

<script>
jQuery(document).ready(function() {
    
    "use strict";
    // Date Picker
    // console.log(jQuery('#curTime').datepicker());
    // jQuery('#curTime').datepicker();
    
    
    // Progress Wizard
    $('#progressWizard').bootstrapWizard({
        'nextSelector': '.next',
        'previousSelector': '.previous',
        onTabClick: function(tab, navigation, index) {
            return false;
        },
        onNext: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;
            var $percent = ($current / $total) * 100;
            jQuery('#progressWizard').find('.progress-bar').css('width', $percent + '%');
            if (index === 1) {
                $('#progressWizard .next').addClass('hidden');
                $('#progressWizard .finish').removeClass('hidden');
                var members = [];
                $('#employee').select2('data').forEach(function(element, index, array) {
                    var temp = {
                        "id": element.empId,
                        "name": element.empUsername
                    };
                    members.push(temp);
                });
                $.ajax({
                    type: 'POST',
                    data: {
                        groupName: $('input[name=groupName]').val(),
                        remarks: $('input[name=remarks]').val(),
                        leader: $('#employer').select2('data').empId,
                        members: JSON.stringify(members)
                    },
                    url: '/dreport/projectsController/sign-up-workgroup.action',
                }).done(function(data) {
                    $('#groupId').attr('placeholder', data);
                });
            }
        },
        onPrevious: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;
            var $percent = ($current / $total) * 100;
            jQuery('#progressWizard').find('.progress-bar').css('width', $percent + '%');
            $('#progressWizard .next').hasClass('hidden') && $('#progressWizard .next').removeClass('hidden');
            //toggle next and finish
            $('#progressWizard .finish').hasClass('hidden') || $('#progressWizard .finish').addClass('hidden');
        },
        onTabShow: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;
            var $percent = ($current / $total) * 100;
            jQuery('#progressWizard').find('.progress-bar').css('width', $percent + '%');
        }
    });
    $('#progressWizard .finish').click(function() {
        var prp = [];
        $('#prp tbody tr').each(function() {
            var temp = {
                name: $(this).children().children('input')[0].value,
                thumbnail: $(this).children().children('input')[1].value,
                remarks: $(this).children().children('input')[2].value
            }
            prp.push(temp);
        })
        $.ajax({
            type: 'POST',
            data: {
                proName: $('input[name=proName]').val(),
                startTime: $('#curTime').val(),
                endTime: $('#tarTime').val(),
                workgroup: $('#groupId').attr('placeholder'),
                prpStage: JSON.stringify(prp)
            },
            url: '/dreport/projectsController/sign-up-project.action',
        }).done(function(data) {
            swal({
                title: "添加完毕",
                text: "2秒后自动关闭",
                type: "success",
                timer: 3000,
                showConfirmButton: false
            });
        });
    
    });


});
</script>
</body>
<script>
function groupNameFocus(){
	var $groupId=$("#groupId");
	$groupId.text('请输入组别名称');
}

function groupNameBlur(){
	var $groupName=$("#groupName");
	var $groupId=$("#groupId");
	var reg=/^[\u4E00-\u9FFF]+$/;
	if(reg.test(groupName.value)===false){
		$groupId.text('请输入汉字');
		return false;
	}
	$groupId.text('正确');
	return true;

}
function empBlur(){
	var $emp=$("#emp");
	var $empId=$("#empId");
	if($emp.val()===''){
		$empId.text('请输入员工名');
		return false;
	}
	$empId.text('正确');
	return true;

}
</script>

</html>
