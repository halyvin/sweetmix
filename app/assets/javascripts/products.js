// This is a manifest file that'll be compiled into products.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require angular
//= require basket

function BasketController($scope) {

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
}
