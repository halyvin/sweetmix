$(document).ready(function(){
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
      else       points = nextUnit.find('.unit_item');
      

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