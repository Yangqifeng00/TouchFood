$(document).ready(function(){
	var header = $(".header-text");
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		if ($(".index-page").length > 0) {
			if (scroll >= 270) {
				header.addClass("remove");
			} else {
				header.removeClass("remove");
			}
		}else{
			if (scroll >= 120) {
				header.addClass("remove");
			} else {
				header.removeClass("remove");
			}
		}
	});
});