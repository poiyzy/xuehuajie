//= require ./jquery
//= require jquery_ujs
//= require ./jquery-ui
//= require ./picture
//= require ./nav
//= require ./mylightbox
//
//


//home left and right
	$(function(){
		left_and_right();
	//resize
		$(window).resize(function(){
			left_and_right();
		})
	})

//function	
left_and_right = function(){
			var left_left = ($("#containner").width() - 945) / 2;
			var left_right = left_left + 195 ;
			var right_right = left_left;
			if(left_left > 200){
				left_left = 200;
				left_right = 395;
				right_right = 200;
			}
			$("#left").css({"left":left_left,"right":left_right});
			$("#right").css("right",right_right);
			
			var left_padding = ($("#left").width() - 750)%250/2 ;
			$("#left").css({"left":left_left,"right":left_right,"padding-left":left_padding});
}

