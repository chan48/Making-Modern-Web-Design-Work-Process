### CoffeeScript 조건문 if ###
body      = document.body
UA        = navigator.userAgent.toLowerCase()
isIphone  = UA.indexOf('iphone') > -1
isAndroid = UA.indexOf('android') > -1

# Javascript 조건문 if ~ else와 유사
if isIphone
	body.classList.add 'iphone'
else if isAndroid
	body.classList.add 'android'
else
	body.classList.add 'no-iphone'
	body.classList.add 'android'

# if 조건 then 조건이 참이면 처리되는 코드
if isIphone then body.classList.add 'iphone'
else if isAndroid then body.classList.add 'android'
else 
	body.classList.add 'no-iphone'
	body.classList.add 'android'

# 조건이 참이면 처리되는 코드 if 조건
body.classList.add 'iphone' if isIphone