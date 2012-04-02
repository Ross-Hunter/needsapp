# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$('#new_slot').on 'click', ()->
	$newSlot = $('.slot').last().clone('true')

	currentName = $newSlot.find('input').first().attr('name')
	currentNum = currentName.match(/\d+/g)
	newNum = parseInt(currentNum) + 1
	newName = currentName.replace(currentNum, newNum)
	$newSlot.find('input').first().attr('name', newName).val('')

	currentName = $newSlot.find('input').last().attr('name')
	currentNum = currentName.match(/\d+/g)
	newNum = parseInt(currentNum) + 1
	newName = currentName.replace(currentNum, newNum)
	$newSlot.find('input').last().attr('name', newName).val('')
	$newSlot.find('a').attr('href', '/slots')

	$newSlot.appendTo('.slots')
	$('.slot').last().find('a').show()
	false

$('.remove_slot').on 'click', ()->
	if $(this).attr('href') == "/slots"
		$(this).parent().remove()
		false

$('.remove_slot').first().hide()