### bower.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
preen         = require 'preen'
runSequence   = require 'run-sequence'
gulp          = require 'gulp'
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _bower 지역 변수에 config.bower 설정 객체 참조
_bower        = config.bower


# 업무: Bower 종합
gulp.task 'bower', ['bower:preen'], ->
	runSequence [
		'bower:lib-sass'
		'bower:lib-js'
	],
	'fontawesome:rename-scss', # font-awesome.scss 이름 변경
	'fontawesome:del-scss'     # font-awesome.scss 파일 제거

# ---------------------------------------------------------------

# Bower 패키지에서 필요한 파일만 골라내기(Preen)
gulp.task 'bower:preen', (cb)->
	preen.preen({}, cb)

# ---------------------------------------------------------------

# 업무: Bower 컴포넌트 Sass 라이브러리 파일 이동
gulp.task 'bower:lib-sass',->
	for name, setValue of _bower.components
		# FontAwesome일 경우만 세부 처리
		if name is 'fontawesome'
			for value, i in setValue.src
				gulp.src(value)
					.pipe gulp.dest(setValue.dest[i])
		# 다른 컴포넌트는 일반 처리
		else
			gulp.src(setValue.src)
				.pipe gulp.dest(setValue.dest)

# ---------------------------------------------------------------

# 업무: Bower 컴포넌트 JS 파일을 모두 압축
gulp.task 'bower:lib-js',->
	gulp.src(_bower.src)
		# 압축되지 않은 JS 파일만 필터링
		.pipe $.filter(['**/*.js', '!**/*.min.js'])
		# 파일 압축
		.pipe $.uglify()
		# 압축된 JS 파일 병합
		.pipe $.concat(_bower.jsMergeFileName)
		# 목적지로 출력
		.pipe gulp.dest(_bower.dest.js)
