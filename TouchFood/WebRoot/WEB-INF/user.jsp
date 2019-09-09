<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@page import="com.pojo.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>TouchéFood</title>
		
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">
		
		<!-- AOS -->
		<link rel="stylesheet" href="../js/dist/aos.css" />
		
		<!-- Stylesheet-->
		<link rel="stylesheet" type="text/css"  href="../css/style.css">
		<link rel="stylesheet" type="text/css" href="../css/login.css">
		<link rel="stylesheet" type="text/css" href="../css/publish.css">
		<link rel="stylesheet" type="text/css" href="../css/register.css">
		<link rel="stylesheet" type="text/css"  href="../css/user.css">
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
		
		<div class="container" style="">
			<div class="Cart">
				
				<div class="container" id="buy_div">
					<p>主页 | User</p>
					<hr />
				</div>
				<section class="middle">
					
					<div class="container container-small" style="background-color: white;border-radius: 5px;">
						
						<div id="myTabContent" class="tab-content form-mytable">
							<form action="/TouchFood/userlist/update" method="post" 
							class="form-horizontal tab-pane fade in active" id="normalregister" 
							enctype="multipart/form-data" onsubmit="return check();" style="margin-left: 50px;">
								<div class="form-group-img">
										<div class="col-sm-10">
											<div class="pb_tou">
												<div class="pb_rigth_tou_imgDiv" id="oDiv">
													<img class="img-circle pb_tou_img" src="../<%=session.getAttribute("tou_img")%>" alt="" style="opacity: 1">
												</div>
												
											</div>
										</div>
								</div>
								<div class="form-group">
									<input type="file"  id="oInput"  style="margin: 20px 100px;" name="tou_img" />
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="username1" placeholder="请输入手机号" value="<%=session.getAttribute("username")%>"  name="username" >
										<span id="username1Span"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="password1" placeholder="6-16位的英文字母、数字和特殊字符组成" value="<%=session.getAttribute("password")%>" name="password">
										<span id="password1Span"></span>
									</div>
								</div>
								<div class="form-group">
									<label  class="col-sm-2 control-label">确认密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="password2" placeholder="请再次输入您的密码" value="<%=session.getAttribute("password")%>" name="password2">
										<span id="password2Span"></span>
									</div>
								</div>
				
								
								<div class="form-group">
									<label class="control-label col-sm-2">性别</label>
									<div class="col-sm-10">
										<c:if test="${sex=='男'}">
										<label class="radio-inline"> <input type="radio"
											name="sex" id="radio3" value="男" checked> <span
											class="fa fa-mars" style="color: #1067DD;"></span>
										</label>
										<label class="radio-inline"> <input type="radio"
											name="sex" id="radio4" value="女">
											<span class="fa fa-venus" style="color: #D386B1;"></span>
										</label>
									</c:if>

									<c:if test="${sex=='女'}">
										<label class="radio-inline"> <input type="radio"
											name="sex" id="radio3" value="男" > <span
											class="fa fa-mars" style="color: #1067DD;"></span>
										</label>
										<label class="radio-inline"> <input type="radio"
											name="sex" id="radio4" value="女" checked> <span
											class="fa fa-venus" style="color: #D386B1;"></span>
										</label>
									</c:if>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">年龄</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="age1" placeholder="请输入您的年龄" value="<%=session.getAttribute("age")%>"  name="age">
										<span id="age1Span"></span>
				
									</div>
								</div>
								<div class="form-group">
									<label  class="col-sm-2 control-label">Q Q</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="phone2" placeholder="请输入您的QQ" value="<%=session.getAttribute("qq")%>"  name="qq">
										<span id="phone2Span"></span>
									</div>
								</div>	
				
								<div class="form-group">
									<label  class="col-sm-2 control-label">邮箱</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="address" placeholder="请输入您的邮箱" value="<%=session.getAttribute("eMail")%>"  name="e_mail">
										<span id="addressSpan"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label  class="col-sm-2 control-label">地址</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="uaddress" placeholder="请输入您的邮箱" value="<%=session.getAttribute("uaddress")%>"  name="uaddress">
									</div>
								</div>
								
								

								<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<button type="submit" class="btn btn-default btn-block re_btn"
										 >提交</button>
								</div>
							</div>
						</form>
					</div>
				</section>	
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
		<script type="text/javascript" src="../js/main.js"></script>
		<script type="text/javascript" src="../js/index.js"></script>
		<script type="text/javascript" src="../js/back_top.js"></script>
		<script type="text/javascript" src="../js/scroll.js"></script>
		
		<script type="text/javascript">  
				document.getElementById("oInput").addEventListener("change",function(e){  
					var files = this.files;  
					  
					var img = new Image();  
					var render  = new FileReader();  
					render.readAsDataURL(files[0]);  
					render.onloadstart = function(){  
		//              alert("start")  
					};  
					render.onload = function(){  
						img.src = this.result;  
						img.style.height = "100%";  
						img.style.width = "100%";  
						var oDiv = document.getElementById("oDiv");  
						oDiv.innerHTML = "";  
						  
						oDiv.appendChild(img);  
		//              alert("success");  
					};  
					render.onloadend = function(){  
		//              alert("end");  
					}  
				});  
			</script>
			
			<script type="text/javascript">
			function check(){
				if(document.getElementById("oInput").value == ""){
					alert("请选择图片");
					return false;
				}
				return true;
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
	</body>
</html>
