<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" charset="utf-8" src="../util/jquery.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		
		$('#but').click(function(){
			var a=$('#username').val().length;
			var b=$('#password').val().length;
			if(a==0||b==0){
				alert("管理员账户或密码不能为空");
			}else{
				$('#sub').click();
			}
		})
	})
</script>
<body>
<body style="background-color:#03a9f4;">
<div class="con">

<s:form id="form" action="adminuser_login" theme="simple" namespace="/" type="post" >
<input id="username" type="text"   name="username" placeholder="请输入管理员账户"> 
<input id="password" type="text" name="password" placeholder="请输入管理员密码"> 
<input id="sub" type="submit"  style="display: none">
<input class="but" id="but" type="button"  value="登&nbsp录">
<font color="red"><s:actionerror/></font>
</s:form>
</div>
</body>
<style>
.but{
	margin-left: 7px;
    background: orange;
    font-size: 20px;
}
input{
    height: 29px;
    width: 100%;
    margin-bottom: 10px;
    border: 1px;
    border-radius: 5px;
    padding-left: 10px;
}
.con{
width: 190px;
    margin-left: 43%;
    margin-top: 12%;
    text-align: center;
}
</style>

<style>

</style>
</html>