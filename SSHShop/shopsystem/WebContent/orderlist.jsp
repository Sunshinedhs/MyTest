<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />

</head>
<body>

	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/index_execute.action"> 
				<img width="150px" height="55px" src="${pageContext.request.contextPath}/image/logo.jpg" alt="log"/>
				 </a>
			</div>
		</div>
		<div class="span9">
			<div class="headerAd">
				<img src="${pageContext.request.contextPath}/image/header.jpg"
					width="320" height="50" alt="正品保障" title="正品保障" />
			</div>
		</div>

		<%@ include file="menu.jsp"%>

	</div>

	<div class="container cart">

		<div class="span24">

			<div class="step step1">
				<ul>
					<li class="current"></li>
					<li>我的订单</li>
				</ul>
			</div>


			<table>
				<tbody>
					<s:iterator var="dinDan" value="pageBean.list">
						<tr>
							<th colspan="7">
							订单编号:<s:property value="#dinDan.did" />&nbsp;&nbsp;&nbsp;&nbsp;
							收货人：<s:property value="#dinDan.name" />&nbsp;&nbsp;&nbsp;&nbsp;
							收货地址：<s:property value="#dinDan.addr" />&nbsp;&nbsp;&nbsp;&nbsp;
							订单金额:<font color="red"><s:property value="#dinDan.total" /></font>
							<font color="red">
								<s:if test="#dinDan.state == 1">
									<a style="color: red;" class="state" href="${ pageContext.request.contextPath }/dindan_findByDID.action?did=<s:property value="#dinDan.did" />">等待付款</a>
								</s:if>
								<s:if test="#dinDan.state == 2">
									<a style="color: orange;" class="state" href="${ pageContext.request.contextPath }/dindan_findByDID.action?did=<s:property value="#dinDan.did" />">等待发货</a>
								</s:if>
								<s:if test="#dinDan.state == 3">
									<a style="color: blue;" class="state" href="${ pageContext.request.contextPath }/dindan_findByDID.action?did=<s:property value="#dinDan.did" />">确认收货</a>
								</s:if>
								<s:if test="#dinDan.state == 4">
									<a style="color: green;" class="state" href="${ pageContext.request.contextPath }/dindan_findByDID.action?did=<s:property value="#dinDan.did" />">交易成功</a>
								</s:if>
							</font>
							</th>
						</tr>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<s:iterator var="orderItem" value="#dinDan.ddMessages">
							<tr>
								<td width="60">
									<a href="${ pageContext.request.contextPath }/dindan_findByDID.action?did=<s:property value="#dinDan.did" />">
										<img src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.pic"/>" />
									</a>
								</td>
								
								<td><s:property value="#orderItem.product.name" /></td>
								<td><s:property value="#orderItem.product.price" /></td>
								<td class="quantity" width="60"><s:property
										value="#orderItem.count" /></td>
								
								<td width="140"><span class="subtotal">￥<s:property
											value="#orderItem.subtotal" />
								</span></td>
							</tr>
						</s:iterator>
					</s:iterator>
					<tr>
						<th colspan="5">
						<div class="pagination" style="text-align: center;float: none">
								<s:if test="pageBean.page-1<=0">
									<input class="ddd" type="button" value="上一页"/>
								</s:if> 
								<s:if test="pageBean.page-1>0">
									<input class="ddd" type="button" value="上一页" onclick="window.location.href='${pageContext.request.contextPath }/dindan_findByUid.action?page=<s:property value="pageBean.page-1"/>'"/>
								</s:if>
								<span style="font-size:15px;margin-top: 10px;float:none">第<s:property value="pageBean.page" />/<s:property
								value="pageBean.totalPage" />页 </apan>
								<s:if test="pageBean.page+1<=pageBean.totalPage">
									<input class="ddd" type="button" value="下一页" onclick="window.location.href='${pageContext.request.contextPath }/dindan_findByUid.action?page=<s:property value="pageBean.page+1"/>'"/>
								</s:if>
								<s:if test="pageBean.page+1>pageBean.totalPage">
									<input class="ddd" type="button" value="下一页"/>
								</s:if>
							</div>
							</th>
					</tr>
				</tbody>
			</table>


		</div>

	</div>
	<div class="container footer">
		<%@ include file="Foot.jsp" %>
	</div>
</body>
<style>
div.cart table th {
    padding-bottom: 8px;
}
.ddd{
    background: white;
    border: 1px solid;
}
.ddd:ACTIVE{
background: black;
color: white;
}
.state{
float: right;
margin-right: 38%;
font-size: 15px;
}

</style>
</html>