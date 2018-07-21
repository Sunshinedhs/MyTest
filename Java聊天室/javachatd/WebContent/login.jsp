<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="jquery.js"></script>
<title>登录页</title>
</head>
<body>
<div class="con">
<p class="biaoti">JAVA聊天室</p>
<input type="text" class="input" id="nickname" maxlength="8" placeholder="用户名为纯字母2-8位">
<p class="t1"></p>
<input type="password" class="input" id="password" maxlength="6" placeholder="密码为纯数字6位">
<p class="t2"></p>
<input type="button" value="登&nbsp录" class="but">
</div>
</body>
<script type="text/javascript">
	$(function(){
		var k1=false; var k2=false;
		$('#nickname').blur(function(){
			var nickname=$('#nickname').val();
			var check1=/^[a-zA-Z]{2,8}$/;
			if(nickname.length==0){
				$('.t1').html("");
				$('.t1').css("color","red");
				k1=false;
			}else if(check1.test(nickname)){
				$.ajax({
					url:'Select',
					type:'post',
					data:{'nickname':nickname},
					dataType:'json',
					success:function(n){
						if(n==-1){
							$('.t1').html("*该用户名还未注册");
							$('.t1').css("color","red");
							k1=false;
						}else{
							$('.t1').html("*ok");
							$('.t1').css("color","green");
							k1=true;
						}
					}
					
				})
				
			}else{
				$('.t1').html("*用户名格式不正确");
				$('.t1').css("color","red");
				k1=false;
			}
			
		})
		
		$('#password').blur(function(){
			var password=$('#password').val();
			var check2=/^[0-9]{6}$/;
			if(password.length==0){
				$('.t2').html("");
				$('.t2').css("color","red");
				k2=false;
			}else if(check2.test(password)){
				$('.t2').html("*ok");
				$('.t2').css("color","green");
				k2=true;
			}else{
				$('.t2').html("*密码格式不正确");
				$('.t2').css("color","red");
				k2=false;
			}
		})
		
		$('.but').click(function(){
			if(k1&&k2){
				$.ajax({
					url:'Login',
					type:'post',
					data:{'nickname':$('#nickname').val(),'password':$('#password').val()},
					dataType:'json',
					success:function(m){
						if(m==1){
							window.location="index.jsp";
						}else{
							alert("用户名或密码错误")
						}
					}
					
				})
			}else{
				alert("用户名或密码不正确");	
			}
			
		})
		
		
	})

</script>
<style>
.biaoti{
    font-size: 30px;
    letter-spacing: 3px;
    margin-bottom: 15px;
    font-weight: 700;
    margin-left: 5px;
}
.but:ACTIVE{
background: #08cb9f;
border: 1px solid #08cb9f;
}
.but{
    height: 25px;
    width: 60px;
    font-size: 15px;
    background: white;
    border: 1px solid #08cb9f;
    border-radius: 3px;
    margin-left: 70px;
    color: black;
}
.t1{
margin-top: 5px;
margin-bottom: 5px;
width: 200px;
height: 20px;
padding-left: 2px;
color: red;
font-size: 16px;
}
.t2{
margin-top: 5px;
margin-bottom: 5px;
width: 200px;
height: 20px;
padding-left: 2px;
color: red;
font-size: 16px;
}

.input{
	width: 200px;
    height: 30px;
    border: 1px solid black;
    border-radius: 3px;
    font-size: 17px;
    padding-left: 5px;
}
.con{
  margin-left: 37%;
    margin-top: 12%;
    float: left;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 60px;
    padding-right: 60px;
    border: 1px solid #08cb9f;
    border-radius: 5px;
}
*{padding:0;margin:0;text-decoration:none;}
</style>
</html>