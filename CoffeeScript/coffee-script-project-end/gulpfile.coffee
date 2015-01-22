### gulpfile.js © yamoo9.net, 2015 ###
'use strict'

# 환경설정 & 모듈 호출
# ------------------------------------
config      = do require './config' # require('./config')()
del         = require 'del'
runSequence = require 'run-sequence'
gulp        = require 'gulp'
gulpif      = require 'gulp-if'
size        = require 'gulp-size'
watch       = require 'gulp-watch'
jade        = require 'gulp-jade'
prettify    = require 'gulp-html-prettify'
plumber     = require 'gulp-plumber'
compass     = require 'gulp-compass'
autoprefixer= require 'gulp-autoprefixer'
coffee      = require 'gulp-coffee'
connect     = do require 'gulp-connect-multi'


# Gulp 업무(Tasks): [default, watch]
# ------------------------------------
# 기본
gulp.task 'default', ['clean'], (cb)->
	# 업무 실행 순서
	runSequence 'connect', ['sass', 'template', 'watch'], cb

# 변경사항 관찰
gulp.task 'watch', ->
	# Jade 템플릿
	watch [config.jade.src, config.jade.parts], ->
		gulp.start 'template'
	# Sass
	watch config.sass.src, ->
		gulp.start 'sass'
	# CoffeeScript
	watch config.coffee.src, ->
		gulp.start 'coffee'

# Gulp 업무(Tasks): Gulp 업무(Tasks): 
# [connect, clean, template, sass]
# ------------------------------------
# 웹 서버
gulp.task 'connect', connect.server(config.SERVER)

# 제거
gulp.task 'clean', del.bind(null, config.del)

# HTML 템플릿(Jade)
gulp.task 'template', ->
	gulp.src(config.jade.src)
		.pipe plumber()
		.pipe jade()
		.pipe prettify(config.HTML_PRETTIFY)
		.pipe gulp.dest(config.dev)
		.pipe size(title: 'Jade: ')
		.pipe connect.reload()

# CSS 프리프로세싱(Sass)
gulp.task 'sass', ->
	gulp.src(config.sass.src)
		.pipe plumber(
			errorHandler: (error)->
				console.log error.message
				@.emit 'end'
				return
		)
		.pipe compass(config.SASS_OPTION)
		.on('error', (err)->)
		.pipe gulpif '*.css', autoprefixer(config.AUTOPREFIXER)
		.pipe gulp.dest(config.sass.dest)
		.pipe size(title: 'Sass: ')
		.pipe connect.reload()

# JS 컴파일링(CoffeeScript)
gulp.task 'coffee', ->
	gulp.src(config.coffee.src)
		.pipe plumber()
		.pipe coffee(bare: true)
		.pipe gulp.dest(config.coffee.dest)
		.pipe size(title: 'CoffeeScript: ')
		.pipe connect.reload()