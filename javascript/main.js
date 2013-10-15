$(document).ready(function(){
	// custom ui
	if ($('select').size()) $('select').dropkick();
	if ($('.pradio').size()) customRadio();


	// call popup
	$('.call').on('click', function(){
		$('.popup_wrap').toggleClass('active');
	});
	$('.overlay').add('.popup_closer').on('click', function(){
		$('.popup_wrap').toggleClass('active');
	});

	// questions
	$('.question').not('.current').on('click', function(){
		$('.question').removeClass('current');
		$(this).addClass('current');
	});

	$('.func_reply').on('click', function(event){
		$('.add_comment_form').removeClass('current');
		$('.func_reply').closest('.inner_comment').find('.add_comment_form').addClass('current');
	});


	// slider at index.html
	if ($('.slider_wrap').size()) slider($('.slider_wrap'));
	function slider(sliderItem){
		var slider = sliderItem;

		function initControls(slider){

			var slidesWrap = slider.find('.sliders').eq(0);
			var slides     = slider.find('.slide');
			var dotsSize   = slides.length;
			var dotsWrap   = slider.find('.slider_dots');
			var slideHeight= 0;
			function sliderH(){
					for (var i = 0; i < dotsSize; i++) {dotsWrap.append('<li class="slider_dot"></li>')};
				for (var i = slides.length - 1; i >= 0; i--) {
					console.log(slideHeight)
					if(slides.eq(i).height()>slideHeight) slideHeight = slides.eq(i).height();
				};
				slides.height(slideHeight);
			};sliderH();
			$('.slider_wrap').load(sliderH)
		
			function initPseudo(){
				var firstSlide = slides.first();
				var lastSlide  = slides.last();
				slidesWrap.append(firstSlide.clone().addClass('pseudo').css('margin-left','-4px'));
				slidesWrap.prepend(lastSlide.clone().addClass('pseudo').css('margin-right','-4px'));
				slides = slider.find('.slide');
			};
			initPseudo();

			var dots = slider.find('.slider_dot');
			var prev = slider.find('.prev');
			var next = slider.find('.next');	
			slidesWrap.width(slidesWrap.width()*(dotsSize+2));
			slides.width(100/(dotsSize+2)+'%');
			slidesWrap.css('left','-100%');
			var current = slides.eq(1).addClass('current');
			dots.first().addClass('current');

			dots.on('click', function(){
				slidesWrap.addClass('on');
				var dot = $(this);
				var dotidx = dot.index()-0+1;
				slidesWrap.css('left', -100*dotidx+'%');
				current = slides.eq(dotidx);
				slides.removeClass('current');
				dots.removeClass('current');
				current.addClass('current');
				dot.addClass('current');
				clearInterval(autoplay);
				autoDotsClick();
			});

			function autoDotsClick(){
				autoplay = setInterval(function(){
					var currentDot = dotsWrap.find('.current');
					if (currentDot.next().size()) {
						currentDot.next().click();
						}
					else {next.click()};
				},10000);
			};
		
			prev.on('click', function(){
				slidesWrap.addClass('on');
				var idx = current.index()-1;
				current.toggleClass('current');
				current = current.prev();
				current.toggleClass('current')
				slidesWrap.css('left', -100*idx+'%');
				dots.removeClass('current');
				dots.eq(idx-1).addClass('current');

				if (current.hasClass('pseudo')) {
					current.toggleClass('current')
					current = slides.last().prev().addClass('current');
					setTimeout(function(){
						slidesWrap.toggleClass('on');
						slidesWrap.css('left', -100*(slides.length-2)+'%');
					}, 500);
					dots.last().addClass('current');
				};
				clearInterval(autoplay);
				autoDotsClick();
			});
			next.on('click', function(){
				slidesWrap.addClass('on');
				var idx = current.index()-0+1;
				current.toggleClass('current');
				current = current.next();
				current.toggleClass('current')
				slidesWrap.css('left', -100*idx+'%');
				dots.removeClass('current');
				dots.eq(idx-1).addClass('current');

				if (current.hasClass('pseudo')) {
					current.toggleClass('current')
					current = slides.eq(1).addClass('current');
					setTimeout(function(){
						slidesWrap.toggleClass('on');
						slidesWrap.css('left', '-100%');
					}, 500);
					dots.first().addClass('current');
				};
				clearInterval(autoplay);
				autoDotsClick();
			});
			autoDotsClick();
		};
		initControls(slider);
	};

	// steps master
	if ($('.step').size()) stepsFunc();
	function stepsFunc(){
		var steps = $('.step');
		var stepsSize = steps.length;
		var stepCurrent = $('.step.current');
		var stepsContent = $('.steps_content');
		var stepsContentCurrent = $('.steps_content.current');

		steps.on('click', function(){
			var idx = $(this).index();
			if (!$(this).hasClass('current') && !$(this).hasClass('disable')) {
				steps.removeClass('current');
				$(this).addClass('current');
				stepCurrent = $(this);

				stepsContent.removeClass('current');
				stepsContent.eq(idx).addClass('current');
				stepsContentCurrent = stepsContent.eq(idx);
			};
		});

		$('.to_next_step').on('click', function(){
			setTimeout(function(){
				stepCurrent.next().removeClass('disable');
				stepCurrent.next().addClass('current');
				stepCurrent.removeClass('current');
				stepCurrent = stepCurrent.next();

				stepsContentCurrent.removeClass('current');
				stepsContentCurrent.next().addClass('current');
				stepsContentCurrent = stepsContentCurrent.next();
			},300);
		});
	};
	
	// ingregient master
	if ($('.ingredients_content').size()) ingrFunc();
	function ingrFunc(){
		var ing      = $('.ingredients_item');
		var units    = $('.unit');
		var nextUnit = units.not('.active').first();

		ing.on('click', function(){
			var checkedsize = $(this).attr('data-checked-count')-0;
			var imgurl = $(this).find('.ingredient_pic').attr('src');
			var id     = $(this).attr('data-id');

			if(nextUnit.size() && !$(this).hasClass('all_added')) {
				nextUnit.addClass('active');
				nextUnit.find('.unit_pic').attr('src',imgurl);
				nextUnit.attr('data-id', id);
				nextUnit = units.not('.active').first();
				if(checkedsize>1) $(this).addClass('all_added');
				$(this).attr('data-checked-count',checkedsize+1);
			};
			if($(this).hasClass('all_added') && checkedsize==3) {
				$(this).attr('data-checked-count',2);
				$(this).removeClass('all_added');
				$('.unit[data-id='+id+']').last().removeClass('active');
				$('.unit[data-id='+id+']').last().find('.unit_pic').attr('src','');
				$('.unit[data-id='+id+']').last().attr('data-id','');
				nextUnit = units.not('.active').first();
			};
		});

		units.on('click', function(){
			if($(this).hasClass('active')) {
				var id = $(this).attr('data-id');
				$(this).attr('data-id','')
				$(this).removeClass('active');
				$(this).find('.unit_pic').attr('src','');
				nextUnit = units.not('.active').first();

				var removableIng = $('.checked_ingedients').find('[data-id='+id+']')
				var checkedsize = removableIng.attr('data-checked-count')-0;
				removableIng.attr('data-checked-count',checkedsize-1);
				if(checkedsize>2) removableIng.removeClass('all_added');
			};
		});
	};
	








	

});