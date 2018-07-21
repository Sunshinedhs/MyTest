<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="jquery.js"></script>
<script type="text/javascript" charset="utf-8" src="jQuery-form.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>聊天窗口</title>
</head>
<body>

<div class="tankuang">
</div>
<div class="zuiwaiceng">
	<div class="headword">
		<span class="liaotianshi">JAVA聊天室</span>
		<p class="username">${nickname}</p>
		<img src="${info}" class="touxiang">
	</div>
	<div class="baoguo">
		<div class="lianxiren">
			<c:forEach items="${viparr}" var="viparr">
				<div class="vip">
					<img src="${viparr.info}" class="vippic">
					<p class="vipname" style="font-weight: 600;">${viparr.nickname}</p>
				</div>
			</c:forEach>
		</div>
		<div class="xinxiguang">
			<div class="zhenzailiaotian">
				<p class="zhenzailiaotianname" style="text-align: center;margin-top: 0px;margin-bottom: 0px;"></p>
			</div>
			<div class="liaotianjilu" style="height: 89%;width: 100%;overflow-x:hidden;overflow-y: auto;">
				
			</div>
		</div>
		<div class="shurukuang">
		<textarea rows="10" cols="60" name="zhenzaishuru" class="zhenzaishuru" maxlength="100"></textarea>
		<input type="button" class="fasong" value="发&nbsp送"> 
		</div>
	</div>
</div>
<input type="button" class="logout" value="注销">
<div class="updatavip">
	<form  id="form" action="Change"  method="post" enctype="multipart/form-data">
		<div style="width: 100%;height: 160px;background: white; border: 1px solid #08cb9f;">
			<label>
				<input type="file" id="uppic" name="uppic" style="display: none">
				<img src="2.jpg" id="preview" style="height: 132px;
					    width: 139px;
					    margin-top: 14px;
					    border: 1px solid lightblue;">
			</label>
		</div>
		<div style="height: 50px;
			    width: 100%;
			    background: white;
			    border: 1px solid #08cb9f;
			    border-top: 0px;">
			<input type="text" id="newpassword" name="newpassword" style="height: 20px;
				    width: 150px;
				    border: 1px solid lightcoral;
				    margin-top: 10px;
				    background: white;
				    font-size: 15px;
				    padding-left: 5px;" placeholder="修改密码纯数字6位">    
				    
				    
		</div>
		<div style="background: white;
				    height: 50px;
				    width: 100%;
				    border: 1px solid #08cb9f;
				    border-top: 0px;">
			<input type="button" class="gaimimadeanniu" value="取消"id="quxiao">	    
			<input type="button" class="gaimimadeanniu" value="提交"id="queding">	    
				    
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
	$('.fasong').click(function(){
		var content=$('.zhenzaishuru').val();
		console.log(content);
		if(content.length!=0){
			var send=$('.username').text();
			var receive=$('.zhenzailiaotianname').text();
			if(receive.length!=0){
				$.ajax({
					url:'SendMessage',
					type:'post',
					data:{'content':content,'send':send,'receive':receive},
					dataType:'json',
					success:function(fdata){
						if(fdata!=0){
							if(content.length<=12){
							$('.liaotianjilu').append('<p style="float: left;margin-top: 0px;text-align: center;font-size: 14px;color: #b0b3b7;height: 20px;width: 100%;">'+fdata.time+'</p><img class="womuqiandetouxiang"src="'+$('.touxiang').attr("src")+'" height="30px" width="30px"><p class="woshurude" style="text-align: center;">'+content+'</p>');
							}else{
							$('.liaotianjilu').append('<p style="float: left;margin-top: 0px;text-align: center;font-size: 14px;color: #b0b3b7;height: 20px;width: 100%;">'+fdata.time+'</p><img class="womuqiandetouxiang"src="'+$('.touxiang').attr("src")+'" height="30px" width="30px"><p class="woshurude" >'+content+'</p>');	
							}
						
							$('.zhenzaishuru').val('');
							$('.liaotianjilu').scrollTop(9999);
						}else{
							alert("信息发送失败");
						}
						
					}
				})
			}else{
				alert("没想好和谁聊天吗");
			}
			
		}else{
			alert("请输入内容");
		}
		
	})

	$(document).ready(function(){
		$("#uppic").change(function(){
		var currentpic=this.files[0];
		preview(currentpic);
		});
		function preview(pic){
			var r=new FileReader();
			r.readAsDataURL(pic);
			r.onload=function(){
				$("#preview").attr("src",this.result);
			};
		}
		
		$(".touxiang").click(function(){
			$('.updatavip').fadeIn(500);
			$("#preview").attr("src",$('.touxiang').attr("src"));
			
			$('#quxiao').click(function(){
				$('.updatavip').fadeOut(1);
			})
		})
		
		$('#queding').click(function(){
			var newpassword=$('#newpassword').val();
			var len=newpassword.length;
			var check2=/^[0-9]{6}$/;
			var files=$('#uppic').prop('files');
			if(files.length==0 && len==0){
				alert("你没有更改任何内容");
			}else{
				if(len!=0){
					if(!check2.test(newpassword)){
						alert("	密码格式不正确");
					}else{
						$('#form').ajaxSubmit(function(data){
							
							if(data.length==2){
								alert("头像修改成功");
							}else if(data.length==3){
								alert("密码修改成功，请重新登录");
								window.location="Logout";
							}else if(data.length==4){
								alert("密码和头像均修改成功，请重新登录");
								window.location="Logout";
							}
						})
					}
				}else{
					$('#form').ajaxSubmit(function(data){
						console.log(data)
						if(data.length==2){
							$.ajax({
								url:'Reflush',
								type:'post',
								dataType:'json',
								success:function(pp){
									for(var t=0;t<pp.length;t++){
										$('.touxiang').attr("src",pp[t].info);
									}
								},
							})
							$('.updatavip').fadeOut(1);
							alert("头像修改成功");
						}else if(data.length==3){
							alert("密码修改成功，请重新登录");
							window.location="Logout";
						}else if(data.length==4){
							alert("密码和头像均修改成功，请重新登录");
							window.location="Logout";
						}
					})
				}
				
			}
		})
	});
	
	$(function(){
			var ta=0;
		$('.username').click(function(){
			ta=ta+1;
			console.log(ta);
			if(ta==3){
				ta=1;
			}
			if(ta==1){
				$('.logout').fadeIn(500);
			}else{
				$('.logout').fadeOut(500);
			}
			
		})
		$('.vip').click(function(){
			$('.vip').removeClass('tuxian');
			$('.tankuang').fadeIn(1000);
			var c=$('.tankuang').text();
			var b=$(this).children(".vipname").html();
			var v=$(this).children(".vippic").attr("src");
			$(this).addClass('tuxian');
			$.ajax({
				url:'SelectMessage',
				type:"post",
				data:{'host':$('.username').text(),'talkname':b},
				dataType:'json',
				success:function(hhh){
					console.log(hhh.length)
					if(hhh.length!=0){
						$('.liaotianjilu').html('');
						for(var t=0;t<hhh.length;t++){
							
						if(hhh[t].send==$('.username').text()){
							$('.liaotianjilu').append('<p style="float: left;margin-top: 0px;text-align: center;font-size: 14px;color: #b0b3b7;height: 20px;width: 100%;">'+hhh[t].time+'</p><img class="womuqiandetouxiang"src="'+$('.touxiang').attr("src")+'" height="30px" width="30px"><p class="woshurude" >'+hhh[t].content+'</p>');
						}else{
							$('.liaotianjilu').append('<p style="float: left;margin-top: 0px;text-align: center;font-size: 14px;color: #b0b3b7;height: 20px;width: 100%;">'+hhh[t].time+'</p><img class="womuqiandetouxiang"src="'+v+'" height="30px" width="30px" style="float:left;margin-left: 10px;"><p class="woshurude" style="float:left;margin-left: 5px;" >'+hhh[t].content+'</p>');
							
						}
							
						}
						$('.liaotianjilu').scrollTop(9999);
					}
					
				}
				
			})
			if(c.indexOf(b)==-1){
				var a=$(this).children(".vippic").attr("src");
				$('.tankuang').append('<div class="tankuangpicss"><img src="'+a+'" class="tankuangpic"><p class="vipname" style="display:none">'+b+'</p></div>');
				$('.tankuangpicss').click(function(){
					$('.vip').removeClass('tuxian');
					$('.zhenzailiaotianname').html($(this).children('.vipname').text());
					$.ajax({
						url:'SelectMessage',
						type:"post",
						data:{'host':$('.username').text(),'talkname':$(this).children('.vipname').text()},
						dataType:'json',
						success:function(hhh){
							if(hhh.length!=0){
								$('.liaotianjilu').html('');
								for(var t=0;t<hhh.length;t++){
									
								if(hhh[t].send==$('.username').text()){
									$('.liaotianjilu').append('<p style="float: left;margin-top: 0px;text-align: center;font-size: 14px;color: #b0b3b7;height: 20px;width: 100%;">'+hhh[t].time+'</p><img class="womuqiandetouxiang"src="'+$('.touxiang').attr("src")+'" height="30px" width="30px"><p class="woshurude" >'+hhh[t].content+'</p>');
								}else{
									$('.liaotianjilu').append('<p style="float: left;margin-top: 0px;text-align: center;font-size: 14px;color: #b0b3b7;height: 20px;width: 100%;">'+hhh[t].time+'</p><img class="womuqiandetouxiang"src="'+a+'" height="30px" width="30px" style="float:left;margin-left: 10px;"><p class="woshurude" style="float:left;margin-left: 5px;" >'+hhh[t].content+'</p>');
									
								}
									
								}
								$('.liaotianjilu').scrollTop(9999);
							}
							
						}
						
					})
					
					
				})
				$('.tankuangpicss').dblclick(function(){
					$(this).remove();
				console.log($('.tankuang').children().size());
				if($('.tankuang').children().size()==0){
					$('.tankuang').fadeOut(1000);
					$('.zhenzailiaotianname').html("");
				}
				})
			}
			$('.zhenzailiaotianname').html(b);
			
			
			
		})
		
		$('.logout').click(function(){
			alert("确定不再唠一会儿？");
			window.location="Logout";
		})
	})
    
</script>
<style>
.tuxian{
background: #8080802e;
}
.woshurude{
   text-align: left;
    float: right;
    width: 34%;
    margin-top: 4px;
    padding-right: 0px;
    margin-left: 54%;
    border: 1px solid #08cb9f;
    border-radius: 10px;
    padding-left: 5px;
    margin-right: 5px;
    padding-bottom: 5px;
    padding-top: 5px;
}
.womuqiandetouxiang{
	float: right;
    margin-right: 10px;
    border: 1px;
    border-radius: 100%;
}
.fasong:ACTIVE{
background: #08cb9f;
color: white;
}
.fasong{
    float: right;
    height: 29px;
    width: 11%;
    margin-right: 15px;
    background: white;
    border: 1px solid #08cb9f;
    border-radius: 3px;
    font-size: 15px;
    outline: none;
}
.zhenzaishuru{
    width: 100%;
    height: 73%;
    float: left;
    margin-left: -6px;
    border: none;
    resize: none;
    overflow: scroll;
    overflow-x: hidden;
    font-size: 17px;
    padding-left: 10px;
    outline: none;
    letter-spacing: 1px;
    margin-top: 5px;
}
.gaimimadeanniu:ACTIVE{
background: red;
}
.gaimimadeanniu{
	width: 80px;
    height: 30px;
    background: #08cb9f;
    color: white;
    font-size: 17px;
    border: 1px;
    border-radius: 20px;
    margin-top: 10px;
    margin-right: 13px;
    margin-left: 20px;
    outline: none;

}
.updatavip{
    position: absolute;
    height: 40%;
    width: 17%;
    left: 44%;
    top: 24%;
    display:none;
    text-align: center;
}
.username:hover{
 cursor: pointer;
 color:red;
}
.logout:ACTIVE{
 background: red;
}
.logout{
    position: absolute;
    width: 50px;
    height: 30px;
    background: orange;
    left: 78%;
    top: 12%;
    border: 0px;
    font-size: 18px;
    color: white;
    border-radius: 5px;
    padding-left: 5px;
    display: none;
}
.zhenzailiaotian{
    height: 24px;
    width: 100%;
    float: left;
}
.tankuangpic:HOVER{
 cursor: pointer;
 filter: brightness(1.1);
}
.tankuangpicss{
	height: 50px;
    width: 100%;
    float: left;
}
.tankuangpic{
	float: left;
    height: 40px;
    width: 40px;
    border: 1px;
    border-radius: 100%;
    margin-left: 8px;
    margin-top: 4px;
    margin-right: 20px;

}
.vippic{
	float: left;
    height: 40px;
    width: 40px;
    border: 1px;
    border-radius: 100%;
    margin-left: 25px;
    margin-top: 4px;
    margin-right: 20px;
}

.vip:HOVER{
 background: #8080802e;
 cursor: pointer;
}
.vip{
	width: 100%;
    height: 50px;
    float: left;
    margin-bottom: 5px;
}
.shurukuang{
    float: right;
    width: 73%;
    height: 38%;
    overflow: hidden;
}
.xinxiguang{
	float: left;
    width: 73.8%;
    height: 60%;
    border: 1px solid #08cb9f;
    border-top: 0px;
    border-left: 0px;
    border-right: 0px;
    margin-top: -2px;

}
.lianxiren{
    height: 100%;
    width: 26%;
    border: 1px solid #08cb9f;
    border-bottom: 0px;
    border-top: 0px;
    border-left: 0px;
    float: left;
   	overflow-y: auto;
    overflow-x:hidden;
}
.baoguo{
height: 91.1%;
width: 100%;
border: 1px solid #08cb9f;
border-left: 0px;
border-bottom: 0px;
}
.tankuang{
	height: 451px;
    width: 4%;
    float: left;
    margin-top: 5%;
    background: #08cb9f;
    margin-left: 18.2%;
    border: 1px;
    border-radius: 3px;
    display: none;
    overflow-x: hidden;
    overflow-y: auto;
}
.headword{
	height: 30px;
	margin-top: 5px;
	margin-bottom: 5px;
}
.username{
	display: inline-block;
	float: right;
	margin-top: 4px;
	margin-right: 15px;
}
.touxiang:hover{
border: 2px solid red;
filter: brightness(1.1);
}
.touxiang{
	float: right;
	height: 30px;
	border: 2px solid #08cb9f;
	border-radius: 100%;
	margin-right: 5px;
}
.liaotianshi{
    margin-top: 0px;
    font-size: 28px;
    letter-spacing: 1px;
    font-family: kaiti;
    font-weight: 600;
    margin-bottom: 0px;
    margin-left: 20px;
}
.zuiwaiceng{
    width: 55%;
    height: 450px;
    border: 1px solid #08cb9f;
    border-radius: 3px;
    float: left;
    margin-top: 5%;
    margin-left: 22%;
    position: absolute;
}
/*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/ 
::-webkit-scrollbar  
{  
    width: 7px;  
    height: 7px;  
    background-color: #F5F5F5;  
}  
  
/*定义滚动条轨道 内阴影+圆角*/  
::-webkit-scrollbar-track  
{  
  /*   -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);   */
    background-color:#80808024;  
}  
  
/*定义滑块 内阴影+圆角*/  
::-webkit-scrollbar-thumb  
{  
    border-radius: 5px;  
 /*    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);   */
    background: lightgrey;  
}  
</style>
</html>