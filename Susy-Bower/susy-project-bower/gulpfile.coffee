###! gulpfile.coffee © yamoo9.net, 2015 ###
'use strict'
# ------------------------------------------------------------------------
# 환경설정 & 모듈 호출
# ------------------------------------------------------------------------
config       = do require './config'           # 환경설정
del          = require 'del'                   # 제거
runSequence  = require 'run-sequence'          # 실행순서
preen        = require 'preen'                 # Bower 패지키 관리(필요한 파일만)
gulp         = require 'gulp'                  # Gulp
# Gulp 유틸리티 모듈
connect      = do require 'gulp-connect-multi' # 웹 서버
gulpif       = require 'gulp-if'               # 조건처리
size         = require 'gulp-size'             # 변경 사이즈 출력
watch        = require 'gulp-watch'            # 관찰
plumber      = require 'gulp-plumber'          # 오류 발생시에도 관찰 지속
# HTML 관련 모듈
jade         = require 'gulp-jade'             # Jade → HTML
prettify     = require 'gulp-html-prettify'    # HTML 읽기 쉽게 정렬
# CSS 관련 모듈
sass         = require 'gulp-sass'             # Sass → CSS
compass      = require 'gulp-compass'          # Sass&Compass → CSS
autoprefixer = require 'gulp-autoprefixer'     # 벤더 프리픽스 적용
csscomb      = require 'gulp-csscomb'          # CSS 정렬
csso         = require 'gulp-csso'             # CSS 압축
# Javascript 관련 모듈
coffee       = require 'gulp-coffee'           # CoffeeScript → Javascript

# ------------------------------------------------------------------------
# Gulp 업무(Tasks): [default, watch]
# ------------------------------------------------------------------------
# 기본
gulp.task 'default', ['clean', 'preen:bower'], (cb)->
	runSequence 'connect', ['jade', 'sass', 'coffee'], 'watch', cb

# 변경사항 관찰
gulp.task 'watch', ->
	# Jade → HTML
	watch [config.jade.src, config.jade.parts], ->
		gulp.start 'jade'
	# Sass → CSS
	watch config.sass.src, ->
		gulp.start 'sass'
	# CoffeeScript → Javascript
	watch config.coffee.src, ->
		gulp.start 'coffee'

# Gulp 업무(Tasks): Gulp 업무(Tasks): 
# [connect, clean, jade, sass]
# ------------------------------------
# 웹 서버
gulp.task 'connect', connect.server(config.SERVER)

# 제거
gulp.task 'clean', del.bind(null, config.del)

# preen → bower:copy 단축 업무
gulp.task 'preen:bower', ->
	runSequence 'preen', 'bower:copy'

# Bower 패키지에서 필요한 파일만 골라내기(Preen)
gulp.task 'preen', (cb)->
	preen.preen({}, cb)

# Bower 패키지 복사
gulp.task 'bower:copy', ->
	for name, setValue of config.bower
		gulp.src(setValue.src)
			.pipe gulp.dest(setValue.dest)
	return

# HTML 템플릿(Jade): Jade → HTML
gulp.task 'jade', ->
	gulp.src(config.jade.src)
		.pipe plumber()
		.pipe jade()
		.pipe prettify(config.HTML_PRETTIFY)
		.pipe gulp.dest(config.dev)
		.pipe size(title: 'Jade: ')
		.pipe connect.reload()

# CSS 프리프로세싱(Sass): Sass → CSS
gulp.task 'sass', ->
	gulp.src(config.sass.src)
		.pipe plumber()
		.pipe sass(sourceComments: 'normal')
		.on('error', (err)->console.error 'Error', err.message)
		.pipe autoprefixer(config.AUTOPREFIXER)
		.pipe csscomb()
		.pipe gulp.dest 'dist/css/'
		.pipe size(title: 'Sass: ')
		.pipe connect.reload()

# CSS 프리프로세싱(Sass on Ruby): Sass & Compass → CSS
gulp.task 'compass', ->
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
		.pipe size(title: 'Sass&Compass: ')
		.pipe connect.reload()

# JS 컴파일링(CoffeeScript)
gulp.task 'coffee', ->
	gulp.src(config.coffee.src)
		.pipe plumber()
		.pipe coffee(bare:true)
		.pipe gulp.dest(config.coffee.dest)
		.pipe size(title: 'CoffeeScript: ')
		.pipe connect.reload()