//年月日
$(function(){
	$("#profile_birthday_1i").click(function(){
		calendar();	
	});
	
	
	$("#profile_birthday_2i").click(function(){
		calendar();	
	});
	
})


calendar = function(){

		var year = $("#profile_birthday_1i").val();
		var ping = year % 4;
		var month = $("#profile_birthday_2i").val();
		var day = $("#profile_birthday_3i").val();
		var sday = $("#profile_birthday_3i");
		//改写 日	
		switch (month) {
			case "1":
			case "3":
			case "5":
			case "7":
			case "8":
			case "10":
			case "12":
			{
				sday.children().show();
			}
			break;
			case "4":
			case "6":
			case "9":
			case "11":
			{
				sday.children().hide().end().children(":lt(30)").show();
			}
			break;
			case "2":
			{
				sday.children().hide().end().children(":lt(28)").show();
				if(ping == "0"){
					sday.children(":eq(28)").show();
				}
			}
			break;
		}
	//刷新日
	if(sday.children(":eq("+(day-1)+")").css("display") == "none"){
		sday.val("1");
	}
}