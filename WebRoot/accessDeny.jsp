<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

  <title>抱歉，您的权限不够</title>

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
    <h1>403!</h1>
    <h3>访问拒绝!</h3>
    <h4>您的权限不足，无法访问此模块</h4>
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
</div>

</body>
</html>
