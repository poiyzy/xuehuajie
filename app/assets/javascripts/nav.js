$(function(){
	//account
	$("#account").hover(function(){
		$(this).children("ul").fadeIn(100);
	},function(){
		$(this).children("ul").fadeOut(100);
	})


	//notification
	notification();
	window.setInterval("notification()",5000);

      $("#notification").click(function(){
          
          $(".loading").ajaxStart(function(){
          	$(this).show();
          }).ajaxStop(function(){
          	$(this).hide();
          });
          
          //class
          $(".num").html(0);
          clear_num();
      	  $(this).addClass("clicked");
      	  $(".noti ul").show(); 
      	  //noti消失
      	  $("#containner").one("click",function(){
      	  	$("#notification").removeClass("clicked");
      	  	$(".noti ul").hide();
      	  }) 
      	  
      	  //cancel funciton
      	  $(".noti ul .cancel").click(function(){
      	  	$(this).parent().remove();
      	  })
      	    
          //ajax
          $.get('/notifications/noty_update',
            function(data){
              for(i=0;i<data.length;i++){
                var message = data[i];
                var type = message.event_type;
                var name = message.user_name;
                var user_id = message.user_id;

                var user_url = "<a href='users/" + user_id +"'>" + name + "</a>";
               
                var action;

                if(type == "follow"){
                  action = "关注了你";
                }
                alert("<li>"+user_url+ action +"<div class='cancel'></div></li>" );
                $(".noti ul").prepend("<li>"+user_url+ action +"</li>");

              }
            },"json")
      })
	
	//search
	$(".search-query").focus(function(){
		$(this).stop().animate({width:"150px"},500);
	}).blur(function(){
		$(this).stop().animate({width:"100px"},500);
	})
})


//function for clear .num
	clear_num = function(){
		var num = $(".num").html();

		if(num == "0"){
			$(".num").hide();
		}else{
			$(".num").show();
		}
	}
//notification
 function notification(){
	  $.get('/notifications/noty_update',
	      {"type" : "num"},
	      function(data){
	        $("#notification .num").html(data);
	        clear_num();
	      },
	      "json")
	}