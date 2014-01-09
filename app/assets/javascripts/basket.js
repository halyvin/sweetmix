var myApp = angular.module('sweetapp', []);

myApp.controller('BasketCtrl', ['$scope', function($scope){
  $scope.basket_items = window.basket_items;

  $scope.total_price = 0;
  $scope.total_weight = 0;

  $scope.recalcTotals = function() {
    var totpr = 0, totwt = 0;
    for (var i = 0; i < $scope.basket_items.length; i++) {
      var biCount = $scope.basket_items[i].count;
      totpr += $scope.basket_items[i].price * biCount;
      totwt += $scope.basket_items[i].weight * biCount;
    }
    $scope.total_price = totpr;
    $scope.total_weight = totwt;
  }

  $scope.recalcTotals();

  $scope.removeBasketItem = function( itemid ) {
    for (var i = 0; i < $scope.basket_items.length; i++) {
      if ($scope.basket_items[i].id === itemid) {
        $scope.basket_items.splice(i, 1);
        $scope.recalcTotals();
        break;
      }
    }
  };

  $scope.clearBasket = function() {
    $scope.basket_items = [];
    $scope.recalcTotals();
  };
}]);

// $(document).ready(function(){
//   if ($('.quantity_select').length) { customQuantity(); }
// });

window.customQuantity = function(){

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