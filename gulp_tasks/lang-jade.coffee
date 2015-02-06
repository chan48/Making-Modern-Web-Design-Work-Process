### lang-jade.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
errorNotify   = require('./util/error-notify')
gulp          = require 'gulp'
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _jade 지역 변수에 config.jade 설정 객체 참조
_jade         = config.jade

# 업무: Jade → HTML
gulp.task 'jade', ->

  # global.build 값 설정이 없을 경우 off로 초기화
  build      = checkExistVar(global.build)
  # global.connecting 값 설정이 없을 경우 off로 초기화
  connecting = checkExistVar(global.connecting)

  gulp.src(_jade.src)
    # 빌드(Build) 환경이 아닐 경우, Jade 옵션 사용
    .pipe $.jade( $.if(!build, _jade.option) )
    # 문법 오류 발생해도 관찰(watch) 지속
    # .pipe $.plumber(errorHandler: $.notify.onError "오류!: <%= error.message %>")
    .on 'error', errorNotify
    # HTML 문법 검사
    # Error: Unable to access jarfile vnu.jar
    # .pipe $.html(config.HTML.options)
    # 빌드(Build) 환경일 경우 코드 압축, 아닐 경우 코드 포멧 정리
    .pipe $.if( !build, $.prettify(config.HTML_PRETTIFY), $.htmlmin(config.HTML_MIN) )
    # 빌드(Build) 환경일 경우 config.build, 아닐 경우 config.dev에 출력
    .pipe gulp.dest( $.if( !build, config.dev, config.build ) )
    # 결과 출력
    .pipe $.size(title: 'Jade → HTML: ')
    # 출력된 결과 브라우저에 실시간 반영
    .pipe $.if(connecting, global.connect.reload())