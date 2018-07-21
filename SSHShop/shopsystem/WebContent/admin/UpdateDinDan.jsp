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
				height="26" style="background: cornflowerblue ;"><strong><STRONG>管理商品</STRONG> </strong></td>
		</tr>
		<tr style="background: rgb(175, 209, 243)">
			<th>订单号</th>
			<th>下单时间</th>
			<th>订单价格</th>
			<th>收货人</th>
			<th>收货人电话</th>
			<th>收货人地址</th>
			<th>订单状态</th>
		</tr>
		<s:iterator var="p" value="pageBean.list">

			<tr class="onepro">
				<td class="did" align="center" ><s:property value="#p.did"/></td>
				<td class="ordertime" align="center"><s:property value="#p.ordertime"/></td>
				<td class="total" align="center"><s:property value="#p.total"/></td>
				<td class="name" align="center"><s:property value="#p.name"/></td>
				<td class="price" align="center"><s:property value="#p.phone"/></td>
				<td class="quantity" align="center"><s:property value="#p.addr"/></td>
				<td class="hot" align="center">
					<s:if test="#p.state==1">
						<span style="color: orange">等待付款</span>	
					</s:if>
					<s:if test="#p.state==2">
						<strong style="color: red"><a href="${pageContext.request.contextPath }/adminDD_updateState.action?page=<s:property
						value="pageBean.page" />&did=<s:property value="#p.did"/>" style="color:red">点击发货</a></strong>
					</s:if>
					<s:if test="#p.state==3">
						<span style="color: blue">等待收货</span>	
					</s:if>
					<s:if test="#p.state==4">
						<span style="color: green">交易完成</span>	
					</s:if>	
				</td>
				
			</tr>
		</s:iterator>
		<tr>
			<td colSpan="7" align="center"><span>第 <s:property
						value="pageBean.page" />/<s:property value="pageBean.totalPage" />
					页
			</span></td>
		<tr>
		<tr>
			<th></th>
			<th></th>
			<th align="right"><s:if test="pageBean.page-1<=0">
					<input type="button" value="上一页">
				</s:if> <s:if test="pageBean.page-1>0">
					<input type="button" value="上一页"
						onclick="window.location.href='${pageContext.request.contextPath }/adminDD_findAll.action?page=<s:property value="pageBean.page-1"/>'">
				</s:if></th>
			<th align="center">
				<form
					action="${pageContext.request.contextPath }/adminDD_findAll.action">
					<select name="page">
						<s:iterator var="p" value="new int[pageBean.totalPage]" status="i">
							<option value="<s:property value="#i.index+1"/>">第
								<s:property value="#i.index+1" />页
							</option>
						</s:iterator>
					</select> <input type="submit" value="跳转">
				</form>
			</th>
			<th align="left"><s:if
					test="pageBean.page+1<=pageBean.totalPage">
					<input type="button" value="下一页"
						onclick="window.location.href='${pageContext.request.contextPath }/adminDD_findAll.action?page=<s:property value="pageBean.page+1"/>'">
				</s:if> <s:if test="pageBean.page+1>pageBean.totalPage">
					<input type="button" value="下一页">
				</s:if></th>
			<th><INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/></th>
			<th></th>
		<tr>
	</table>
</s:else>	
</body>
<style>
td{
    text-align: -webkit-center;
    background-color: rgb(245, 250, 254);
}
*{text-decoration: none}
</style>
</html>