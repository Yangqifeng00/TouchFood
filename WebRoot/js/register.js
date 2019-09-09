var flag1 = false;
var flag2 = false;
var flag3 = false;
var flag4 = false;
var flag5 = false;
var flag6 = false;

$(function(){
  var $username1 = $("#username1");
  
  var $password1 = $("#password1");
  var $password2 = $("#password2");

  var $phone2 = $("#phone2");

  var $address1 = $("#address");

  var $age1 = $("#age1");


  $username1.blur(function(){
    var username = $username1.val();
    if(username == "" || username == null){
      flag1 = false;
      $("#username1Span").html("输入不能为空").css("color","red");
      return flag1;
    }else{
      var reg = /^0?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$/;
      if(reg.test(username) != true){
        $("#username1Span").html("请输入正确的手机号码").css("color","red");
        flag1 = false;
      }else{
        $.ajax({
        	
          url:"/TouchFood/userlist/checkUserName",
          type:"post",
          datatype:"json",
          data:{
            "username":username
          },
          
          success:function(data){
            if(data == '1'){
              flag1 = false;
              $("#username1Span").html("用户名被占用").css("color","red");
            }else{
              flag1 = true;
              $("#username1Span").html("").css("color","green");
            }
          }
        });
      }
    }
  });

  $password1.blur(function() {
    var password = $password1.val();
    if(password =="" || password == null){
      flag2 = false;
      $("#password1Span").html("输入不能为空").css("color","red");
      return flag2;
    }else{
      var reg = /^(\w){6,14}$/;
      if(reg.test(password)!=true){
        flag2 = false;
        $("#password1Span").html("请输入6-14位数字或者英文字母").css("color","red");
      }else{
        flag2 = true;
        $("#password1Span").html("");
      }
    }
  });
  $password2.blur(function(){
    var password1 = $password1.val();
    var password2 = $password2.val();
    if (password2 ==""||password2==null) {
      flag3 = false;
      $("#password2Span").html("输入不能为空").css("color","red");
      return flag3;
    }
    else{
      if (password1 != password2) {
        flag3 = false;
        $("#password2Span").html("请确认您的密码").css("color","red");
      }else{
        $("#password2Span").html("");
       flag3 = true;
      }
    }
  });

  $phone2.blur(function(){
    var phone2 = $phone2.val();
    if (phone2 ==""||phone2==null){
      flag5 = false;
      $("#phone2Span").html("").css("color","red");
      return flag4;
    }else{
      var reg = /[1-9]\d*/;
      if((phone2 < 10000||phone2 > 9999999999) || reg.test(phone2)!=true){
        flag4 = false;
          $("#phone2Span").html("请输入正确的QQ格式").css("color","red");
      }else{
        $("#phone2Span").html("");
        flag4 = true;
      }
    }
  });
  $address1.blur(function(){
    var address = $address1.val();
    if(address==""||address==null){
      flag5 = false;
      $("#addressSpan").html("").css("color","red");
    }else{
      var pattern = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
      if(pattern.test(address)!=true){
        flag5 = false;
          $("#addressSpan").html("请输入有效地址").css("color","red");
      }else{
        flag5 = true;
        $("#addressSpan").html("");
      }
    }
  });
  $age1.blur(function(){
    var age1 = $age1.val();
    if (age1 ==""||age1==null){
      flag6 = false;
      $("#age1Span").html("").css("color","red");
      return flag6;
    }else{
      var reg = /[1-9]\d*/;
      if((age1 < 18||age1 > 50) || reg.test(age1)!=true){
        flag6 = false;
          $("#age1Span").html("请输入有效年龄").css("color","red");
      }else{
        $("#age1Span").html("");
        flag6 = true;
      }
    }
  });
});

function submitUser(){
    if(flag1 && flag2 && flag3){
      $("#normalregister").submit();
    }else{
      alert("请正确填写所有信息");
    }
  }