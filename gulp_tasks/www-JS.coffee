### www-JS.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
errorNotify   = require('./util/error-notify')
runSequence   = require('run-sequence')
gulp          = require 'gulp'
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _JS 지역 변수에 config.JS 설정 객체 참조
_JS           = config.JS

# ---------------------------------------------------------------
# 업무: JS 파일 처리
gulp.task 'js', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = checkExistVar(global.build)

	runSequence 'js:move', 'js:concat'
	# if !build then gulp.start 'js:move' else gulp.start 'js:concat'


# ---------------------------------------------------------------
# 업무: JS 파일 처리
gulp.task 'js:hint', ->
	gulp.src(_JS.src)
		# 문법검사
		.pipe $.jshint()
		# 문법검사 결과 화면에 출력
		.pipe $.jshint.reporter('jshint-stylish')

# ---------------------------------------------------------------
# 업무: JS 파일 이동
gulp.task 'js:move', ['js:hint'], ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = checkExistVar(global.build)

	gulp.src(_JS.src)
		# 이동
		.pipe gulp.dest(_JS.dest[0])
		# 명령창에 파일 크기 출력
		.pipe $.size(title: 'JS 이동: ')

# ---------------------------------------------------------------
# 업무: JS 파일 병합/압축
gulp.task 'js:concat', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = checkExistVar(global.build)

	gulp.src(_JS.dest[1])
		# JS 병합
		.pipe $.concat(_JS.mergeFileName)
		# JS 압축
		.pipe $.if(build, $.uglify())
		# 복사
		.pipe $.if(!build, gulp.dest(_JS.dest[0]), gulp.dest(_JS.build))
		# 명령창에 파일 크기 출력
		.pipe $.size(title: 'JS 병합, 압축: ')