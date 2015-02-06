### sprites-svg.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
gulp          = require 'gulp'
pngquant      = require 'imagemin-pngquant' # gulp-imagemin 플러그인
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _images 지역 변수에 config.images 설정 객체 참조
_images       = config.images
# _sprite 지역 변수에 config.sprite.SVG 설정 객체 참조
_sprite       = config.sprite.SVG


# 업무: SVG 스프라이트 이미지/스타일 문서 자동 생성 및 이동
gulp.task 'sprites:svg', ['sprites:svg-generate'], ->
  gulp.start 'sprites:svg-move'

# --------------------------------------------------------------------------------------
# 업무: SVG 스프라이트 이미지/스타일 문서 자동 생성
gulp.task 'sprites:svg-generate', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = checkExistVar(global.build)

	gulp.src(_sprite.src)
		# SVG 스프라이트 이미지 생성
		.pipe $.svgSprites(_sprite.option)
		# 개발/빌드 환경에 따라 목적지 변경
		.pipe gulp.dest(_sprite.dest)
		#
		.pipe $.filter('**/*.svg')
		# .pipe $.imagemin(_images.option)
		.pipe $.svg2png()
		.pipe $.imagemin(_images.option)
		.pipe gulp.dest(_sprite.dest)
		.pipe $.size(title: 'SVG 스프라이트 이미지 생성 결과: ')

# --------------------------------------------------------------------------------------
# 업무: SVG 스프라이트 이미지/스타일 문서 이동
gulp.task 'sprites:svg-move', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = checkExistVar(global.build)

	gulp.src(_sprite.move.src)
		.pipe $.filter '**/*.{css,svg,png}'
		.pipe gulp.dest( $.if(!build, _sprite.move.dest, _sprite.move.build) )