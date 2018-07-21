<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="top">
		<p style="margin-top: 5px; float: right;margin-right: 10px;color: white;">
		管理员:
		<s:property value="#session.existAdminUser.username" />
		<a href="${ pageContext.request.contextPath }/adminuser_quit.action">退出</a>
		</p>
		<div id="time"
			style="float: left; margin-top: 5px; margin-left: 10px;color:white;">
			<script>
				document.getElementById('time').innerHTML = new Date()
						.toLocaleString()
						+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
				setInterval(
						"document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
						1000);
			</script>
		</div>
		
		<p
			style="margin-top: 0px; color: white; font-size: 50px; letter-spacing: 10px; padding-top: 7px; margin-left: 32%;">商城后台管理系统</p>
	</div>
</body>
<style>
.top {
	background: #2196f3;
	height: 90px;
}

body {
	margin: 0;
	padding: 0;
}

* {
	text-decoration: none;
}
</style>
</html>