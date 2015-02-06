### lang-sass.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
errorNotify   = require('./util/error-notify')
gulp          = require 'gulp'
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _sass 지역 변수에 config.sass 설정 객체 참조
_sass         = config.sass

# --------------------------------------------------------------------------------------
# 업무: Sass 엔진 선택 조건 처리
gulp.task 'sass', ->
  # sass=ruby 또는 sass=node 설정 값이 없으면 config.sass.type 값으로 엔진 선택
  _sass_type = (process.env.sass ? _sass.type)
  switch _sass_type
    when 'ruby'
      gulp.start 'sass:ruby'
    when 'node'
      gulp.start 'sass:node'
    else
      # 오류 발생 시, 명령창 화면에 출력
      $.util.log $.util.colors.red('오류!: '), $.util.colors.green('sass=ruby 또는 sass=node로 선언해야 합니다.')

# --------------------------------------------------------------------------------------
# 업무: Ruby 엔진, Sass(Scss) → CSS
gulp.task 'sass:ruby', ->

  # global.build 값 설정이 없을 경우 off로 초기화
  build      = checkExistVar(global.build)
  # global.connecting 값 설정이 없을 경우 off로 초기화
  connecting = checkExistVar(global.connecting)

  # Ruby 기반의 Sass 사용법은 다소 다름
  $.rubySass( _sass.src, $.if(!build, _sass.option, _sass.buildOption) )
    # 문법 오류 발생해도 관찰(watch) 지속
    # .pipe $.plumber(errorHandler: $.notify.onError "오류!: <%= error.message %>")
    .on 'error', errorNotify
    # CSS3 브라우저 벤더 프리픽스 설정
    .pipe $.autoprefixer(config.AUTOPREFIXER)
    # CSS 정렬
    .pipe $.csscomb()
    # CSS3 미디어쿼리 병합
    .pipe $.combineMq()
    # 빌드(Build) 환경이 아닐 경우, 소스맵 작성
    .pipe $.if( !build, $.sourcemaps.write() )
    # 빌드(Build) 환경일 경우, 코드 압축
    .pipe $.if( build, $.csso(config.CSSO) )
    # 빌드(Build) 환경이 아닐 경우, 개발 폴더(예: dist)로 출력
    .pipe gulp.dest( $.if( !build, _sass.dest, _sass.build ) )
    # 명령창에 파일 크기 출력
    .pipe $.size(title: 'Ruby Sass(Scss) → CSS: ')
    # 웹 브라우저에 실시간 반영
    .pipe $.if(connecting, global.connect.reload())

# --------------------------------------------------------------------------------------
# 업무: Node 엔진, Sass(Scss) → CSS
gulp.task 'sass:node', ->

  # global.build 값 설정이 없을 경우 off로 초기화
  build      = checkExistVar(global.build)
  # global.connecting 값 설정이 없을 경우 off로 초기화
  connecting = checkExistVar(global.connecting)

  gulp.src(_sass.src)
    # 빌드(Build) 환경이 아닐 경우, 소스맵 초기화
    .pipe $.if( !build, $.sourcemaps.init() )
    # 빌드(Build) 환경이 아닐 경우, config.sass.option 사용
    .pipe $.sass( $.if(!build, _sass.option, _sass.buildOption) )
    # 문법 오류 발생해도 관찰(watch) 지속
    # .pipe $.plumber(errorHandler: $.notify.onError "오류!: <%= error.message %>")
    .on 'error', errorNotify
    # CSS3 브라우저 벤더 프리픽스 설정
    .pipe $.autoprefixer(config.AUTOPREFIXER)
    # CSS 정렬
    .pipe $.csscomb()
    # CSS3 미디어쿼리 병합
    .pipe $.combineMq()
    # 빌드(Build) 환경이 아닐 경우, 소스맵 작성
    .pipe $.if( !build, $.sourcemaps.write() )
    # 빌드(Build) 환경일 경우, 코드 압축
    .pipe $.if( build, $.csso(config.CSSO) )
    # 빌드(Build) 환경이 아닐 경우, 개발 폴더(예: dist)로 출력
    .pipe gulp.dest( $.if( !build, _sass.dest, _sass.build ) )
    # 명령창에 파일 크기 출력
    .pipe $.size(title: 'nodeSass(Scss) → CSS: ')
    # 웹 브라우저에 실시간 반영
    .pipe $.if(connecting, global.connect.reload())