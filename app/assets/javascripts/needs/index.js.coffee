# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$('#index .slots :text').each ->
	$(this).next('.btn:submit').css({
	right: '-90px'
	})
	$(this).on 'focus', () ->
		$(this).next('.btn:submit').animate({
			right: '0px',
			}, 300)
	$(this).on 'blur', () ->
		if $(this).val().length == 0
			$(this).next('.btn:submit').animate({
			right: '-90px'
			}, 300)

