<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.pojo.*"%>
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
		<title>TouchéFood-buyCart</title>
		
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">
		
		<!-- Stylesheet-->
		<link rel="stylesheet" type="text/css"  href="../css/style.css">
		<link rel="stylesheet" type="text/css"  href="../css/buy.css">
		<link rel="stylesheet" type="text/css" href="../css/nivo-lightbox/nivo-lightbox.css">
		<link rel="stylesheet" type="text/css" href="../css/nivo-lightbox/default.css">
		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">
		<style type="text/css">
			.login_ul:hover .login_ul_li{
				opacity: 1;
				filter: alpha(opacity=1);
				height: auto;
			}
		</style>
	</head>
	<body data-spy="scroll" data-target=".navbar-fixed-top" class="index-page">
		<!-- Navigation-->
		<nav id="menu" class="navbar navbar-default on1">
		  <div class="container"> 
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">TouchéFood</a> 
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			  <ul class="nav navbar-nav navbar-right">
				<li><a href="/TouchFood/jspController/index" class="page-scroll">关于我们</a></li>
				<li><a href="/TouchFood/jspController/index" class="page-scroll">菜单</a></li>
				<li><a href="/TouchFood/jspController/index" class="page-scroll">商品展示</a></li>
				<li><a href="/TouchFood/jspController/index" class="page-scroll">联系我们</a></li>
				<%if(session.getAttribute("username") == null){ %>
					<li class="login_ul">
						<a href="#call-login" class="page-scroll">登录</a>
						<ul class="login_ul_li">
							<li style="font-size:15px;"><a href="/TouchFood/jspController/login.do">登录</a></li>
							<li style="font-size:15px;"><a href="/TouchFood/jspController/register.do">注册</a></li>
						</ul>
					</li>
				<% 	}else{ %>
					<li class="login_ul">
						<a href="#call-login" class="page-scroll">
							嗨，<%=session.getAttribute("phoneNumber")%>
						</a>
						<ul class="login_ul_li">
							<li style="font-size:15px;"><a href="/TouchFood/jspController/login.do">个人主页</a></li>
							<li style="font-size:15px;"><a href="/TouchFood/jspController/buyCart">购物车</a></li>
							<li style="font-size:15px;"><a href="/TouchFood/orderlist/Findorderlist">订单</a></li>
						</ul>
					</li>
				<%} %>
			  </ul>
			</div>
		  </div>
		</nav>
		
		<div class="container" style="margin-top: 50px;">
			 <div class="container" id="buy_div">
				<p>购物车 | Shopping Cart</p>
				<hr />
			</div>
			
			<div class="table-responsive tab-pane fade in active"  id="MyShopping">
				<table class="table" style="margin: 20px 0 20px 0;">
					<!-- <p style="font-size: 18px;font-weight: 600;">订单</p>
					<hr /> -->
					<thead>
						<tr>
							<th>商品图片</th>
							<th>商品名称</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${ois}" var="oi" varStatus="st">
							<tr>
								<td class="buyCar-img" style="width: 150px;"><img src="../${oi.commodity.smImg}" /></td>
								<td style="line-height: 60px;">${oi.commodity.name}</td>
								<td style="line-height: 60px;">${oi.commodity.price}</td>
								<td style="line-height: 60px;">${oi.num}</td>
								<td style="line-height: 60px;">${oi.commodity.price*oi.num}</td>
								<td style="line-height: 60px;"><a href="/TouchFood/orderitem/delete?pid=${oi.commodity.id}">删除</a></td>
							</tr>
						</c:forEach>

					</tbody>
							
					<c:if test="${!empty ois}">
						<tr>
							<td colspan="4" align="right" onclick="create()"><a href="/TouchFood/order/insertlist">生成订单</a>
							</td>
						</tr>
					</c:if>
							
				</table>
			</div>
		
		</div>
		
		<!-- 返回顶部-->
		<div class="back_top" id="back_top" style="opacity: 0.5"></div>
		
		<script type="text/javascript" src="../js/jquery.1.11.1.js"></script> 
		<script type="text/javascript" src="../js/bootstrap.js"></script> 
		<script src="../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/SmoothScroll.js"></script> 
		<script type="text/javascript" src="../js/nivo-lightbox.js"></script> 
		<script type="text/javascript" src="../js/jquery.isotope.js"></script> 
		<script type="text/javascript" src="../js/jqBootstrapValidation.js"></script> 
		<script type="text/javascript" src="../js/contact_me.js"></script> 
		<script type="text/javascript" src="../js/main.js"></script>
		<script type="text/javascript" src="../js/index.js"></script>
		<script type="text/javascript" src="../js/back_top.js"></script>
		<script type="text/javascript" src="../js/scroll.js"></script>

	</body>
</html>
