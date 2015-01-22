### do 키워드 + 함수 이름 ###
# 출력: callingPhone()
do callingPhone

### do 키워드 + 함수 실행 ###
# 출력: require('module')()
module = do require 'module'


### 즉시 실행함수 ###
# 출력: (function() {})()
do ->

### jQuery 활용###
do jQuery.noConflict
do ($=jQuery)->


### Javascript 클로저 ###
jsClosure1 = do ->->

jsClosure2 = do ()->
	num = 0
	(innerFnArgs)->
		value = ++num + 3