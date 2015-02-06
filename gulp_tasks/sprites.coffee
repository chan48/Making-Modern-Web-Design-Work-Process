### sprites.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
gulp = require 'gulp'

# 업무: 스프라이트 이미지/CSS스타일 자동 생성 종합
gulp.task 'sprites', [
	'sprites:png'
	'sprites:svg-win' # Windows 환경, gulp-svg-sprite 모듈 사용
	# 'sprites:svg'   # OSX 환경, gulp-svg-sprites 모듈 사용
]