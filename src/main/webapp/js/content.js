window.onload=function(){	
/*导航条固定位置*/
//在窗口大小变化时更新
	$(window).resize(function(){
		scroll();
	});
	function scroll(){//滚动事件合集
	/*导航条设置fixed效果*/
	var winWidth=$(window).width();
		$(window).scroll(function(){
			var top=$(document).scrollTop();
			var nav=$('.nav');
			if(winWidth>480){
			 	if(top>120){
			 		nav.addClass("wrap_logo_fixed");
			 		nav.removeClass("wrap_logo");
			 	}else{
			 		nav.addClass("wrap_logo");
			 		nav.removeClass("wrap_logo_fixed");
				}
				//设置回到顶部按钮效果
				if(top>=400){
					//$('#to_top').css("display","block");
					$("#to_top").fadeIn("slow");
				}else{
					//$('#to_top').css("display","none");
					$("#to_top").fadeOut("slow");
				}
			}
		});
	}
	scroll();//执行滚动事件
	//给左侧菜单做个当前页面效果
		$(".content_l_list").find("li").click(function(){
				$(".content_l_list").find("li").each(function(){
					$(this).css({"border":"none","border-bottom":"1px solid #E5E5E5"});
					$(this).find("span").css("color","#a9a9a9");
				});
				$(this).css("border-bottom","2px solid #ff6347");	
				$(this).find("span").css("color","#ff6347");
		});
	
	//封装一个ajax异步更新按钮事件			
 function btnClick(btn,newhtml){
	$(btn).on("click",function(){
			$(".content_right").css("display","block");
			$(".content_right2").css("display","none");
			$(".content_right").html("<div class=\"load_img\"> <img src=\"..\/images\/loading2.gif\"/> </div>");//过度动画
			$(".content_right").load(newhtml);
		});
	}
	//过度动画
	$(document).ajaxStart(function(){
		$(".load_img").css("display","block");
	});
	$(document).ajaxStop(function(){
		$(".load_img").css("display","none");
	});	
	$("#environment").on('click',function(){
		$(".content_right").css("display","none");
		$(".content_right2").css("display","block");
	});
	//左侧菜单按钮事件
	btnClick("#about","nav_about.do?id=3");
	btnClick("#services","nav_about.do?id=1");
	btnClick("#knowledge","nav_about.do?id=4");
	btnClick("#professional","nav_about.do?id=5");
	btnClick("#contact","nav_about.do?id=13");
//回到顶部
$('#to_top').click(function(){
		$('body,html').animate({scrollTop:0},500);
});


}
