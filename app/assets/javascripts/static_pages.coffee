# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
root.timeBase12 = false

#$(document).on "turbolinks:load", ->
#
#
#$ ->

@onTimeBaseChange = () ->
  root.timeBase12 = !root.timeBase12

  timeBase12 = document.querySelectorAll('.base12')
  timeBase24 = document.querySelectorAll('.base24')

  if root.timeBase12
    timeBase12.forEach(showTime)
    timeBase24.forEach(hideTime)
  else
    timeBase12.forEach(hideTime)
    timeBase24.forEach(showTime)

@showTime = (value, index, array) ->
  value.style.display = "block"

@hideTime = (value, index, array) ->
  value.style.display = "none"