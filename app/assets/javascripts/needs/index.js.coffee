# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
if $('body.needs').length > 0
	$('#index .slots .btn:submit').css({
		marginLeft: '-50px'
		}).hide()

	$('.slots :text').each ->
		$(this).css({
			zIndex: '10',
			position: 'relative'
			})
		if $(this).val().length > 0
			$(this).attr('readOnly', 'true')
			#$(this).next('.btn:submit').addClass('filled-slot')
		else
			$(this).on 'focus', () ->
				$(this).next('.btn:submit').show().animate({
					marginRight: '-50px'
					marginLeft: '0px',
					}, 500)

