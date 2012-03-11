# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
if $('body.needs').length > 0
	$('#new_slot').on 'click', ()->
		$newSlot = $('.slot').last().clone()
		currentNum = $newSlot.find('input').attr('name')
		if currentNum.substr(24, 1) == ']'
			newNum = currentNum.substr(23, 1)
		else
			newNum = currentNum.substr(23, 2)
		newNum = parseInt(newNum) + 1
		newNum = "need[slots_attributes][" + newNum + "][notes]"
		$newSlot.find('input').attr('name', newNum)

		$newSlot.appendTo('.slots')
		false
