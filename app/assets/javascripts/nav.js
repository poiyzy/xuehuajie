$(function(){
	$("#account").hover(function(){
		$(this).children("ul").fadeIn(100);
	},function(){
		$(this).children("ul").fadeOut(100);
	})
})
