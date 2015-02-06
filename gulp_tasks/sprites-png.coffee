### sprites-png.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config        = require('../config')()
checkExistVar = require('./util/checkExistVar')
gulp          = require 'gulp'
pngquant      = require 'imagemin-pngquant' # gulp-imagemin 플러그인
$             = require('gulp-load-plugins')(config.GLP_OPTION)

# _images 지역 변수에 config.images 설정 객체 참조
_images       = config.images
# _sprite 지역 변수에 config.sprite 설정 객체 참조
_sprite       = config.sprite


# 업무: 스프라이트 이미지/스타일 문서 자동 생성
gulp.task 'sprites:png', ->

	# global.build 값 설정이 없을 경우 off로 초기화
	build      = checkExistVar(global.build)
	# global.connecting 값 설정이 없을 경우 off로 초기화
	connecting = checkExistVar(global.connecting)

	# 스프라이트 데이터
	spriteData = gulp.src(_sprite.src)
		# 변경된 파일만 처리
		.pipe $.changed( $.if(!build, config.dev, config.build) )
		# 스프라이트 이미지 생성
		.pipe $.spritesmith(_sprite.options)

	# 스프라이트 데이터 → img
	spriteData.img
		# 빌드 환경에서는 이미지 압축
		.pipe $.if( build, $.imagemin(
			optimizationLevel: _images.png
			use: [ pngquant(_images.pngquant) ]))
		# 개발/빌드 환경에 따라 목적지 변경
		.pipe gulp.dest( $.if(!build, _sprite.dest.img, _sprite.build.img))
		# 명령창에 파일 크기 출력
		.pipe $.size(title: '스프라이트 이미지 파일 생성 결과: ')
		# 웹 브라우저에 실시간 반영
		.pipe $.if(connecting, global.connect.reload())

	# 스프라이트 데이터 → css
	spriteData.css
		# 빌드 환경에서는 CSS 파일 압축
		.pipe $.if( build, $.csso(config.CSSO) )
		# 개발/빌드 환경에 따라 목적지 변경
		.pipe gulp.dest( $.if(!build, _sprite.dest.css, _sprite.build.css))
		# 명령창에 파일 크기 출력
		.pipe $.size(title: '스프라이트 CSS 파일 생성 결과: ')
		# 웹 브라우저에 실시간 반영
		.pipe $.if(connecting, global.connect.reload())

	return