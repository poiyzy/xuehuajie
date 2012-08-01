$(function(){
	$("#new_user").validate({
		rules:{
			"user[email]":{
				required: true,
				email: true
			},
			"user[password]":{
				required: true,
				minlength: 6
			},
			"user[password_confirmation]":{
				required: true,
				minlength: 6,
				equalTo: "#user_password"
			}
		},
		messages:{
			
			"user[email]":{
				required: "请输入邮箱",
				email: "请输入一个有效邮箱"
			},
			
			"user[password]":{
				required: "请输入一个密码",
				minlength: "密码长度需大于6"
			},
			"user[password_confirmation]":{
				required: "请再次输入密码",
				minlength: "密码长度需大于6",
				equalTo: "密码不匹配"
			}
		},
		errorElement:"p",
		success:function(label){
			label.siblings("span").css("display","block").removeClass("no");
			label.siblings("div").fadeOut(500);
			label.parent().removeClass("error");
		}
		
		
	})
	
	// focus and blur
	$("input").focus(function(){
		var inputObj = $(this);
		if(inputObj.hasClass("valid")){
			inputObj.siblings("div").fadeOut(500);
		}else{
			inputObj.siblings("div").fadeIn(500);
		}
				
	}).blur(function(){
		var inputObj = $(this);
		var text = inputObj.siblings("p").text();
		if(text !== ""){
		inputObj.siblings("div").children(".invalid_body").text(text);
		}
		
		if(inputObj.hasClass("error")){
			inputObj.siblings("span").css("display","block").addClass("no");
			inputObj.siblings("div").fadeIn(500);
			inputObj.parent().addClass("error");
		}
	})
	
	$("#user_email").click(function(){
		if($(this).val() == "邮箱"){
			$(this).val("");
		}
	}).blur(function(){
		var val = $(this).val();
		if($(this).val() == ""){
			$(this).val("邮箱");
		}
	});
	
	
	
	
})
