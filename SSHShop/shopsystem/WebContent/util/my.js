	$(function(){
		$('#search').bind("input propertychange",function(){
			var a=$.trim($('#search').val());
			if(a.length==0){
				$('#table1').html("");
				$('#table1').fadeOut(0);
			}else{
				$('#table1').html("");
				$.ajax({
					url:'product_smartTip',
					type:'post',
					data:{'key':a},
					dataType:'json',
					success:function(data){
						if(data.length==0){
							$('#table1').html("");
							$('#table1').fadeOut(0);
						}else{
							for(var t=0;t<data.length;t++){
								$('#table1').fadeIn(0);
								$('#table1').append('<tr><td class="hh">'+data[t].name+'</td></tr>');
							}
							$('.hh').click(function(){
								$('#table1').html("");
								$('#search').val($(this).text());
							})
						}
					},
				})
			}
		})
		
		$('.but1').click(function(){
			if($('#search').val().length!=0){
				window.location="product_vagueSearch?key="+$('#search').val();
			}
		})
		
		$('.delbut').click(function(){
			var pid=$(this).parent().siblings(".pid").text();
			var tr =$(this).parent().parent();
			$.ajax({
				url:'adminproduct_delete.action',
				type:'post',
				data:{'pid':pid},
				success:function(data){
					tr.remove();
				},
			})
		})
		
		
		
		$('.onepro').change(function(){
			var css=$(this).children().children(".changebut").css("background","red");
			var pid=$(this).children(".pid").text();
			var pic=$(this).children(".pic").text();
			var csid=$(this).children(".csid").text();
			var name=$(this).children(".name").children("input").val();
			var price=$(this).children(".price").children("input").val();
			var quantity=$(this).children(".quantity").children("input").val();
			var hot=$(this).children(".hot").children(".s_hot").val();
			var info=$(this).children(".info").children("input").val();
			$('.changebut').click(function(){
				window.location="adminproduct_update?pid="+pid+"&name="+name+"&price="+price+"&quantity="+quantity+"&hot="+hot+"&info="+info+"&pic="+pic+"&categorySecond.csid="+csid;
			})
		})
	})
