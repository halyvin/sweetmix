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

	// questions
	$('.question').on('click', function(){
		$(this).toggleClass('current');
	});


	$('.func_reply').on('click', function(event){
		$('.add_comment_form').removeClass('current');
		$('.func_reply').closest('.inner_comment').find('.add_comment_form').addClass('current');
	});


	// quantity select 
	if ($('.quantity_select').size()) customQuantity();

	function customQuantity(){

		$('.quantity_select').each(function(){
			var el   = $(this);
			var name = el.attr('name');
			var id   = el.attr('id');
			var val  = el.attr('value');

			var html = '<div class="custom_quantity" data-name="'+name+'" data-id="'+id+'"><div class="cq_output">'+val+'</div><div class="cq_up"></div><div class="cq_down"></div></div>'
			el.after(html).hide();
		});

		// Handlers
		$('.cq_up').on('click',function(){
			var el = $(this);
			var select = el.closest('.custom_quantity');
			var output = select.find('.cq_output');
			var id = select.attr('data-id');
			var realinput = $('#'+id);


			var val = realinput.attr('value');
			if (val > realinput.attr('min')) {
				val = val - 1; 
				output.text(val);
				realinput.attr('value',val)
			};	
		return true;
		});
		$('.cq_down').on('click',function(){
			var el = $(this);
			var select = el.closest('.custom_quantity');
			var output = select.find('.cq_output');
			var id = select.attr('data-id');
			var realinput = $('#'+id);

			var val = realinput.attr('value');
			if (val < realinput.attr('max')) {
				val = val -0 + 1; 
				output.text(val);
				realinput.attr('value',val)
			};	

		return true;
		});
	};

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
		var ing      = $('.ingredient_pic_wrap');
		var units    = $('.unit');

		ing.on('click', function(){
			var thisIng = $(this).closest($('.ingredients_item'));
			var checkedsize = thisIng.attr('data-checked-count')-0;
			var imgurl = thisIng.find('.ingredient_pic').attr('src');
			var id     = thisIng.attr('data-id');
			var nextUnit = units.not('.active').first();
			var unit   = $('.unit[data-id='+id+']');
			if ($('.unit[data-id='+id+']').size()) nextUnit = unit;
			var allreadyChecked = unit.attr('data-allready-checked-size')-0;
			var points;

			if (unit.size()) points = unit.find('.unit_item');
			else 			 points = nextUnit.find('.unit_item');
			

			if(nextUnit.size() && !thisIng.hasClass('all_added')) {
				if ($('.unit[data-id='+id+']').size() && checkedsize<3) {
					$('.unit[data-id='+id+']').attr('data-allready-checked-size', allreadyChecked+1);
					if(checkedsize>1) thisIng.addClass('all_added');
					thisIng.attr('data-checked-count',checkedsize+1);
				}
				else {
					nextUnit.addClass('active');
					nextUnit.find('.unit_pic').attr('src',imgurl);
					nextUnit.attr('data-id', id);
					nextUnit = units.not('.active').first();
					if(checkedsize>1) thisIng.addClass('all_added');
					thisIng.attr('data-checked-count',checkedsize+1);
					$('.unit[data-id='+id+']').attr('data-allready-checked-size', '1');
				}
				points.not('.current').first().addClass('current');
			};

			if(thisIng.hasClass('all_added') && checkedsize==3) {
				$('.unit[data-id='+id+']').attr('data-allready-checked-size', 0);
				thisIng.attr('data-checked-count',0);
				thisIng.removeClass('all_added');
				$('.unit[data-id='+id+']').last().removeClass('active');
				$('.unit[data-id='+id+']').last().find('.unit_pic').attr('src','');
				$('.unit[data-id='+id+']').last().attr('data-id','');
				nextUnit = units.not('.active').first();
				points.removeClass('current');
			};
		});

		units.on('click', function(){
			if($(this).hasClass('active')) {
				var id = $(this).attr('data-id');
				$(this).find('.unit_item').removeClass('current');
				$(this).attr('data-id','')
				$(this).attr('data-allready-checked-size','0')
				$(this).removeClass('active');
				$(this).find('.unit_pic').attr('src','');
				nextUnit = units.not('.active').first();

				var removableIng = $('.checked_ingedients').find('[data-id='+id+']')
				var checkedsize = removableIng.attr('data-checked-count')-0;
				removableIng.attr('data-checked-count', 0);
				if(checkedsize>2) removableIng.removeClass('all_added');
			};
		});

		// Ingredients description unchecking
		$('.ing_desc_label').on('click', function(){
			$('.ing_desc_checker:checked').click();
		});
	};
	








	

});