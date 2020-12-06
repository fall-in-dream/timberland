/**
 * 
 */

	
	$(function(){
		$(".delete").click(function(){
			
			var $tr = $(this).parent().parent();
			var title = $.trim($tr.find("td:first").text());
			var flag = confirm("确定要删除" + title + "吗?");
			
			if(flag){
				return true;
			}
			
			return false;
		});
		
		//ajax 修改单个商品的数量:
		//1. 获取页面中所有的 text, 并为其添加 onchange 响应函数. 弹出确认对话框: 确定要修改吗? 
		$(":text").change(function(){
			var quantityVal = $.trim(this.value);

			var flag = false;
			
			var reg = /^\d+$/g;
			var quantity = -1;
			if(reg.test(quantityVal)){
				quantity = parseInt(quantityVal);
				if(quantity >= 0){
					flag = true;
				}
			}
			
			if(!flag){
				alert("输入的数量不合法!");
				$(this).val($(this).attr("step"));
				return;
			} 
			
			var $tr = $(this).parent().parent();
			var title = $.trim($tr.find("td:first").text());

			if(quantity == 0){
				var flag2 = confirm("确定要删除" + title + "吗?");

				if(flag2){
					//得到了 a 节点
					var $a = $tr.find("td:last").find("a");
					//执行 a 节点的 onclick 响应函数.
					$a[0].onclick();
					
					return;
				} else {
					$(this).val($(this).attr("value"));
					return;
				}
			} else if (!confirm("确定要修改" + title + "的数量吗?")) {
				$(this).val($(this).attr("value"));
				return;
			}
			

			//2. 请求地址为: computerServlet
			var url = "ClothesServlet";
			
			//3. 请求参数为: method:updateItemQuantity, id:name属性值, quantity:val, time:new Date()
			var idVal = $.trim(this.name);
			var args = {"method":"updateItemQuantity", "id":idVal, "quantity":quantityVal};
			
			//4. 在 updateItemQuantity 方法中, 获取 quanity, id, 再获取购物车对象, 调用 service 的方法做修改
			//5. 传回 JSON 数据: computerNumber:xx, totalMoney

			//6. 更新当前页面的 computerNumber 和 totalMoney

			$.post(url, args, function(data){
				var itemMoney = data.itemMoney;
				var totalMoney = data.totalMoney;
				$tr.find("span").html(itemMoney);
				$("#totalMoney").html("商品总金额：CNY:" + totalMoney);
			},"JSON");
			
		});
				
	});
	
