### error-notify.coffee © yamoo9.net, 2015 ###
'use strict'

# 외부 모듈 호출
notify = require('gulp-notify')

# 모듈 정의
module.exports = ->

	# 전달인자 슬라이스(Array 프로토타입 call 메소드 활용)
	args = Array::slice.call(arguments)

	# gulp-notify 모듈 onError 메소드 활용
	notify.onError(
		title: '오류!'
		message: '<%= error.message %>').apply this, args

	# Error 발생시에도 Stream 끊기지 않도록 조치
	@emit 'end'

	return