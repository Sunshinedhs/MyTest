<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<script type="text/javascript" src="util/jquery.js"></script>
<script type="text/javascript" src="util/my.js"></script>
<link rel="stylesheet" href="util/my.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
</head>

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
<table id="table1"></table>

<div class="span2">
<s:if test="pageBean==null&&vagueSearch==null">
<div class="title 2">最热商品</div>
	<s:iterator var="h" value="hList">
		<div class="Product hotProduct">
			<a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#h.pid"/>">
			<img class="picview" src="${pageContext.request.contextPath}/<s:property value="#h.pic"/>" width="170" height="170"  style="display: inline-block;">
			<div style="overflow: hidden;width: 169px;height: 26px;">
			<p style="padding-top: 3px;padding-bottom: 3px;color: black;font-size: 15px;padding-left: 5px;">
				<s:property value="#h.name"/>
			</p>
			</div>								 
			<p class="price" style="color: red;font-size: 15px;padding-left: 5px;">
			￥<s:property value="#h.price"/>
			</p>
			</a>
											   
		</div>
	</s:iterator>		
</div>

<div class="span2">
	<div class="title title3">最新商品</div>
		<s:iterator var="n" value="nList">
			<div class="Product newProduct">
				<a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#n.pid"/>">
					<img class="picview" src="${pageContext.request.contextPath}/<s:property value="#n.pic"/>" width="170" height="170"  style="display: inline-block;">
					<div style="overflow: hidden;width: 169px;height: 26px;">
					<p style="padding-top: 3px;padding-bottom: 3px;color: black;font-size: 15px;padding-left: 5px;">
					<s:property value="#n.name"/>
					</p>
					</div>
					<p class="price" style="color: red;font-size: 15px;padding-left: 5px;">
						￥<s:property value="#n.price"/>
					</p>
				</a>
			</div>
		</s:iterator>		
</div>
</s:if>
<s:elseif test="vagueSearch!=null">
<s:if test="vagueSearch.size==0">
<div class="title ">商品搜索</div>
没有找到此类商品
</s:if>
<s:else>
<div class="vagueSearch">
			<div class="title ">商品搜索</div>
				<s:iterator var="v" value="vagueSearch">
					<div class="Product newProduct">
							<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#v.pid"/>">
								<img src="${pageContext.request.contextPath}/<s:property value="#v.pic"/>" width="170" height="170"  style="display: inline-block;">
								<div style="overflow: hidden;width: 169px;height: 26px;">			   
								<p style="padding-top: 3px;padding-bottom: 3px;color: black;font-size: 15px;padding-left: 5px;">
									<s:property value="#v.name"/>
								</p>
							 	</div>
								<p class="price" style="color: red;font-size: 15px;padding-left: 5px;">
									 ￥<s:property value="#v.price"/>
								</p>
											 
					</a>
				</div>
		</s:iterator>		
</div>
</s:else>

</s:elseif>
<s:else>
<div class="productList">
		<div class="span24">
			<div class="list">
				<s:iterator var="c" value="#session.cList">
				<dl>
					<dt>
								<a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
					</dt>
				</dl>
				<div class="secondcs">
					<s:iterator var="cs" value="#c.categorySeconds">
							<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>
					</s:iterator>
				</div>		
				</s:iterator>		
			</div>
		</div>
		<div class="" style="text-align: center;">
			<span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span><br>
		<s:if test="cid != null">
				<s:if test="pageBean.page-1<=0">
					<input class="ddd" type="button" value="上一页"/>
				</s:if> 
				<s:if test="pageBean.page-1>0">
					<input class="ddd" type="button" value="上一页" onclick="window.location.href='${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page-1"/>'"/>
				</s:if>
				<s:if test="pageBean.page+1<=pageBean.totalPage">
									<input class="ddd" type="button" value="下一页" onclick="window.location.href='${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page+1"/>'"/>
								</s:if>
								<s:if test="pageBean.page+1>pageBean.totalPage">
									<input class="ddd" type="button" value="下一页"/>
								</s:if>
		</s:if>	
		<s:if test="csid != null">
			<s:if test="pageBean.page-1<=0">
					<input class="ddd" type="button" value="上一页"/>
				</s:if> 
				<s:if test="pageBean.page-1>0">
					<input class="ddd" type="button" value="上一页" onclick="window.location.href='${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page-1"/>'"/>
				</s:if>
				<s:if test="pageBean.page+1<=pageBean.totalPage">
									<input class="ddd" type="button" value="下一页" onclick="window.location.href='${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page+1"/>'"/>
								</s:if>
								<s:if test="pageBean.page+1>pageBean.totalPage">
									<input class="ddd" type="button" value="下一页"/>
								</s:if>
			<s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="csid"/>&page=1" class="firstPage">&nbsp;</a>
				<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="csid"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
			</s:if>
		</s:if>	
		</div>
</div>	


<div  class="result table clearfix">
		<s:iterator var="p" value="pageBean.list">
		<div class="Product resultpro">
					<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>">
							<img class="picview" src="${pageContext.request.contextPath}/<s:property value="#p.pic"/>" width="170" height="170"  style="display: inline-block;">
								<div style="overflow: hidden;width: 169px;height: 26px;">			   
								<p style="padding-top: 3px;padding-bottom: 3px;color: black;font-size: 15px;padding-left: 5px;">
									<s:property value="#p.name"/>
								</p>
								</div>			 
								<p class="price" style="color: red;font-size: 15px;padding-left: 5px;">
									￥<s:property value="#p.price"/>
								</p>				 
					</a>	
			</div>		
		</s:iterator>	
		
</div>
</s:else>	
<%@ include file="../Foot.jsp" %>
</body>
<style>
.gowuche{
	color: white;
    font-size: 15px;
    margin-left: 4px;
}
.cart{
margin-left:121px !important;
background: url(image/product.gif) 0px -604px no-repeat !important;
}
.span24{
border: 1px solid;
border-radius: 3px;
overflow: hidden;
}
.secondcs{
padding-left: 10px;
margin-bottom: 5px;
}
dt{
font-size: 20px;
font-size: 20px;
background: #f2f2f2;
margin-bottom: 10px;
padding-left: 10px;
border-radius: 3px;
}
.productList{
float: left;
height: 700px;
width: 189px;
}
.picview:HOVER{
filter: brightness(1.1);
}
.title3{
background: #ab7156!important;
}
.title{
width: 99%;
background: #825996;
font-size: 20px;
border-radius: 3px;
margin-bottom: 5px;
color: white;
padding-left: 10px;
padding-top: 2px;
padding-bottom: 2px;
}
.Product:HOVER{
border: 1px solid red;
}
.Product{
float: left;
margin-left: 15px;
border: 1px solid #dbbaec;
border-radius: 5px;
overflow: hidden;
margin-bottom: 10px;
}
.span2{
	float: left;
    width: 69.6%;
    margin-left: 15.3%;
    margin-top: 5px;
}
.hh:HOVER{
background: #e1e1f4;
cursor: pointer;
}
.hh{
padding-left: 10px;
}
#table1{
	position: absolute;
    width: 15%;
    left: 67%;
    font-size: 15px;
    padding-left: 5px;
    overflow: hidden;
    top: 15% !important;
    background: white;
    border: 1px solid;
    box-shadow: 1px 4px 6px #000;
    display: none;
}

*{text-decoration: none;}
</style>
</html>