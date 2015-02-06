### images-opt.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
gulp          = require 'gulp'
pngquant      = require 'imagemin-pngquant' # gulp-imagemin 플러그인
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# 업무: 이미지 최적화
gulp.task 'images:opt', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build      = checkExistVar(global.build)
	# global.connecting 값 설정이 없을 경우 off로 초기화
	connecting = checkExistVar(global.connecting)

	# _img 지역 변수에 config.images 설정 객체 참조
	_img = config.images

	gulp.src(_img.src)
		# 변경된 파일만 처리
		.pipe $.changed( $.if(!build, config.dev, config.build) )
		# 이미지 최적화
		.pipe $.imagemin(
			# GIF
			interlaced: _img.gif
			# JPG
			progressive: _img.jpg
			# PNG
			optimizationLevel: _img.png
			# SVG
			svgoPlugins: _img.svg
			# Plugins
			use: [
				pngquant(_img.pngquant)
			]
		)
		# 목적지에 출력 (build 설정에 따라 달라집니다)
		.pipe gulp.dest( $.if(!build, _img.dest, _img.build))
		# 결과 출력
		.pipe $.size(title: '이미지 최적화 결과: ')
		# 출력된 결과 브라우저에 실시간 반영
		.pipe $.if(connecting, global.connect.reload())