### CoffeeScript 객체/배열 ###
# 객체(Object)
DOMHelper = 
	info:
		author: 'yamoo9'
		version: '0.1.6'
	guery: (selector)->
		document.querySelector(selector)
	id: (name)->
		document.getElementById(name)
	tag: (name, parent=document)->
		parent.getElementsByTagName(name)









# 배열(Array)
imgSrc = [
	'images/bg.jpg'
	'images/logo.jpg'
	'images/arrow.png'
]