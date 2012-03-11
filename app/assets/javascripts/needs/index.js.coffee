# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
if $('body.needs').length > 0
	$('#index .slots .btn:submit').css({
		marginLeft: '-80px'
		}).hide()
	$('.slots :text').each ->
		$(this).on 'focus', () ->
			$(this).next('.btn:submit').show().css({marginRight: '-80px'}).animate({
				marginLeft: '0px',
				}, 500)
		$(this).on 'blur', () ->
			if $(this).val().length == 0
				$(this).next('.btn:submit').animate({
				marginLeft: '-80px'
				}, 500)

