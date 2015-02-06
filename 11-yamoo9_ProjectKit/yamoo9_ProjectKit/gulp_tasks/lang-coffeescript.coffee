### lang-coffeescript.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
errorNotify   = require('./util/error-notify')
gulp          = require 'gulp'
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _coffee 지역 변수에 config.coffee 설정 객체 참조
_coffee       = config.coffee

# 업무: CoffeeScript → Javascript
gulp.task 'coffee', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build      = checkExistVar(global.build)
	# global.connecting 값 설정이 없을 경우 off로 초기화
	connecting = checkExistVar(global.connecting)


	gulp.src(_coffee.src)
		# 빌드(Build) 환경이 아닐 경우, 소스맵 초기화
		.pipe $.if( !build, $.sourcemaps.init() )
		# 문법검사
		.pipe $.coffeelint()
		# 문법검사 결과 화면에 출력
		.pipe $.coffeelint.reporter()
		# 빌드(Build) 환경이 아닐 경우, _coffee.option 옵션 사용
		.pipe $.coffee( $.if(!build, _coffee.option) )
		# 문법 오류 발생해도 관찰(watch) 지속
		# .pipe $.plumber()
		.on 'error', errorNotify
		# 파일 병합
		.pipe $.concat(config.coffee.mergeFileName)
		# 빌드(Build) 환경이 아닐 경우, 소스맵 작성
		.pipe $.if( !build, $.sourcemaps.write() )
		# 빌드(Build) 환경이 아닐 경우에만 개발 폴더(예: dist)로 출력
		.pipe $.if( !build, gulp.dest(_coffee.dest) )
		# JS 파일 필터링
		# .pipe $.filter('*.js')
		# 코드 압축
		.pipe $.uglify()
		# 이름 변경: min 접미사 추가
		.pipe $.rename(suffix: '.min')
		# 빌드(Build) 환경이 아닐 경우, 개발 폴더(예: dist)로 출력
		.pipe gulp.dest $.if( !build, _coffee.dest, _coffee.build )
		# 명령창에 파일 크기 출력
		.pipe $.size(title: 'Coffee → JS: ')
		# 웹 브라우저에 실시간 반영
		.pipe $.if(connecting, global.connect.reload())