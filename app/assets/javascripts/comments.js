$(document).ready(function(){
  $('.func_reply').on('click', function(event){
    $('.add_comment_form').removeClass('current');
    $('.func_reply').closest('.inner_comment').find('.add_comment_form').addClass('current');
  });
});