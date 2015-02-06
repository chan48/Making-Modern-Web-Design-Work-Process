### watch.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config = require('../config')()
gulp   = require 'gulp'
$      = require('gulp-load-plugins')(config.GLP_OPTION)

# 환경설정 지역 변수
_jade   = config.jade
_sass   = config.sass
_coffee = config.coffee
_html   = config.HTML
_css    = config.CSS
_js     = config.JS
_images = config.images
_sprite = config.sprite

# 업무: 관찰(watch): Jade, Sass, CoffeeScript
gulp.task 'watch', ->

	# Jade → HTML
	$.watch [_jade.src, _jade.parts], ->
		gulp.start 'jade'

	# Sass → CSS
	$.watch _sass.src, ->
		# config.sass.type 값이
		# 'ruby'일 경우, 'sass:ruby' 실행
		# 'node'일 경우, 'sass:node' 실행
		gulp.start "sass"

	# CoffeeScript → Javascript
	$.watch _coffee.src, ->
		gulp.start 'coffee'

	# 이미지 및 스프라이트 관찰을 추가할 경우 아래 주석을 해제합니다.
	# Images 최적화
	# $.watch _images.src, ->
	# 	gulp.start 'images'

	# Sprites 생성
	# $.watch _sprite.src, ->
	# 	gulp.start 'sprites'

# ------------------------------------------------------

# 업무: 관찰(watch): HTML, CSS, JS
gulp.task 'watch:www', ->

	# HTML
	$.watch _html.src, ->
		gulp.start 'html'

	# CSS
	$.watch _css.src, ->
		gulp.start 'css'

	# JS
	$.watch _js.src, ->
		gulp.start 'js'

	# 이미지 및 스프라이트 관찰을 추가할 경우 아래 주석을 해제합니다.
	# Images 최적화
	# $.watch _images.src, ->
	# 	gulp.start 'images'

	# Sprites 생성
	# $.watch _sprite.src, ->
	# 	gulp.start 'sprites'

# ------------------------------------------------------
# 세부 업무

gulp.task 'watch:jade', ->
	# Jade → HTML
	$.watch [_jade.src, _jade.parts], ->
		gulp.start 'jade'

# ------------------------------------------------------

gulp.task 'watch:sass', ->
	# Sass → CSS
	$.watch _sass.src, ->
		# config.sass.type 값이
		# 'ruby'일 경우, 'sass:ruby' 실행
		# 'node'일 경우, 'sass:node' 실행
		gulp.start "sass"

# ------------------------------------------------------

gulp.task 'watch:coffee', ->
	# CoffeeScript → Javascript
	$.watch _coffee.src, ->
		gulp.start 'coffee'

# ------------------------------------------------------

gulp.task 'watch:images', ->
	# Images 최적화
	$.watch _images.src, ->
		gulp.start 'images'

# ------------------------------------------------------

gulp.task 'watch:sprites', ->
	# Sprites 생성
	$.watch _sprite.src, ->
		gulp.start 'sprites'

# ------------------------------------------------------

gulp.task 'watch:html', ->
	# HTML
	$.watch _html.src, ->
		gulp.start 'html'

# ------------------------------------------------------

gulp.task 'watch:css', ->
	# CSS
	$.watch _css.src, ->
		gulp.start 'css'

# ------------------------------------------------------

gulp.task 'watch:js', ->
	# JS
	$.watch _js.src, ->
		gulp.start 'js'