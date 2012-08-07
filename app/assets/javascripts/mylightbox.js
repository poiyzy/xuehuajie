$(function(){
	$("#123").click(function(){
		$("#lightboxOverlay").css({"width":$(document).width(),"height":$(document).height()})
		.fadeIn(300)
		.click(function(){
			$(this).fadeOut(300);
		}).next().fadeIn(500).click(function(){
			$("#lightboxOverlay,#lightboxcontainner").fadeOut(300);
		}).children().click(function(){
			return false;
		});
	})
	
	$(window).resize(function(){
		var win_height = $(this).height();
		var win_width = $(this).width();
		
		$("#left_column").css("top",(win_height-$("#left_column").height())/2-30);
		$("#right_column").css("height",win_height-60);
	})
})
