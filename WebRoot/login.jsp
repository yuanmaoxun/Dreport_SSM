<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
      + request.getServerName() + ":" + request.getServerPort()
      + path + "/";
%>
    <!-- Author:高冬岩 该界面为用户登录界面 -->
    <!DOCTYPE>
    <html>

    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="shortcut icon" href="images/favicon.png" type="image/png">
      <title>欢迎进入dreport系统</title>
      <link href="/dreport/css/style.default.css" rel="stylesheet">
      <style>
      .ityped-cursor {
        font-size: 2.2rem;
        color: #888;
        opacity: 1;
        -webkit-animation: blink 0.3s infinite;
        -moz-animation: blink 0.3s infinite;
        animation: blink 0.3s infinite;
        animation-direction: alternate;
       }
       @keyframes blink {
    100% {
        opacity: 0;
    }
}

@-webkit-keyframes blink {
    100% {
        opacity: 0;
    }
}

@-moz-keyframes blink {
    100% {
        opacity: 0;
    }
}
      </style>
      <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
    <script src="/dreport/js/html5shiv.js"></script>
    <script src="/dreport/js/respond.min.js"></script>
    <![endif]-->
      <script src="/dreport/js/jquery-1.11.1.min.js"></script>
      <script type="text/javascript">
      $.validator.setDefaults({
        submitHandler: function() {
          alert("提交事件");
        }
      });
      $().ready(function() {
        $("#commentForm").validate();
      });
      </script>
    </head>

    <body class="signin">
      <section>
        <div class="signinpanel">
          <div class="row">
            <div class="col-md-7">
              <div class="signin-info">
                <div class="logopanel">
                  <h1>
                <span>[</span> Dreport
                <span>]</span>
              </h1>
                </div>
                <!-- logopanel -->
                <div class="mb20"></div>
                <h5><span id="ityped" class="ityped" style="height: 7px"></span> </h5>
                <ul>
                  <li>
                    <i class="fa fa-arrow-circle-o-right mr5"></i>查看工作内容
                  </li>
                  <li>
                    <i class="fa fa-arrow-circle-o-right mr5"></i>管理工作状态
                  </li>
                  <li>
                    <i class="fa fa-arrow-circle-o-right mr5"></i>工作不只是眼前的苟且
                  </li>
                  <li>
                    <i class="fa fa-arrow-circle-o-right mr5"></i>还是你的诗与远方
                  </li>
                </ul>
                <div class="mb20"></div>
              </div>
              <!-- signin0-info -->
            </div>
            <!-- col-sm-7 -->
            <div class="col-md-5">
              <form method="post" id="commentForm" action="${pageContext.request.contextPath }/employeeController/handlerLogin.action">
                <h4 class="nomargin">
              用户登录
            </h4>
                <p class="mt5 mb20">
                  请用你的账号进行登录.
                </p>
                <input type="text" name="userNum" class="form-control" minlength="5" maxlength="5" placeholder="用户名" required/>
                <input type="password" name="password" class="form-control" placeholder="密码" required />
                <input type="text" name="capTcha" class="form-control" placeholder="验证码" style="width:60%;vertical-align:middle;float:left;" minlength="6" maxlength="6" required/>
                <img src="/dreport/employeeController/captcha.action" width="100" height="40" id="captchaImage" style="vertical-align:middle;margin-top:15px" />
                <a href="" style="display:block"><small style="float:right;padding-bottom:5px">忘记密码？</small></a>
                <input type="submit" class="btn btn-success btn-block" value="登录" />
              </form>
            </div>
            <!-- col-sm-5 -->
          </div>
          <!-- row -->
          <div class="signup-footer">
            <div class="pull-left">
              &copy; 2017. 版权所有. Dreport
            </div>
            <div class="pull-right"></div>
          </div>
        </div>
        <!-- signin -->
      </section>
      <script src="/dreport/js/jquery-1.11.1.min.js"></script>
      <script type="text/javascript">
      $('#captchaImage').click(function() {
        $('#captchaImage').attr("src", "/dreport/employeeController/captcha.action?timestamp=" + (new Date()).valueOf());
      });
      </script>
      <!-- <script src="/dreport/js/jquery-1.11.1.min.js"></script> -->
      <script src="/dreport/js/jquery-migrate-1.2.1.min.js"></script>
      <script src="/dreport/js/bootstrap.min.js"></script>
      <script src="/dreport/js/modernizr.min.js"></script>
      <script src="/dreport/js/jquery.sparkline.min.js"></script>
      <script src="/dreport/js/jquery.cookies.js"></script>
      <script src="/dreport/js/toggles.min.js"></script>
      <script src="/dreport/js/retina.min.js"></script>
      <script src="/dreport/js/ityped.js"></script>
      <script src="/dreport/js/custom.js"></script>
      <script>
      jQuery(document).ready(function() {

        // Please do not use the code below
        // This is for demo purposes only
        ityped.init('#ityped', {
          strings: ['欢迎来到 Dreport 办公系统', 'Dreport 办公系统是一个功能完备的日报管理系统', '在这里你可以方便快捷的进行办公'],
          startDelay: 200,
          loop: true
        });
        var c = jQuery.cookie('change-skin');
        if (c && c == 'greyjoy') {
          jQuery('.btn-success').addClass('btn-orange').removeClass(
            'btn-success');
        } else if (c && c == 'dodgerblue') {
          jQuery('.btn-success').addClass('btn-primary').removeClass(
            'btn-success');
        } else if (c && c == 'katniss') {
          jQuery('.btn-success').addClass('btn-primary').removeClass(
            'btn-success');
        }
      });
      </script>
    </body>

    </html>
