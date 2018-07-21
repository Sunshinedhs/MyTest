<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script type="text/javascript" charset="utf-8" src="../util/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>
</head>
<script type="text/javascript">

$(function(){
	var k1=false;
	$('#username').blur(function(){
		var username=$(this).val();
		if(username.length==0){
			$('#t1').html("");
			$('#t1').css("color","red");
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
						$("#t1").html("<font color='red'>用户还未注册</font>");
						k1=false;
					}else{
						$("#t1").html("<font color='green'>可以登录</font>");
						k1=true;
					}
				}
			})
		}
	})
	$('#but').click(function(){
		var username=$('#username').val();
		var pw=$('#password').val();
		if(k1){
			$.ajax({
				url:'/shopsystem/user_login.action',
				type:'post',
				data:{'username':username,'password':pw},
				dataType:'json',
				success:function(data){
					if(data==0){
						$("#t2").html("<font color='red'>用户名或密码错误！亲检查一下再登录吧</font>");
					}else{
						window.location="${ pageContext.request.contextPath }/index.action";
					}
				}
				
			})
		}else{
			alert("请检查用户名是否正确或去注册一个账号吧!");
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
	
</div>	<div class="container login">
		<div class="span12">
<div class="ad">
					<img src="${pageContext.request.contextPath}/image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">
</div>		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN 
						
					</div>
					<div><s:actionerror /></div>
						<table>
							<tbody><tr>
								<th>
										用户名:
								</th>
								<td>
									<input type="text" id="username" name="username" placeholder="请输入用户名" class="text" maxlength="20"><span id="t1"></span><br>
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="password" name="password" placeholder="请输入密码" class="text" maxlength="20" autocomplete="off"><br>
									<span id="t2"></span><br>									
								</td>
							</tr>
								
							
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<input type="button" class="submit" id="but" value="登 录">
		
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;
									
								</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可体验在线购物！
											<a href="register.jsp">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody></table>
				</div>
			</div>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
	  <div class="footerAd"><img src="${pageContext.request.contextPath}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势" /></div>	
	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a >关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 网上商城</div>
	</div>
</div>

</body>
<style>
.gowuche{
	color: white;
    font-size: 15px;
    margin-left: 4px;
}
.cart{
margin-left:121px !important;
background: url(../image/product.gif) 0px -604px no-repeat !important;
}
#but{
background: url(../image/login.gif) 0px 0px no-repeat;
}
</style>
</html>