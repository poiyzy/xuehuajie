//= require ./jquery
//= require jquery_ujs
//= require ./jquery-ui
//= require ./picture
//= require ./nav
//
//



var notify = window.setInterval("notification()",5000);
function notification(){
  $.get('/notifications/noty_update',
      {"type" : "num"},
      function(data){
        alert(data)
      },
      "json")
}
