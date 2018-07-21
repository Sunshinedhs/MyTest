<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script type="text/javascript" charset="utf-8" src="../util/jquery.js"></script>
<script type="text/javascript" charset="utf-8" src="../util/jQuery-form.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript">
$(function(){
	var k1=false;var k2=false;var k3=false;var k4=false;var k5=false;var k6=false;
	$('#username').blur(function(){
		var username=$(this).val();
		var kongge=/^\s*$/;
		if(username.length==0){
			$('#t1').html("");
			$('#t1').css("color","red");
			k1=false;
		}else if(kongge.test(username)){
			$("#t1").html("<font color='red'>非法字符</font>");
			k1=false;
		}else{
			$.ajax({
				url:'/shopsystem/user_findByName.action',
				type:'post',
				data:{'username':username},
				dataType:'json',
				success:function(date){
					console.log(date);
					if(date==0){
						$("#t1").html("<font color='green'>OK</font>");
						k1=true;
					}else{
						$("#t1").html("<font color='red'>用户名已经存在</font>");
						k1=false;
					}
				}
			})
		}
	})
	
	$('#password').blur(function(){
			var password=$('#password').val();
			var check2=/^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,12}$/;
			if(password.length==0){
				$('#t2').html("");
				$('#t2').css("color","red");
				k2=false;
			}else if(check2.test(password)){
				$('#t2').html("密码很棒");
				$('#t2').css("color","green");
				k2=true;
			}else{
				$('#t2').html("密码格式不正确");
				$('#t2').css("color","red");
				k2=false;
			}
		})
		$('#email').blur(function(){
			var email=$(this).val();
			var check3=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
			if(email.length==0){
				$('#t3').html("");
				$('#t3').css("color","red");
				k3=false;
			}else if(check3.test(email)){
				$('#t3').html("邮箱可以使用");
				$('#t3').css("color","green");
				k3=true;
			}else{
				$('#t3').html("邮箱格式不正确");
				$('#t3').css("color","red");
				k3=false;
			}
		})
		
		$('#phone').blur(function(){
			var phone=$(this).val();
			var check3=/^[1][3,4,5,7,8][0-9]{9}$/;
			if(email.length==0){
				$('#t4').html("");
				$('#t4').css("color","red");
				k4=false;
			}else if(check3.test(phone)){
				$('#t4').html("OK");
				$('#t4').css("color","green");
				k4=true;
			}else{
				$('#t4').html("手机号码有误");
				$('#t4').css("color","red");
				k4=false;
			}
		})
		$('#name').blur(function(){
			var name=$(this).val();
			var kongge=/^\s*$/;
			if(name.length==0||kongge.test(name)){
				$('#t5').html("姓名不能为空");
				$('#t5').css("color","red");
				k5=false;
			}else{
				$('#t5').html("OK");
				$('#t5').css("color","green");
				k5=true;
			}
		})
		$('#addr').blur(function(){
			var addr=$(this).val();
			var kongge=/^\s*$/;
			if(addr.length==0||kongge.test(addr)){
				$('#t6').html("地址不能为空");
				$('#t6').css("color","red");
				k6=false;
			}else{
				$('#t6').html("OK");
				$('#t6').css("color","green");
				k6=true;
			}
		})
		$('#but').click(function(){
			if(k1&&k2&&k3&&k4&&k5&&k6){
				$('#form').ajaxSubmit(function(date){
					window.location="login.jsp";
				})
			}else{
				alert("有项目未通过");
			}
			
			
		})
		
})

</script>
<body>
<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/index_execute.action">
				<img width="150px" height="55px" src="${pageContext.request.contextPath}/image/logo.jpg" alt="log">
			</a>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
					<img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障">
</div>	</div>
	
	<%@ include file="../menu.jsp" %>
</div>
<div class="container register">
		<div class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong>会员注册</strong>USER REGISTER
					</div>
						<div class="window">	
							<s:form id="form" action="user_ regist" theme="simple" namespace="/" type="post">
								<input class="input" type="text" id="username"name="username" placeholder="请输入用户名"><span id="t1"></span><br>
								<input class="input" type="text" id="password" name="password" placeholder="密码由10-12位数字加字母组成"><span id="t2"></span><br>
								<input class="input" type="text" id="name"  name="name" placeholder="请输入姓名"><span id="t5"></span><br>
								<input class="input" type="text" id="email" name="email" placeholder="请输入邮箱"><span id="t3"></span><br>
								<input class="input" type="text" id="phone" name="phone" placeholder="请输入手机号码"><span id="t4"></span><br>
								<input class="input" type="text" id="addr"  name="addr" placeholder="请输入地址"><span id="t6"></span><br>
								<input class="submit" type="button" id="but" value="注册">
							</s:form>
						<div class="login">
							<dl>
								<dt>已经拥有账号了？</dt>
								<dd>
									立即登录即可体验在线购物！
									<a href="login.jsp">立即登录</a>
								</dd>
							</dl>
						</div>
						
						</div>
						<div>
						</div>
						<img class="happygo" alt="ad" src="../image/happygo.jpg">
						
						
				</div>
			</div>
		</div>
	</div>	

</body>
<style>
.happygo{
	position: absolute;
    height: 300px;
    width: 500px;
    right: 17%;
    margin-top: 20px;
    border-radius: 3px;
}
.window{
	float: left;
    width: 50%;
    margin-top: 20px;
}
#but{
background: url(../image/register.gif) 0px 0px no-repeat;
margin-left: 21%;
}
.login{
float: left !important;
margin: 5%;
}
.input{
height: 25px;
width: 43%;
margin-bottom: 10px;
margin-left: 14%;
border-radius: 3px;
border: 1px solid;
padding-left: 10px;
}
span{
margin-left: 10px;
}
.gowuche{
	color: white;
    font-size: 15px;
    margin-left: 4px;
}
.cart{
margin-left:121px !important;
background: url(../image/product.gif) 0px -604px no-repeat !important;
}
</style>
</html>