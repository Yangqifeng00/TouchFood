<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
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
		<title>TouchéFood</title>
		
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">
		<!-- AOS -->
		<link rel="stylesheet" href="../js/dist/aos.css" />
		
		<!-- Stylesheet-->
		<link rel="stylesheet" type="text/css"  href="../css/style.css">
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
		<nav id="menu" class="navbar navbar-default navbar-fixed-top">
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
				<li><a href="#about" class="page-scroll">关于我们</a></li>
				<li><a href="#portfolio" class="page-scroll">商品展示</a></li>
				<li><a href="#restaurant-menu" class="page-scroll">菜单</a></li>
				<li><a href="#Call_contact" class="page-scroll">联系我们</a></li>
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
		<!-- Header -->
		<header id="header">
		  <div class="intro">
			<div class="overlay">
			  <div class="container">
				<div class="row header-text">
				  <div class="intro-text">
					<h1>TouchéFood</h1>
					<p> Coffee / Life / Food </p>
					<a href="#about" class="btn btn-custom btn-lg page-scroll">开启美食之旅</a> 
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</header>
		
		<!-- About Section -->
		<div id="about" >
			<div class="container" aos="fade-right">
				<div class="row">
					<div class="col-xs-12 col-md-6 ">
						<div class="about-img"><img src="../img/about.jpg" class="img-responsive" alt=""></div>
					</div>
					<div class="col-xs-12 col-md-6">
						<div class="about-text">
							<h2>关于我们</h2>
							<hr>
							<p>公司本着信誉第一、服务第一，客户至上的宗旨，秉承“顾客至上，锐意进取”的经营理念，把诚信作为公司生存的根本。一切为客户的满意度努力，一切为企业的长期健康的发展而努力</p>
							<h3>注重生活</h3>
							<p>在尘嚣中度过每日的虚华。是否已忘记了生活的本质？当你不忍自我在流年中消逝，请来到这里，品一杯人生的浓诗。</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container" aos="fade-up">
				<div class="comm-content">
					<ul class="comm-content-list clearfix">
						<li>
							<div class="comm-list-item">
								<img src="../img/admin.jpg" alt="">
								<p>杨起凤</p>
								<div class="comm-list-cont">
									<div class="comm-list-text">
										<p>杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤杨起凤</p>
										<div>
											<a href="#" class="comm-go-home">访问个人主页</a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="comm-list-item">
								<img src="../img/admin.jpg" alt="">
								<p>陈敏</p>
								<div class="comm-list-cont">
									<div class="comm-list-text">
										<p>陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏陈敏</p>
										<div>
											<a href="#" class="comm-go-home">访问个人主页</a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="comm-list-item">
								<img src="../img/admin.jpg" alt="">
								<p>康彦婷</p>
								<div class="comm-list-cont">
									<div class="comm-list-text">
										<p>康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷康彦婷</p>
										<div>
											<a href="#" class="comm-go-home">访问个人主页</a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="comm-list-item">
								<img src="../img/admin.jpg" alt="">
								<p>祖哈利亚</p>
								<div class="comm-list-cont">
									<div class="comm-list-text">
										<p>祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚祖哈利亚</p>
										<div>
											<a href="#" class="comm-go-home">访问个人主页</a>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		
		
		<!-- food Section -->
		<div id="portfolio">
			<div class="section-title text-center center">
				<div class="overlay">
					<h2>商品展示</h2>
					<hr>
					<p>品质生活，品味人生</p>
				</div>
			</div>
			<div class="container">
				
				<div class="row">
					<div class="portfolio-items">
						<c:forEach items="${commoditys}" var="commoditys" varStatus="st">
							<div class="col-sm-6 col-md-4 col-lg-4" aos="zoom-in">
								<div class="portfolio-item">
									<div class="hover-bg"> 
										<a href="../${commoditys.lgImg}" title="Dish Name" data-lightbox-gallery="gallery1">
										<div class="hover-text">
											<p class="product-price">${commoditys.price}<sup>$</sup></p>
										</div>
										<h3 class="product-name">${commoditys.name}</h3>
										<p class="product-category">Category</p>
										<img src="../${commoditys.smImg}" class="img-responsive" alt="Project Title"> </a> 
									</div>
								</div>
							</div>
						</c:forEach>
		
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- Restaurant Menu Section -->
		<div id="restaurant-menu">
			<div class="section-title text-center center">
				<div class="overlay">
					<h2>菜单</h2>
					<hr>
					<p>品质生活，品味人生</p>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="menu-section">
							<h2 class="menu-section-title">早餐</h2>
							<hr>
							
							<c:forEach items="${commoditys}" var="commoditys" varStatus="st">
           						<c:set var="type" scope="session" value="${commoditys.type}"/>
          							<c:if test="${type == 1}">
									<div class="menu-item" aos="fade-down-right">
									<a href="/TouchFood/commodity_info/queryById?id=${commoditys.id}">
										<div class="menu-item_img">
											<img src="../${commoditys.smImg}" />
										</div>
										<div class="menu-item_desc">
											<div class="menu-item-name"> ${commoditys.name} </div>
											<div class="menu-item-price"> $ ${commoditys.price} </div>
											<div class="menu-item-description"> ${commoditys.desc} </div>
										</div>
									</a>
									</div>
								</c:if>
          					</c:forEach>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6">
						<div class="menu-section">
							<h2 class="menu-section-title">午餐</h2>
							<hr>
							
							<c:forEach items="${commoditys}" var="commoditys" varStatus="st">
           						<c:set var="type" scope="session" value="${commoditys.type}"/>
          							<c:if test="${type == 2}">
									<div class="menu-item" aos="fade-down-left">
										<a href="/TouchFood/commodity_info/queryById?id=${commoditys.id}">
										<div class="menu-item_img">
											<img src="../${commoditys.smImg}" />
										</div>
										<div class="menu-item_desc">
											<div class="menu-item-name"> ${commoditys.name} </div>
											<div class="menu-item-price"> $ ${commoditys.price} </div>
											<div class="menu-item-description"> ${commoditys.desc} </div>
										</div>
									</a>
									</div>
								</c:if>
          					</c:forEach>
							
							
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="menu-section">
							<h2 class="menu-section-title">晚餐</h2>
							<hr>
							<c:forEach items="${commoditys}" var="commoditys" varStatus="st">
           						<c:set var="type" scope="session" value="${commoditys.type}"/>
          							<c:if test="${type == 3}">
									<div class="menu-item" aos="fade-down-right">
										<a href="/TouchFood/commodity_info/queryById?id=${commoditys.id}">
										<div class="menu-item_img">
											<img src="../${commoditys.smImg}" />
										</div>
										<div class="menu-item_desc">
											<div class="menu-item-name"> ${commoditys.name} </div>
											<div class="menu-item-price"> $ ${commoditys.price} </div>
											<div class="menu-item-description"> ${commoditys.desc} </div>
										</div>
									</a>
									</div>
								</c:if>
          					</c:forEach>
						
						</div>
					</div>
					<div class="col-xs-12 col-sm-6">
						<div class="menu-section">
							<h2 class="menu-section-title">饮品</h2>
							<hr>
							<c:forEach items="${commoditys}" var="commoditys" varStatus="st">
           						<c:set var="type" scope="session" value="${commoditys.type}"/>
          							<c:if test="${type == 4}">
									<div class="menu-item" aos="fade-down-left">
										<a href="/TouchFood/commodity_info/queryById?id=${commoditys.id}">
										<div class="menu-item_img" >
											<img src="../${commoditys.smImg}" />
										</div>
										<div class="menu-item_desc">
											<div class="menu-item-name"> ${commoditys.name} </div>
											<div class="menu-item-price"> $ ${commoditys.price} </div>
											<div class="menu-item-description"> ${commoditys.desc} </div>
										</div>
										</a>
									</div>
								</c:if>
          					</c:forEach>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="footer">
		  <div class="container text-center" id="Call_contact">
			<div class="col-md-4">
			  <h3>地址</h3>
			  <div class="contact-item">
				<p>443000 大学路8号,</p>
				<p>西陵区西陵街道</p>
			  </div>
			</div>
			<div class="col-md-4">
			  <h3>工作时间</h3>
			  <div class="contact-item">
				<p>Mon-Thurs: 10:00 AM - 11:00 PM</p>
				<p>Fri-Sun: 11:00 AM - 02:00 AM</p>
			  </div>
			</div>
			<div class="col-md-4">
			  <h3>联系信息</h3>
			  <div class="contact-item">
				<p>Phone: +1 123 456 1234</p>
				<p>Email: info@xxx.com</p>
			  </div>
			</div>
		  </div>
		  <div class="container-fluid text-center copyrights">
			<div class="col-md-8 col-md-offset-2">
			  <div class="social">
				<ul>
				  <li><a href="#"><i class="fa fa-facebook" style="padding: 10px 15px;"></i></a></li>
				  <li><a href="#"><i class="fa fa-twitter"></i></a></li>
				  <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				</ul>
			  </div>
			  <p>&copy; 科技公司 版权所有  2008-2016 湘ICP备8888888  Powered by MetInfo 5.3.17</p>
			</div>
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
