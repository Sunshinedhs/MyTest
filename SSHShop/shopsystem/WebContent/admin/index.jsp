<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:if test="#session.existAdminUser==null">
你还没有登陆，请登录后再试！<br>
两秒后自动跳转至登陆界面.......
<meta http-equiv="refresh" content="2;url=AdminLogin.jsp"/>
</s:if>
<s:else>
<%@ include file="top.jsp" %>
<div class="con">
<p class="xiangmu"><a class="main addpro" 			href="${pageContext.request.contextPath }/adminproduct_addPage.action" >添加商品</a><br></p>

<p class="xiangmu"><a class="main managepro" 		href="${pageContext.request.contextPath }/adminproduct_findAll.action?page=1" >管理商品</a><br></p>

<p class="xiangmu"><a class="main addcategory"	 	href="${pageContext.request.contextPath }/admin/category.jsp" >添加一级分类</a><br></p>

<p class="xiangmu"><a class="main addcategorysec" 	href="${pageContext.request.contextPath }/adminCategorysec_addPage.action" >添加二级分类</a><br></p>

<p class="xiangmu"><a class="main updateDinDan" 	href="${pageContext.request.contextPath }/adminDD_findAll.action?page=1" >管理用户订单</a></p>
 
</div>
</s:else>
</body>
<style>
.xiangmu{
	font-size: 25px;
    padding-left: 20%;
    background: #2196f3;
}
.con{
	height: 330px;
    float: left;
    width: 20%;
    border: 2px solid #2196f3;
    border-radius: 10px;
    margin-left: 39%;
    margin-top: 7%;
}
a{
color:white;
}
a:HOVER{
color:yellow;
}
</style>
</html>