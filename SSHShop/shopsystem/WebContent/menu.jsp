<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="span10 last">
	<div class="topNav clearfix">
		<ul>
			<s:if test="#session.existUser == null">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user/login.jsp">登录</a>|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user/register.jsp">注册</a>|
			</li>
			</s:if>
			<s:else>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<s:property value="#session.existUser.username"/>
				|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/dindan_findByUid.action?page=1">我的订单</a>
			|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>|
			</li>
			</s:else>
		
			<li><a>会员中心</a> |</li>
			<li><a>购物指南</a> </li>
		</ul>
	</div>
	<div class="cart">
		<a class="gowuche" href="${ pageContext.request.contextPath }/cart_myCart.action">购物车</a>
	</div>
	<div class="phone">
		客服热线: <strong>123456</strong>
	</div>
</div>
<div class="span24">
	<ul class="mainNav">
		<li><a href="${ pageContext.request.contextPath }/index.action">首页</a> |</li>
		<s:iterator var="c" value="#session.cList">
			<li><a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a> |</li>
		</s:iterator>
		<li style="float: right">
		<div class="search">
		<input style="float: right;display: inline;" type="button" value="搜&nbsp索" class="but1">
		<input id="search" type="text" name="name">
		</div>
		</li>

	</ul>
</div>