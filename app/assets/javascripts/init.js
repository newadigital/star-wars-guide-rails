(function($) {
	
	'use strict';

	$(document).ready(function () { 

		var $window = $(window),
			$goToTopEl = $('#toTop');

		$goToTopEl.click(function() {
			$('body,html').stop(true).animate({scrollTop:0},400);
			return false;
		});

		$window.on('scroll', function() {
			if($window.scrollTop() > 680) {
				$goToTopEl.fadeIn();
			} else {
				$goToTopEl.fadeOut();
			}
		});
			
	});

})(jQuery);