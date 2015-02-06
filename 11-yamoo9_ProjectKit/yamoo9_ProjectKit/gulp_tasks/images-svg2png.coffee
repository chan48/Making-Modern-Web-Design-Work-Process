### images-svg2png.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
gulp          = require 'gulp'
$             = require('gulp-load-plugins')(config.GLP_OPTION)


# 업무 단축 이름 설정
gulp.task 'svg2png', ['images:svg2png']

# --------------------------------------------------------------------------------------
# 업무: SVG → PNG
gulp.task 'images:svg2png', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build      = checkExistVar(global.build)
	# global.connecting 값 설정이 없을 경우 off로 초기화
	connecting = checkExistVar(global.connecting)

	# _images 지역 변수에 config.images 설정 객체 참조
	_images    = config.images
	# _svg2png 지역 변수에 config.images.svg2png 설정 객체 참조
	_svg2png   = _images.svg2png

	gulp.src(_svg2png.src)
		# SVG → PNG
		.pipe $.svg2png()
		# 이미지 최적화
		# .pipe $.imagemin(_images.option)
		# 목적지에 출력
		.pipe gulp.dest(_svg2png.dest)
		# 결과 출력
		.pipe $.size(title: 'SVG → PNG 결과: ')
		# 출력된 결과 브라우저에 실시간 반영
		# .pipe $.if(connecting, global.connect.reload())