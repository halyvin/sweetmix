$(document).ready(function(){
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
});