<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
 <%@page import="com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Date date = new Date();
	String nowDate = sdf.format(date);
%>

<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>TouchéFood-Detail</title>
		
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">
		
		<!-- AOS -->
		<link rel="stylesheet" href="../js/dist/aos.css" />
		
		<!-- Stylesheet-->
		<link rel="stylesheet" type="text/css"  href="../css/style.css">
		<link rel="stylesheet" type="text/css"  href="../css/buy.css">
		<link rel="stylesheet" type="text/css"  href="../css/detail.css">
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
	<%
		CommodityInfo commodity = ((CommodityInfo)request.getAttribute("var"));
	
		
	%>
		<!-- Navigation-->
		<nav id="menu" class="navbar navbar-default on1" style="clear: all;">
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
				<li><a href="/TouchFood/commodity_info/ListCommodity.do" class="page-scroll">关于我们</a></li>
				<li><a href="/TouchFood/commodity_info/ListCommodity.do" class="page-scroll">商品展示</a></li>
				<li><a href="/TouchFood/commodity_info/ListCommodity.do" class="page-scroll">菜单</a></li>
				<li><a href="/TouchFood/commodity_info/ListCommodity.do" class="page-scroll">联系我们</a></li>
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
							<input type="hidden" id="username1" value=<%=session.getAttribute("username")%> />
						</a>
						<ul class="login_ul_li">
							<li style="font-size:15px;"><a href="/TouchFood/userlist/selfInfo">个人主页</a></li>
							<li style="font-size:15px;"><a href="/TouchFood/jspController/buyCart">购物车</a></li>
							<li style="font-size:15px;"><a href="/TouchFood/orderlist/Findorderlist">订单</a></li>
						</ul>
					</li>
				<%} %>
			  </ul>
			</div>
		  </div>
		</nav>
		
		<!-- 主体部分 -->
		<section class="head" style="margin-bottom: 20px;">
			<div class="container" id="buy_div">
				<p>菜品展示 | Dishes show</p>
				<hr />
			</div>
			<div class="detail-bg">
				<div class="detail-img">
					<p><%=commodity.getName() %></p>
					<img src="../<%=commodity.getLgImg() %>" />
				</div>
			</div>
				
			<div class="detail-form">
				<div class="col-md-7 col_md_section">
					<p><%=commodity.getDesc() %></p>
				</div>
				<div class="col-md-5">
					<form action="/TouchFood/orderlist/insert" method="post">
						<div class="buy_num">
								<span>数量：</span>
								<div class="buy_num_fun">
									<div class="buy_add minus" >-</div>
									<input type="hidden" name="pid" value="<%=commodity.getId()%>" />
									<input class="buy_num_value" id="numValue" type="text" 
										value="1" name="num" style="margin-left: -6px;border: 0;"/>
									<div class="buy_add add" style="float: right;">+</div>
								</div>
						</div>
						<button type="submit" class="btn btn-info" style="background-color: #8eb640;" onclick="tijiao()">购买</button>
					</form>
				</div>
			</div>
			</section>
			
			
			
			<section class="head" style="margin-bottom: 20px;">
				<div style="clear: all ;"></div>
				<div class="container" id="buy_div">
					<p>评价 | comments</p>
					<hr />
				</div>
				
				
				<div class="comment-box" style="width: 60%;">
					
						<c:forEach items="${messagesadd}" var="messagesadd" varStatus="st">
							<div class="comment-list" aos="flip-up">
								<div class="comment-list-left">
									<img src="../img/admin.jpg" class="img-circle"/>
								</div>
								<div style="clear: none ;"></div>
								<div class="comment-list-right">
									<small> ${messagesadd.username}</small> &nbsp;<small> ${messagesadd.messTime}</small>
									<br />
									<p style="font-size: 15px;"> ${messagesadd.content}</p>
								</div>
							</div>
						</c:forEach>
					
				</div>
				
			</section>
			<form action="/TouchFood/message/insert" method="post" target="nm_iframe"  id="messagesubmit">
				<div class="comment-box detail-form">
					<textarea cols="80" rows="5" placeholder="请输入您的评价..." name = "content" id = "contents"></textarea>
					<input name="pid" value="<%=commodity.getId() %>" hidden="hidden"/>
					<input name="messTime" value="<%=nowDate%>" hidden="hidden"/>
					<button type="button" onclick="meaasgeFlesh()">提交</button>
				</div>
			</form>
			<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
		
		<!-- 返回顶部-->
		<div class="back_top" id="back_top" style="opacity: 0.5"></div>
		
		<script type="text/javascript" src="../js/jquery.1.11.1.js"></script> 
		<script type="text/javascript" src="../js/bootstrap.js"></script> 
		<script src="../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/SmoothScroll.js"></script> 
		<script type="text/javascript" src="../js/nivo-lightbox.js"></script> 
		<script type="text/javascript" src="../js/jquery.isotope.js"></script> 
		<script type="text/javascript" src="../js/jqBootstrapValidation.js"></script> 
		<script type="text/javascript" src="../js/main.js"></script>
		<script type="text/javascript" src="../js/index.js"></script>
		<script type="text/javascript" src="../js/back_top.js"></script>
		<script type="text/javascript">
			(function(){
				var val = $(".buy_num_value").val();
				
				$(".add").click(function(){
				val++;
				$(".buy_num_value").val(val);
				})
				$(".minus").click(function(){
				if(val > 1){
				val--;
				$(".buy_num_value").val(val);
				}else{
				$(".buy_num_value").val(1);
				}
				})
				})();
		</script>
		<script type="text/javascript">
			var flag1 = false;
			var flag2 = false;
			$(function(){
				var username1 = document.getElementById("username1").value.trim();
				if(username1 == null){
					flag1 =false;
				}else if(username1 != null){
					flag1 =true;
				}
			});
		
			function meaasgeFlesh(){
				parent.document.location.reload();
				var contents = document.getElementById("contents").value.trim();
				
				if(flag1 && contents != ''){
					$("#messagesubmit").submit();
					parent.document.location.reload();
				}else if(!flag1){
					alert("请先登录！");
					
				}else if(flag1 && contents == ''){
					alert("评论为空！");	
				}
				
			}
		</script>
		
		<!-- AOS -->
		<script src="../js/jquery-2.1.1.min.js"></script>
		<script src="../js/highlight.min.js"></script>
		<script src="../js/dist/aos.js"></script>
		
		
		<script>
			AOS.init({
				easing: 'ease-out-back',
				duration: 1000
			});
		</script>
		
		<script type="text/javascript">
		
			
			
		</script>
		
	</body>
</html>
