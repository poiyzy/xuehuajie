/**
 * @author Mato
 * 
 */


$(function(){
	$(".check").click(function(){
		$(this).toggleClass("checked");
		var checkObj = $(this).children("input")[0];
		checkObj.checked=!checkObj.checked;
	});

		
	
})
