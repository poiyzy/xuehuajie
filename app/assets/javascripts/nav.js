$(function(){
	//account
	$("#account").hover(function(){
		$(this).children("ul").fadeIn(100);
	},function(){
		$(this).children("ul").fadeOut(100);
	})
	
	//search
	$(".search-query").focus(function(){
		$(this).stop().animate({width:"150px"},500);
	}).blur(function(){
		$(this).stop().animate({width:"100px"},500);
	})
})
