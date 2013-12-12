$(document).ready(function(){
  // // steps master
  // if ($('.step').size()) stepsFunc();
  // function stepsFunc(){
  //   var steps = $('.step');
  //   var stepsSize = steps.length;
  //   var stepCurrent = $('.step.current');
  //   var stepsContent = $('.steps_content');
  //   var stepsContentCurrent = $('.steps_content.current');

  //   steps.on('click', function(){
  //     var idx = $(this).index();
  //     if (!$(this).hasClass('current') && !$(this).hasClass('disable')) {
  //       steps.removeClass('current');
  //       $(this).addClass('current');
  //       stepCurrent = $(this);

  //       stepsContent.removeClass('current');
  //       stepsContent.eq(idx).addClass('current');
  //       stepsContentCurrent = stepsContent.eq(idx);
  //     };
  //   });

  //   $('.to_next_step').on('click', function(){
  //     setTimeout(function(){
  //       stepCurrent.next().removeClass('disable');
  //       stepCurrent.next().addClass('current');
  //       stepCurrent.removeClass('current');
  //       stepCurrent = stepCurrent.next();

  //       stepsContentCurrent.removeClass('current');
  //       stepsContentCurrent.next().addClass('current');
  //       stepsContentCurrent = stepsContentCurrent.next();
  //     },300);
  //   });
  // };
  
  // ingregient master
  if ($('.ingredients_content').size()) ingrFunc();
  function ingrFunc(){
    var ing      = $('.ingredient_pic_wrap');
    var units    = $('.unit');

    function correctTotalPrice(priceval) {
      var curprice = parseFloat( $("#total-price").text() );
      curprice += priceval;
      $("#total-price").text( curprice.toString() + "р" );
    }
    function correctTotalWeight(weightval) {
      var curweight = parseFloat( $("#total-weight").text() );
      curweight += weightval;
      $("#total-weight").text( curweight.toString() + "г" );
    }

    ing.on('click', function(){
      var thisIng = $(this).closest($('.ingredients_item'));
      var checkedsize = thisIng.attr('data-checked-count')-0;
      var imgurl = thisIng.find('.ingredient_pic').attr('src');
      var id     = thisIng.attr('data-id');
      var price  = parseFloat( thisIng.attr('data-price') );
      var weight  = parseFloat( thisIng.attr('data-weight') );
      var nextUnit = units.not('.active').first();
      var unit   = $('.unit[data-id='+id+']');
      if ($('.unit[data-id='+id+']').size()) nextUnit = unit;
      var allreadyChecked = unit.attr('data-allready-checked-size')-0;
      var points;

      if (unit.size()) points = unit.find('.unit_item');
      else       points = nextUnit.find('.unit_item');
      

      if(nextUnit.size() && !thisIng.hasClass('all_added')) {
        // check weight capacity
        if ( parseFloat($("#total-weight").text()) + weight > parseFloat($("#max-capacity").text()) ) {
          return false;
        }
        // end of check weight capacity
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
        correctTotalPrice( price );
        correctTotalWeight( weight );
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
        correctTotalPrice( 0 - parseFloat(price) * 3 );
        correctTotalWeight( 0 - parseFloat(weight) * 3 );
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
        correctTotalPrice( 0 - (parseFloat(removableIng.attr('data-price')) * checkedsize) );
        correctTotalWeight( 0 - (parseFloat(removableIng.attr('data-weight')) * checkedsize) );
      };
    });

    // Ingredients description unchecking
    $('.ing_desc_label').on('click', function(){
      $('.ing_desc_checker:checked').click();
    });
  };
});