# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
root.selectedTopic = []
root.categories

$(document).on "turbolinks:load", ->
  $('div[data-categories]').each ->
    root.categories = $(this).data('categories')
  onBtnRecentPostClick(document.getElementById("btn-recentpost"),'#0FB2EF','#ffffff')

$ ->
  $('div[data-categories]').each ->
    root.categories = $(this).data('categories')
#    alert(root.categories)

@hidePosts = (keys) ->
  if root.btnSelectedPost?
    if root.btnSelectedPost.isSelected
      categoriesKey = keys.split("|")
      categoriesKey.forEach(hidePost)

@showAllPost = () ->
  demoClasses = document.querySelectorAll('.recent-post')
  demoClasses.forEach(showDiv)

@refreshPosts = () ->
  if !root.categories?
    location.reload(true)

  hidePosts(root.categories)


@hidePost = (value, index, array) ->
  if root.selectedTopic.indexOf(value) >= 0
#    alert(value + " show")
    demoClasses = document.querySelectorAll('.' + value)
    demoClasses.forEach(showDiv)
  else
#    alert(value + " hide")

    demoClasses = document.querySelectorAll('.' + value)
    demoClasses.forEach(hideDiv)

@showDiv = (value, index, array) ->
  value.style.display = "block"

@hideDiv = (value, index, array) ->
  value.style.display = "none"

@initCategories = (keys) ->
#  alert("init category")
  root.categories = keys

@paintIt = (element, backgroundColor, textColor,key,keys) ->
    categoriesKey = keys.split("|")

    if element.tag == undefined
      element.tag = 1
      element.color = element.style.backgroundColor
      element.textColor = element.style.color
      element.style.backgroundColor = backgroundColor
      if textColor?
        element.style.color = textColor
      root.selectedTopic.push(key)
      hidePosts(keys)
#      alert(root.selectedTopic)
      return

    if element.tag == 1
      element.tag = 0
      element.style.backgroundColor = element.color
      element.style.color = element.textColor
      root.selectedTopic.splice(root.selectedTopic.indexOf(key),1)
    else
      element.tag = 1
      element.style.backgroundColor = backgroundColor
      if textColor?
        element.style.color = textColor

      root.selectedTopic.push(key)
#      alert(root.selectedTopic)

    hidePosts(keys)


@onBtnRecentPostClick = (element, backgroundColor, textColor) ->
  if !root.defaultBackgroundColor?
    root.defaultBackgroundColor = element.style.backgroundColor

  if !root.defaultTextColor?
    root.defaultTextColor = element.style.color

  root.btnRecentPost = element
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor

  if !root.btnSelectedPost?
    root.btnSelectedPost = document.getElementById("btn-selectedpost")

  root.btnSelectedPost.style.backgroundColor = root.defaultBackgroundColor
  root.btnSelectedPost.style.color = root.defaultTextColor
  root.btnSelectedPost.isSelected = false

  showAllPost()

  if root.searchKey
    if root.searchKey.length > 0
      onRefreshSearch()


@onBtnSelectedPostClick = (element, backgroundColor, textColor) ->
  root.btnSelectedPost = element
  element.isSelected = true
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor

  if !root.btnRecentPost?
    root.btnRecentPost = document.getElementById("btn-recentpost")

  root.btnRecentPost.style.backgroundColor = root.defaultBackgroundColor
  root.btnRecentPost.style.color = root.defaultTextColor

  refreshPosts()

  if root.searchKey
    if root.searchKey.length > 0
      onRefreshSearch()


@onSearchChanged = (element) ->
  demoClasses = document.querySelectorAll('.recent-post')
  root.searchKey = element.value
  if (element.value.length <= 0)
    demoClasses.forEach(showDiv)
  else
    demoClasses.forEach(showSearchPost)

@onRefreshSearch = () ->
  demoClasses = document.querySelectorAll('.recent-post')
  if (root.searchKey.length <= 0)
    demoClasses.forEach(showDiv)
  else
    demoClasses.forEach(showSearchPost)

@showSearchPost = (value, index, array) ->
  post = value.querySelectorAll("h5");
  value.style.display = "none"
  if post[0].innerText.toLocaleLowerCase().search(root.searchKey.toLocaleLowerCase()) > 0
    value.style.display = "block"
    post[0].style.color = "orange"

  if root.btnSelectedPost
    if root.btnSelectedPost.isSelected
      refreshPosts()
