### www-HTML.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
gulp          = require 'gulp'
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _HTML 지역 변수에 config.HTML 설정 객체 참조
_HTML         = config.HTML

# -----------------------------------------------------------------
# 업무: CSS 파일 처리
gulp.task 'html', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build = checkExistVar(global.build)

	# global.connecting 값 설정이 없을 경우 off로 초기화
	connecting = checkExistVar(global.connecting)

	gulp.src(_HTML.src)
		# HTML 문법 검사
		# 참고: Error: Unable to access jarfile vnu.jar
		# .pipe $.html(config.HTML.options)
		# 빌드(Build) 환경일 경우 코드 압축, 아닐 경우 코드 포멧 정리
		.pipe $.if( !build, $.prettify(config.HTML_PRETTIFY), $.htmlmin(config.HTML_MIN) )
		# 빌드(Build) 환경일 경우 config.build, 아닐 경우 config.dev에 출력
		.pipe gulp.dest( $.if(!build, _HTML.dest, _HTML.build) )
		# 출력된 결과 브라우저에 실시간 반영
		.pipe $.if(connecting, global.connect.reload())