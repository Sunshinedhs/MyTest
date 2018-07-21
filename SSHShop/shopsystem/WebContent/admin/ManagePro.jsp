<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="util/jquery.js"></script>
<script type="text/javascript" src="util/my.js"></script>
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
	<table cellSpacing="1" cellPadding="5" width="100%" align="center"
		bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="7"
				height="26"><strong><STRONG>管理商品</STRONG> </strong></td>
		</tr>
		<tr style="background:white;">
			<th>商品名</th>
			<th>价格(元)</th>
			<th>库存(件)</th>
			<th>是否热门</th>
			<th>描述</th>
			<th>保存</th>
			<th>删除</th>
		</tr>
		<s:iterator var="p" value="pageBean.list">

			<tr class="onepro" style="background:white;">
				<td class="pid" align="center" style="display: none"><s:property value="#p.pid"/></td>
				<td class="pic" align="center" style="display: none"><s:property value="#p.pic"/></td>
				<td class="csid" align="center" style="display: none"><s:property value="#p.categorySecond.csid"/></td>
				<td class="name" align="center"><input  type="text"
					value="<s:property value="#p.name"/>" name="name"></td>
				<td class="price" align="center"><input type="text" width="10px"
					value="<s:property value="#p.price"/>" name="price"></td>
				<td class="quantity" align="center"><input type="text"
					value="<s:property value="#p.quantity"/>" name="quantity">
				</td>
				<td class="hot" align="center"><select class="s_hot" name="hot">
						<s:if test="#p.hot==1">
							<option value="1">是</option>
							<option value="0">否</option>
						</s:if>
						<s:if test="#p.hot==0">
							<option value="0">否</option>
							<option value="1">是</option>
						</s:if>
				</select></td>
				<td class="info" align="center"><input type="text"
					value="<s:property value="#p.info"/>" name="info"></td>
				<td align="center" title="确认修改"><input class="changebut" type="button" value="✔" style="color: green"></td>
				
				<td align="center" title="下架商品"><input class="delbut"    type="button" value="✘" style="color: red"></td>
				
			</tr>
		</s:iterator>
		<tr style="background:white;">
			<td colSpan="7" align="center"><span>第 <s:property
						value="pageBean.page" />/<s:property value="pageBean.totalPage" />
					页
			</span></td>
		<tr>
		<tr>
			<td colSpan="2" align="right"><s:if test="pageBean.page-1<=0">
					<input type="button" value="上一页">
				</s:if> <s:if test="pageBean.page-1>0">
					<input type="button" value="上一页"
						onclick="window.location.href='${pageContext.request.contextPath }/adminproduct_findAll.action?page=<s:property value="pageBean.page-1"/>'">
				</s:if></td>
			<td align="center">
				<form
					action="${pageContext.request.contextPath }/adminproduct_findAll.action">
					<select name="page">
						<s:iterator var="p" value="new int[pageBean.totalPage]" status="i">
							<option value="<s:property value="#i.index+1"/>">第
								<s:property value="#i.index+1" />页
							</option>
						</s:iterator>
					</select> <input type="submit" value="跳转">
				</form>
			</td>
			<td align="left"><s:if
					test="pageBean.page+1<=pageBean.totalPage">
					<input type="button" value="下一页"
						onclick="window.location.href='${pageContext.request.contextPath }/adminproduct_findAll.action?page=<s:property value="pageBean.page+1"/>'">
				</s:if> <s:if test="pageBean.page+1>pageBean.totalPage">
					<input type="button" value="下一页">
				</s:if></td>
			<td colSpan="3"><INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/></td>
			
		<tr>
	</table>
</s:else>	
</body>
</html>