# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$('#new_slot').on 'click', ()->
	$newSlot = $('.slot').last().clone('true')
	currentNum = $newSlot.find('input').attr('name')
	if currentNum.substr(24, 1) == ']'
		newNum = currentNum.substr(23, 1)
	else
		newNum = currentNum.substr(23, 2)
	newNum = parseInt(newNum) + 1
	newNum = "need[slots_attributes][" + newNum + "][name]"
	$newSlot.find('input').attr('name', newNum).val('')
	$newSlot.find('a').attr('href', '/slots')

	$newSlot.appendTo('.slots')
	$('.slot').last().find('a').show()
	false

$('.remove_slot').on 'click', ()->
	if $(this).attr('href') == "/slots"
		$(this).parent().remove()
		false

$('.remove_slot').first().hide()

