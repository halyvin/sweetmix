$(document).ready(function(){

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
});