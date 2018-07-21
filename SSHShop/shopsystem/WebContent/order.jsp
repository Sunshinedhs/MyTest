<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>

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
	<img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
</div>	
</div>
	
	<%@ include file="menu.jsp" %>
	
</div>	

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>
					
					<li  class="current"></li>
					<li  >生成订单成功</li>
				</ul>
			</div>
	
		
				<table>
					<tbody>
					<tr>
						<th colspan="5">订单编号:<s:property value="model.did"/>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
						<s:iterator var="ddMessages" value="model.ddMessages">
						<tr>
							<td width="60">
								<img src="${ pageContext.request.contextPath }/<s:property value="#ddMessages.product.pic"/>"/>
							</td>
							<td>
								<s:property value="#ddMessages.product.name"/>
							</td>
							<td>
								<s:property value="#ddMessages.product.price"/>
							</td>
							<td class="quantity" width="60">
								<s:property value="#ddMessages.count"/>
							</td>
							<td width="140">
								<span class="subtotal">￥<s:property value="#ddMessages.subtotal"/></span>
							</td>
							
						</tr>
						</s:iterator>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					商品金额: <strong id="effectivePrice">￥<s:property value="model.total"/>元</strong>
				</div>
		</div>
		<p style="text-align:right;font-size: 20px;color:red;">
			<s:if test="model.state==1">
				<a style="margin-right: 10px" href="${ pageContext.request.contextPath }/dindan_updateState.action?state=2&did=<s:property value="model.did"/>">确认付款</a>
			</s:if>
			<s:if test="model.state==2">
				<strong >等待发货</strong>
			</s:if>
			<s:if test="model.state==3">
				<a href="${ pageContext.request.contextPath }/dindan_updateState.action?state=4&did=<s:property value="model.did"/>">确认收货</a>
			</s:if>
			<s:if test="model.state==4">
				<a style="color:green;margin-right: 10px" href="">交易完成</a>
			</s:if>
		</p>
	</div>

</div>
	<%@ include file="Foot.jsp" %>
</div>
</body>
</html>