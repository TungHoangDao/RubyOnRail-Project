# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
root.timeBase12 = false
root.type = 1




#Toggle between time base 12 or time base 24
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

# Show time block
@showTime = (value, index, array) ->
  value.style.display = "block"
# Hide time block
@hideTime = (value, index, array) ->
  value.style.display = "none"

# Dropdown for citi search and selection.
@myFunction = () ->
  document.getElementById("myDropdown").classList.toggle("show");

# Trigger when user selectes a city in the dropdown menu
@zoneSelect = (zone) ->
  input = document.getElementById("myInput");
  input.value = zone.toString()
  myFunction()

# Do filter cities's name when typing in the input field.
@filterFunction = () ->
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByTagName("button");
  i = 0
  while (i < a.length)
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1)
      a[i].style.display = "";
    else
      a[i].style.display = "none"

    i++


@changeTheme = (type) ->
  theme = document.querySelectorAll('.theme')
  if (type == 1)
    theme.forEach(changeBlack)
  else if (type == 2)
    theme.forEach(changeGraphite)
  else
    theme.forEach(changeWhite)

@changeBlack = (value, index, array) ->
  value.style.backgroundColor = "#2E2F30"
  value.style.color = "white"

@changeGraphite = (value, index, array) ->
  value.style.backgroundColor = "#553355"
  value.style.color = "#55ffFF"

@changeWhite = (value, index, array) ->
  value.style.backgroundColor = "white"
  value.style.color = "#2E2F30"
