$(function(){
// showpic
	$("#123").click(function(){
		$("#lightboxOverlay,.showpic").fadeIn(300);
		$("#lightboxOverlay").click(function(){
			$("#lightboxOverlay,.showpic").fadeOut(300);
		})	
		column();
	})
	column();
	$(window).resize(function(){
		column();
	})
//show pic left
	$(".left_column").hover(function(){
		$(this).children(".arrow").fadeIn(300);
	},function(){
		$(this).children(".arrow").fadeOut(300);
	});	
	$(".cancelbox").click(function(){
		$("#lightboxOverlay").trigger("click");
	})
// uploadpic
	$(".upload_btn").click(function(){
		$("#lightboxOverlay,.upload_form").fadeIn(300);
		$("#lightboxOverlay").click(function(){
			$("#lightboxOverlay,.upload_form").fadeOut(300);
		})	
		column();
	})
	

})

column = function(){
	var win_height = $(this).height();
	var win_width = $(this).width();
	var left_column_height = $(".left_column").height();
	$("#lightboxOverlay").css({"width":$(document).width(),"height":$(document).height()});
	$(".left_column").css("top",($(".showpic").height() - left_column_height)/2-15);
	$(".right_column").css("height",win_height-60);
	
	$(".showpic,.upload_form").each(function(){
		var width = $(this).width();
		var height = $(this).height();
		$(this).css({top:(win_height - height)/2-20,left:(win_width-width)/2});
	})
	
	
}
