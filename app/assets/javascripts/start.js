$(function(){
	
	var page_num = 1;
	
	$(".page_controller span").click(function(){

		var textObj = $(this).text();
		var width = $(".block").width();
		
		if(textObj == "prev"){
			page_num -= 1;
		}else if(textObj == "next"){
			page_num += 1;
		}else{
			page_num = Number(textObj);
		}
		
		$(".page_controller span").show();
		
		if(page_num == 1){
			$(".prev_btn").hide();
		}else if(page_num == 3){
			$(".next_btn").hide();
		}
		
		$(".all_block").animate({"left": width * (page_num-1) * (-1)},500);
		
		$(".circle_btn").eq(page_num - 1).addClass("selected").siblings().removeClass("selected");
		
	})
	
	$(".circle_btn:first").trigger('click');
})
