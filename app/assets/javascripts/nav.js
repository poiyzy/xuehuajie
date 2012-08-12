$(function(){
	//account
	$("#account").hover(function(){
		$(this).children("ul").fadeIn(100);
	},function(){
		$(this).children("ul").fadeOut(100);
	})


//notification
      $("#notification").click(function(){
          //class
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
                alert("<li>"+user_url+ action +"</li>" );
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
