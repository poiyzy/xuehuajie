$(function(){
// showpic
	$(".pin img").click(function(){
		$("#lightboxOverlay,.showpic").fadeIn(300);
                
                var num = $(this).attr("no");
                
                $.get("",
                  {"no" : num},
                  function(data){
                    var src = data.src;
                    var comment_count = data.comment_count;
                    var like_count = data.like_count;
                    var author_name = data.author_name;
                    var is_following =  data.is_following;
                    var description = data.description;
                    var author_id = data.author_id;
                    var comments = data.comments;

                    $("<img src="+ src +"/>").prependTo(".left_column");

                    
                    
                    result = {:src => @picture.image.url(:presentation),
              :comment_count => @picture.comments.count,
              :like_count => @picture.like_count,
              :author_name => @user.profile.user_name,
              :author_avatar => @user.avatars.where(:active => true).first.logo(:actor),
              :is_following => current_user.has_followed(@user),
              :description => @picture.description,
              :author_id => @user.id,
              :comments => @picture.comments.limit(20).all
  
                  
                  },"json")


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
