$(document).ready(function(){
	// custom ui
	if ($('select').size()) $('select').dropkick();
	if ($('.pradio').size()) customRadio();
	if ($('.pcheckbox').size()) customCheckbox();


	// call popup
	$('.call').on('click', function(){
		$('.popup_wrap').toggleClass('active');
	});
	$('.overlay').add('.popup_closer').on('click', function(){
		$('.popup_wrap').toggleClass('active');
	});
});