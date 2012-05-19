#add new slot
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

#remove slot
$('.remove_slot').on 'click', ()->
  if $(@).attr('href') == "/slots"
    $(@).parent().remove()
    false

#prevent ability to remove the first slot
$('.remove_slot').first().hide()

#sliding sign up button behavior
$('#index .slots :text').each ->
  $(@).next('.btn:submit').css({
  right: '-90px'
  })
  $(@).on 'focus', () ->
    $(@).next('.btn:submit').animate({
      right: '0px',
      }, 300)
  $(@).on 'blur', () ->
    if $(@).val().length == 0
      $(@).next('.btn:submit').animate({
      right: '-90px'
      }, 300)