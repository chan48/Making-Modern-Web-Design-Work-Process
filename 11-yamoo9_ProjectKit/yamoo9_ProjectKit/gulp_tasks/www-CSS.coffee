### www-CSS.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config = require('../config')()
csslintReporter = require('./util/customReporter').csslint
gulp   = require 'gulp'
$      = require('gulp-load-plugins')(config.GLP_OPTION)

# _CSS 지역 변수에 config.CSS 설정 객체 참조
_CSS   = config.CSS

# -----------------------------------------------------------------
# 업무: CSS 파일 처리
gulp.task 'css', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = if global.build then global.build else off

	if !build then gulp.start 'css:move' else gulp.start 'css:concat'

# -----------------------------------------------------------------

# 업무: CSS 문법 검사
gulp.task 'css:lint', ->
	gulp.src(_CSS.src)
		# CSS 문법 검사
		.pipe $.csslint()
		.pipe $.csslint.reporter(csslintReporter)
		.pipe $.csslint.failReporter()

# ------------------------------------------------------------------
# 업무: CSS 파일 이동
gulp.task 'css:move', ['css:lint'], ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = if global.build then global.build else off

	gulp.src(_CSS.src)
		# # CSS3 브라우저 벤더 프리픽스 설정
		.pipe $.autoprefixer(config.AUTOPREFIXER)
		# CSS 정렬
		.pipe $.csscomb()
		# CSS 이동
		.pipe gulp.dest(_CSS.dest[0])
		# 명령창에 파일 크기 출력
		.pipe $.size(title: 'CSS 이동, 정렬: ')

# -----------------------------------------------------------------
# 업무: CSS 파일 처리
gulp.task 'css:concat', ['css:move'], ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = if global.build then global.build else off

	gulp.src(_CSS.dest[1])
		# CSS 병합
		.pipe $.concat(_CSS.mergeFileName)
		# CSS 압축
		.pipe $.csso(config.CSSO)
		# 복사
		.pipe gulp.dest(_CSS.build)
		# 명령창에 파일 크기 출력
		.pipe $.size(title: 'CSS 병합, 압축: ')