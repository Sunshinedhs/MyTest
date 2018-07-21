<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="util/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
<!--  -->
<s:if test="#session.existAdminUser==null">
你还没有登陆，请登录后再试！
<jsp:include page="AdminLogin.jsp"></jsp:include>
</s:if>
<s:else>
<%@ include file="top.jsp" %>
<s:form id="form" action="adminproduct_save" enctype="multipart/form-data" type="post" namespace="/" theme="simple">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="6"
						height="26">
						<strong><STRONG>添加商品</STRONG>
						</strong>
					</td>
				</tr>

				<tr >
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input class="requird" type="text" name="name" value="" id="userAction_save_do_logonName" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						是否热门：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="hot">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						价格：
					</td>
					<td colspan="3" class="ta_01" bgColor="#ffffff">
						<input class="requird" type="text" name="price" value="" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						库存：
					</td>
					<td  colspan="3" class="ta_01" bgColor="#ffffff">
						<input class="requird" type="text" name="quantity" value="" id="userAction_save_do_logonName" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品图片：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
					<label>
						<input class="requird upload" type="file" name="upload" />
						<img class="preview" alt="预览一" src="##">					
					</label>
					<label>
						<input class="requird upload" type="file" name="upload" />
						<img class="preview" alt="预览二" src="##">
					</label>	
					<label>
						<input class="requird upload" type="file" name="upload" />					
						<img class="preview" alt="预览三" src="##">
					</label>					
					<label>
						<input class="requird upload" type="file" name="upload" />
						<img class="preview" alt="预览四" src="##">
					</label>	
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						所属的二级分类：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<select name="categorySecond.csid">
							<s:iterator var="cs" value="csList">
								<option value="<s:property value="#cs.csid"/>"><s:property value="#cs.csname"/></option>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<textarea class="requird" name="info" rows="5" cols="30"></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok" style="display: none">
							&#30830;&#23450;
						</button>
						<input type="button" id="dsds" value="提交">
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		
		</s:form>
</s:else>
		
</body>
<style>
input{
outline-color: red;
}
</style>
<script type="text/javascript">
		$('#dsds').click(function(){
			var requird=true;
			$('.requird').each(function(){
				var val=$.trim($(this).val());
				if(val==''){
					$(this).focus();
					shank($(this),"selectshank",4);
					requird=false;
					return false;
					
				}
			});
			if(requird==true){
				$('#userAction_save_do_submit').click();
			}else{
				alert("有项目未填写完整");
				return false;
			}
		});
		function shank(ele,cls,times){
			var i=0,t = false, o =ele.attr("class")+" ", c = "",times=times||2;
			if(t) return;
			t=setInterval(function(){
				i++;
				c = i%2 ? o+cls : o;
				ele.attr("class",c);
				if(i==2*times){
					clearInterval(t);
					ele.removeClass(cls);
				}
				
			},200);
		};
		$('.upload').click(function(){
			$(this).siblings(".preview").attr("src","");
		})
		$('.upload').change(function(){
			var currentpic=this.files[0];
			var currentPre=$(this).siblings(".preview");
			
			var r=new FileReader();
			r.readAsDataURL(currentpic);
			r.onload=function(){
				currentPre.attr("src",this.result);
			};
		})
		
</script>
<style>
.upload{
display: none;
}
.preview{
width: 100px;
height: 100px;
margin-right: 50px;
}
</style>
</html>