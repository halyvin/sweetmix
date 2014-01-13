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

	// add to cart link
	$(".want_to_basket").click(function(evnt) {
		var $anchor = $(this);
		var stopRelocating = false;
		var prodid;
		if (prodid = $anchor.attr('data-id')) {
			evnt.preventDefault(); // stop clicking
			stopRelocating = true; // the same
			window.sweetCartAdd( prodid );
			$anchor.removeClass( 'want_to_basket' );
			$anchor.text( 'В корзине' );
		}
		return !stopRelocating;
	});
});

// ---------------------------------------------------------------------------
// ===== CART ITEMS ======
// ---------------------------------------------------------------------------
var CART_PRODUCTS_DELIM = '&';
var CART_COUNT_DELIM = 'c';
var CART_COUNT_MAXIMUM = 5;

function _getSweetCartElements() {
	return ($.cookie('sweetcart') || "").split( CART_PRODUCTS_DELIM );
}

function _putElementsToSweetCart(elements) {
	if (elements[0] == "") { elements.shift(); }
	$.cookie('sweetcart', elements.join('&'), { path: '/' });
}

function _getElementIndexByProductId( elements, prodid ) {
	var foundIndx = -1;
	for (var j = 0; j < elements.length; j++) {
		if (elements[j].split('c')[0] == prodid) {
			foundIndx = j;
			break;
		}
	}
	return foundIndx;
}

window.sweetCartAdd = function( prodid ) {
	var elements = _getSweetCartElements();
	var foundIndx = _getElementIndexByProductId( elements, prodid );
	if ( foundIndx < 0) {
		elements.push( prodid.toString() + CART_COUNT_DELIM + "1" );
	}
	else {
		var element_parts = elements[foundIndx].split( CART_COUNT_DELIM );
		var count = Math.min(parseInt(element_parts[1]) + 1, CART_COUNT_MAXIMUM);
		element_parts[1] = count.toString();
		elements[foundIndx] = element_parts.join( CART_COUNT_DELIM );
	}
	_putElementsToSweetCart( elements );
}
window.sweetCartRemove = function( prodid ) {
	// afsdfsdf
}
window.sweetCartClear = function() {
	$.cookie('sweetcart', '');
}
