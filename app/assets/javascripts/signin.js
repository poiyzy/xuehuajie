/**
 * @author Mato
 * 
 */


$(function(){
	
//email input
	$("#user_email").mouseover(function(){
		
		var val = $(this).val();
		
		if(val == "邮箱"){
			if(this)
			$(this).val("").focus();
		}
		
	}).blur(function(){
		var val = $(this).val();
		
		if(val == ""){
			if(this)
			$(this).val("邮箱");
		}
	});

	
//click checkbox
	$(".check").click(function(){
		$(this).toggleClass("checked");
		var checkObj = $(this).children("input")[0];
		checkObj.checked=!checkObj.checked;
	});

		
	
})
