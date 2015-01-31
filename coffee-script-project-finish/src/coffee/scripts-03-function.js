### CoffeeScript 함수 선언 ###
module.exports = ()->
	coffee2js =
		name: 'coffee2js'
		version: '0.1.4'
		options:
			encode: 'utf-8'
			js_dir: 'js'
			coffee_dir: 'coffee'

addClass = (el, name)->
	el.classList.add(name)
	return

showMeTheMoney = ()-> '돈 내놔?!'

putYourHandUp = (who='다함께!~ ')->
	who + '손 머리 위로!!'

### CoffeeScript 함수 실행 ###

# 전달인자가 없다면 반드시 ()를 붙임.
showMeTheMoney   # (X)
showMeTheMoney() # (O)

# 전달인자가 있다면 () 생략 가능.
putYourHandUp('우리 모두~ ')

putYourHandUp '우리 모두~ '