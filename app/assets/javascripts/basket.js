var myApp = angular.module('sweetapp', ['ngCookies']);

myApp.directive('myRepeatDirective', function() {
  return function(scope, element, attrs) {
    if (scope.$last) { scope.$evalAsync( window.customQuantity ); }
  };
});

myApp.controller('BasketCtrl', ['$scope', '$http', '$cookies', function($scope, $http, $cookies) {
  $scope.basket_items = [];

  $scope.denis = { vova: 2 }

  $scope.total_price = 0;
  $scope.total_weight = 0;

  // TODO refactor (all cart functions in main.js)
  function getSweetcartElements() {
    return ($cookies.sweetcart || "").split('&');
  }
  function putElementsToSweetcart(elements) {
    $cookies.sweetcart = elements.join('&');
    return true;
  }
  function getIndexByProductId(elements, idshnik) {
    var found_indx = -1;
    for (var j = 0; j < elements.length; j++) {
      if (elements[j].split('c')[0] == idshnik) {
        found_indx = j;
        break;
      }
    }
    return found_indx;
  }

  function recalcTotals() {
    var totpr = 0, totwt = 0;
    for (var i = 0; i < $scope.basket_items.length; i++) {
      var biCount = $scope.basket_items[i].count;
      totpr += $scope.basket_items[i].price * biCount;
      totwt += $scope.basket_items[i].weight * biCount;
    }
    $scope.total_price = totpr;
    $scope.total_weight = totwt;
  }

  $scope.$watch('basket_items', function() {
    recalcTotals();
  }, true);

  recalcTotals();

  $scope.saveCount = function (item) {
    var cart_elements = getSweetcartElements();
    var j = getIndexByProductId(cart_elements, item.id);
    if (j > -1) {
      var elem_parts = cart_elements[j].split('c');
      elem_parts[1] = item.count.toString();
      cart_elements[j] = elem_parts.join('c');
    }
    putElementsToSweetcart(cart_elements);
  }

  $scope.removeBasketItem = function( itemid ) {
    for (var i = 0; i < $scope.basket_items.length; i++) {
      if ($scope.basket_items[i].id === itemid) {
        $scope.basket_items.splice(i, 1);

        var cart_elements = getSweetcartElements();
        var j = getIndexByProductId(cart_elements, itemid);
        if (j > -1) { cart_elements.splice(j, 1); }
        putElementsToSweetcart(cart_elements);
        break;
      }
    }
  };

  $scope.clearBasket = function() {
    $scope.basket_items = [];
    $cookies.sweetcart = "";
  };

}]);

window.customQuantity = function(){

  $('.quantity_select').each(function(){
    var el   = $(this);
    var name = el.attr('name');
    var id   = el.attr('id');
    var val  = el.val();// el.attr('value');

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

$(document).ready(function() {
  $("#checkout-link").click(function(evnt) {
    var linkDisabled;
    if (linkDisabled = $(this).hasClass('disable')) {
      evnt.preventDefault();
    }
    return !linkDisabled;
  });
});