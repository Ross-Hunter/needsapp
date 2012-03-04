# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
if $('body.needs').length > 0
	$('#new_slot').on 'click', ()->
		$('.slot').first().clone().appendTo('.slots')
		false
