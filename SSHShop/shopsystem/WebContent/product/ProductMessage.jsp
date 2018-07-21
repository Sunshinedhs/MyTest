<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="UTF-8" src="util/jquery.js"></script>
<script type="text/javascript" charset="utf-8" src="util/jquery-1.6.js"></script>
<script type="text/javascript" charset="utf-8" src="util/jquery.jqzoom-core.js"></script>
<link rel="stylesheet" type="text/css" href="util/jquery.jqzoom.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/index_execute.action">
					<img width="150px" height="55px"
					src="${pageContext.request.contextPath}/image/logo.jpg" alt="log">
				</a>
			</div>
		</div>
		<div class="span9">
			<div class="headerAd">
				<img src="${pageContext.request.contextPath}/image/header.jpg"
					width="320" height="50" alt="正品保障" title="正品保障">
			</div>
		</div>

		<%@ include file="../menu.jsp"%>

	</div>
	<div class="message">
		<div class="diyi">
		<a href="<s:property value="pic"/>" class="jqzoom" title="哈哈">
			<img src="<s:property value="pic"/>" class="yulan" id="yulan">
		</a>
		
		</div>
		<div class="disan">
			<div class="" style="height: 12%; width: 100%; margin-bottom: 0%;">
				<p style="font-size: 17px; letter-spacing: 1px;">
					<s:property value="name" />
				</p>
			</div>
			<div class=""
				style="height: 20%; width: 100%; background: #FFF2E8; margin-bottom: 5%; border: 1px; border-radius: 5px;">
				<p style="padding-top: 15px; padding-left: 10px;">
					<span style="float: left; margin-top: 8px; font-size: 15px;">
						价格 &nbsp&nbsp </span> <span style="font-size: 30px; color: red;">
						￥<s:property value="price" />
					</span>
				</p>
				<p style="margin-left: 10px; margin-top: 10px;">
					<span style="float: left; margin-top: 1px; font-size: 15px;">
						库存 &nbsp&nbsp </span> <span id="totalqu"><s:property value="quantity"/></span> <span>
						件 </span>
				</p>
			</div>
			<div class=""
				style="height: 20%; width: 100%; background: #f5f5dc80; margin-bottom: 5%; border: 1px; border-radius: 5px;">
				<p style="margin-left: 10px; padding-top: 10px;">
					<s:property value="info" />
				</p>
			</div>
			<div class=""
				style="border-radius: 3px; height: 20%; width: 100%; border: 1px solid #e26c2b;">
				<p class="count"
					style="float: left; margin-top: 10px; font-size: 15px; margin-left: 10px;">
					数量&nbsp&nbsp</p>
				<input type="button" value="加入购物车" class="jiagouwuche"> <input
					type="button" id="jianxiao" value="-"
					style="margin-top: 10px; height: 25px; width: 26px; border: 1px solid orange; border-radius: 1px;">
				<input id="currentpid" type="text" name="buyid"
					value="<s:property value="pid"/>" style="display: none"> 
					<input type="text" name="shuliang" id="num" class="shuliang" value="1" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ngpattern="/[^a-zA-Z]/"/>
				<input type="button" id="zengjia" value="+"
					style="margin-top: 10px; height: 25px; width: 26px; border: 1px solid orange; border-radius: 1px;"><br>
				<input type="button" value="立即购买" class="maimaimai">
			</div>
			<div class="tips" style="display: none;">
				<p style="color: red; margin-top: 10px; margin-left: 21px;"></p>
			</div>
		</div>
		<div class="dier">
				<img src="<s:property value="path1"/>" class="xx1" id="Picx">
			 <img src="<s:property value="path2"/>" class="xx1" id="Picy" style="margin-left: 4%"> 
			 <img src="<s:property value="path3"/>" class="xx1" id="Picz"  style="float: right;">
		</div>
	</div>
	<%@ include file="../Foot.jsp"%>
</body>
<script type="text/javascript">
	var nums;
	var rd = /^[1-9]+(?=\.{0,1}\d+$|$)/;
	window.onload = function() {
		nums = document.getElementById("num").value;
	
		document.getElementById("jianxiao").onclick = changeNum1;
		document.getElementById("zengjia").onclick = changeNum2;
	};
	function changeNum1() {
		nums = document.getElementById("num").value;
		if (rd.test(nums)) {
			nums--;
			if(nums<1){
				nums=1;
			}
			document.getElementById("num").value = nums;
		}else{
			nums=1;
		}
	}
	function changeNum2() {
		var totalqu=$('#totalqu').text();
		nums = document.getElementById("num").value;
		if (rd.test(nums)) {
			if(totalqu-nums<=0){
				$('.tips').children('p').html("库存不足啦!");
				$('.tips').fadeIn(500).delay(1500).fadeOut(500);
				nums=totalqu;
			}else{
				nums++;
			}
		}else{
			nums=1;
		}
		document.getElementById("num").value = nums;
	}
	
	$('#num').blur(function(){
		var rd = /^[1-9]+(?=\.{0,1}\d+$|$)/;
		var totalqu=$('#totalqu').text();
		nums = document.getElementById("num").value;
		if(rd.test(nums)==false){
			nums=1;
			document.getElementById("num").value = nums;
			$('.tips').children('p').html("请输大于0的入数字!");
			$('.tips').fadeIn(500).delay(1500).fadeOut(500);
		}else if(totalqu - nums<=0){
			document.getElementById("num").value = totalqu;
			$('.tips').children('p').html("库存不足!");
			$('.tips').fadeIn(500).delay(1500).fadeOut(500);
		}
	})
	
	$('.jiagouwuche').click(function(){
		
		var count=$('#num').val();
		var pid=$('#currentpid').val();
		var totalqu=$('#totalqu').text();
		if(count<=0){
			$('.tips').children('p').html("怎么能买0件呢!");
			$('.tips').fadeIn(500).delay(1500).fadeOut(500);
		}else if(totalqu-count<=0){
			$('.tips').children('p').html("库存不足！");
			$('.tips').fadeIn(500).delay(1500).fadeOut(500);
		}else{
			$.ajax({
				url:'cart_addCart',
				data:{'count':count,'pid':pid},
				type:'post',
				dataType:'json',
				success:function(key){
					if(key==1){
						$('.tips').children('p').html("添加成功!");
						$('.tips').fadeIn(500).delay(1500).fadeOut(500);
					}else{
						$('.tips').children('p').html("添加失败，稍后再试");
						$('.tips').fadeIn(500).delay(1500).fadeOut(500);
					}
				}
			})
		}
		
	})
	$('.maimaimai').click(function(){
		$('.jiagouwuche').click();
		window.location="${pageContext.request.contextPath }/cart_myCart.action";
		
	})
</script>

<script type="text/javascript">
		$(function() {
			$('.jqzoom').jqzoom({
				zoomWidth: 350,
				zoomHeight: 350,
				lens:true,
				preloadImages:false,
				alwaysOn:false,
				title:false,
				position:"right"
			});
			
		$(".xx1").mouseover(function() {
			var oldpic=$("#yulan").attr("src");
			var currentpic = $(this).attr("src");
			$("#yulan").attr("src", currentpic);
			$(".xx1").mouseout(function(){
				$("#yulan").attr("src", oldpic);
			})
		})
		
		})
		
</script>
<style>
.gowuche {
	color: white;
	font-size: 15px;
	margin-left: 4px;
}

#jianxiao:HOVER {
	cursor: pointer;
}

#zengjia:HOVER {
	cursor: pointer;
}

.tips {
	margin-left: 29%;
	float: left;
	margin-top: 7%;
	font-size: 20px;
}

.jiagouwuche:HOVER {
	background: red;
	cursor: pointer;
}

.jiagouwuche {
	float: right;
	margin-right: 15px;
	margin-top: 51px;
	height: 38px;
	width: 137px;
	background: #FF4400;
	font-size: 19px;
	border-radius: 3px;
	color: white;
	letter-spacing: 2px;
	border: 1px;
}

.maimaimai:HOVER {
	background: #FF4400;
	color: white;
	cursor: pointer;
}

.maimaimai {
	margin-top: 16px;
	margin-left: 21px;
	height: 38px;
	width: 126px;
	border: 1px;
	background: #FFF2E8;
	letter-spacing: 6px;
	font-size: 19px;
	color: red;
	border-radius: 3px;
}

.shuliang {
	height: 21px;
	width: 50px;
	background: white;
	border: 1px solid #e26c2b;
	margin-top: 10px;
	text-align: center;
}

.xx1:HOVER {
	filter: brightness(1.1);
	border: 2px solid #e26c2b;
}

.xx1 {
	height: 100%;
	width: 30%;
	border: 1px;
	border-radius: 3px;
	border: 2px solid transparent;
}

.yulan {
	height: 385px;
	width: 443px;
	border: 1px;
	border-radius: 3px;
}

.disan {
	float: right;
	height: 96%;
	width: 40%;
	margin-right: 10px;
	margin-top: 10px;
}

.dier {
	height: 25%;
	width: 55%;
	float: left;
	margin-left: 10px;
	margin-top: 10px;
	border: 1px;
	border-radius: 3px;
}

.diyi {
	float: left;
	width: 55%;
	height: 69%;
	margin-left: 10px;
	margin-top: 10px;
	border: 1px;
	border-radius: 3px;
}

.message {
	height: 555px;
	width: 60%;
	margin-top: 10px;
	margin-left: 20%;
	border: 1px solid #E8E8E8;
}

.dnf {
	font-size: 48px;
	color: white;
	float: left;
	margin-left: 42%;
	margin-top: 8px;
}
</style>
</html>