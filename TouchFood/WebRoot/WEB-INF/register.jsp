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
		<title>TouchéFood-Register</title>
		
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">
		
		<!-- Stylesheet-->
		<link rel="stylesheet" type="text/css" href="../css/login.css">
		<link rel="stylesheet" type="text/css" href="../css/publish.css">
		<link rel="stylesheet" type="text/css" href="../css/register.css">
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
						<a href="#normalregister" data-toggle="tab" style="background-color: #8eb640;margin-left: 10px;">用户注册</a>
					</li>
				</ul>
				<hr>
				<div id="myTabContent" class="tab-content">
					<form action="/TouchFood/userlist/insert.do" method="post" class="form-horizontal tab-pane fade in active" id="normalregister"   enctype="multipart/form-data" onsubmit="return check();">
						<div class="form-group line my_group"><span>必填项</span></div>
						<div class="form-group">
								<label class="col-sm-2 control-label">头像</label>
								<div class="col-sm-10">
									<div class="pb_tou">
										<div class="pb_rigth_tou_imgDiv" id="oDiv">
											<img class="img-circle pb_tou_img" src="../img/upload-bj.png" alt="">
										</div>
										<input type="file"  id="oInput"  style="margin-top: 10px;" name="tou_img" />
									</div>
								</div>
							</div>
							
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username1" placeholder="请输入手机号"  name="username" >
								<span id="username1Span"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password1" placeholder="6-16位的英文字母、数字和特殊字符组成" name="password">
								<span id="password1Span"></span>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password2" placeholder="请再次输入您的密码" name="password2">
								<span id="password2Span"></span>
							</div>
						</div>

						<div class="form-group line my_group"><span>选填项<input type="checkbox" onchange="$('#optional').toggle(100);" /></span></div>
						<div id="optional" hidden="hidden">
						
						<div class="form-group">
							<label class="control-label col-sm-2">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="sex" id="radio3" value="男" checked>	
									<span class="fa fa-mars" style="color: #1067DD;"></span>
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" id="radio4"  value="女"> <span class="fa fa-venus" style="color: #D386B1;"></span>
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="age1" placeholder="请输入您的年龄"  name="age" value="18">
								<span id="age1Span"></span>

							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">Q Q</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="phone2" placeholder="请输入您的QQ"  name="qq">
								<span id="phone2Span"></span>
							</div>
						</div>	

						<div class="form-group">
							<label  class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="address" placeholder="请输入您的邮箱"  name="e_mail">
								<span id="addressSpan"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label  class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="uaddress" placeholder="请输入您的地址"  name="uaddress">
							</div>
						</div>
						
						</div>
						<div class="a-group" style="margin-right: 7px;">
							<a href="/TouchFood/jspController/login.do">已有账号</a>
						</div>
						<hr>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-4">
								<button type="button" class="btn btn-default btn-block" onclick="submitUser()">提交</button>
							</div>
						</div>
					</form>
			</div>
		</section>
		
		
		<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script> 
		<script type="text/javascript" src="../js/bootstrap.js"></script>
		<script type="text/javascript" src="../js/register.js"></script> 
		
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
	</body>
</html>
