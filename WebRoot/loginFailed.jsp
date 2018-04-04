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

  <title>登录失败</title>

  <link href="/dreport/css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="notfound">





<section>
  
  <div class="notfoundpanel">
    <h1>登录失败!</h1>
    <h3>您的登录失败!</h3>
    <h4>请检查您的账号、密码、验证码是否正确 <br />点击这里重新登录:</h4>
    <form action="/dreport/login.jsp">
       <input type="submit" class="btn btn-success" value="返回登录"/>
    </form>
  </div><!-- notfoundpanel -->
  
</section>


<script src="/dreport/js/jquery-1.11.1.min.js"></script>
<script src="/dreport/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/dreport/js/bootstrap.min.js"></script>
<script src="/dreport/js/modernizr.min.js"></script>
<script src="/dreport/js/jquery.sparkline.min.js"></script>
<script src="/dreport/js/jquery.cookies.js"></script>

<script src="/dreport/js/toggles.min.js"></script>
<script src="/dreport/js/retina.min.js"></script>

<script src="/dreport/js/custom.js"></script>
<div style="text-align:center;">
<p>来源：Dreport</p>
</div>
<script>
    jQuery(document).ready(function(){
        "use strict";
        
        // Do not use the code below
        // For demo purposes only
        var c = jQuery.cookie('change-skin');
        if (c && c == 'katniss') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
        
    });
</script>

</body>
</html>
