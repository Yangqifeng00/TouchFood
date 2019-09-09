<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>TouchéFood-Login</title>
		
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">
		
		<!-- Stylesheet-->
		<link rel="stylesheet" type="text/css" href="../css/login.css">
	</head>
	<body>
		<div class="bg_img"></div>
		<section class="middle">
			<div class="middle_title">
				<p style="font-weight: 600;color: white;text-shadow: 1px 1px 1px #fff">TouchéFood</p>
			</div>
			
			<div class="container container-small" style="background-color: white;border-radius: 5px;">
				<ul id="myTab" class="nav nav-pills ">
					<li class="active">
						<a href="#normalregister" data-toggle="tab" style="background-color: #8eb640;margin-left: 10px;">用户登陆</a>
					</li>
				</ul>
				<hr>
				<div id="myTabContent" class="tab-content">
					<form action="/TouchFood/userlist/Login" method="post" class="form-horizontal tab-pane fade in active" id="normalregister" role="form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail3" placeholder="用户名/手机/邮箱" name="username">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputPassword3" placeholder="请输入您的密码" name="password">
							</div>
						</div>
						<div class="a-group">
							<a href="/TouchFood/jspController/register.do">没有账号？</a>
							<a href="#">忘记密码？</a>
						</div>
						<hr>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-4">
								<button type="submit" class="btn btn-default btn-block">登录</button>
							</div>
						</div>
					</form>
			
				</div>
			</div>
		</section>
	
		<script type="text/javascript" src="../js/jquery.1.11.1.js"></script> 
		<script type="text/javascript" src="../js/bootstrap.js"></script>
	</body>
</html>
