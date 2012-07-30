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
				required: "true,",
				email: "true"
			},
			
			"user[password]":{
				required: "Please provide a password",
				minlength: "Your password must be at least 5 characters long"
			}
		}
	})
})
