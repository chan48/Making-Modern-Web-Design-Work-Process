### config.coffee © yamoo9.net, 2015 ###
'use strict'
module.exports = ->

	# ------------------------------------------------------------------------
	# [프로젝트 경로 설정]
	# 사용자가 원하는 폴더 이름으로 변경할 수 있습니다.
	# ------------------------------------------------------------------------

	# 프로젝트 상위 폴더 경로(Path)
	source       = 'src/'              # 소스 폴더
	development  = 'dist/'             # 개발 폴더
	build        = 'build/'            # 배포 폴더
	bower_path   = "bower_components/" # Bower 컴포넌트 폴더
	temp         = '.tmp/'             # 임시 폴더
	cache        = '.sass-cache'      # Sass(Ruby) 캐시 폴더

	# 프로젝트 하위 폴더 경로(Path)
	www          = '__www__/'          # html, css, js 사용자를 위한 폴더
	css          = 'css/'              # CSS 폴더
	js           = 'js/'               # JS 폴더
	images			 = 'images/'           # 이미지 폴더
	svg			     = 'svg/'              # SVG 폴더
	svg_output   = 'output/'           # SVG 스프라이트 출력 폴더
	sprite			 = 'sprites/'          # 스프라이트 폴더

	# 컴파일 폴더 경로
	jade         = 'jade/'
	sass         = 'sass/'
	coffeeScript = 'coffee/'


	# ------------------------------------------------------------------------
	# [제거 모듈]
	# 프로젝트 작업시, 생성된 폴더 및 파일을 제거합니다.
	#
	# 제거 (del)
	# https://www.npmjs.com/package/del
	# ------------------------------------------------------------------------
	DEL = [
		temp
		cache
		build
		development
		# bower_path
		"#{source}#{www}{css,js}/**/*" # Bower 컴포넌트 생성 결과 제거
		"#{source}#{sass}{bourbon,breakpoint,fontawesome,susy}" # Bower 컴포넌트 생성 결과 제거
		"#{source}#{images}#{sprite}#{svg}#{svg_output}" # sprites-svg 결과 제거
		"#{source}#{images}#{svg}**/*.png" # svg2png 결과 제거
	]


	# ------------------------------------------------------------------------
	# [웹 서버 모듈]
	# 로컬호스트 서버 테스트 환경을 설정합니다.
	#
	# 웹 서버 (gulp-connect-multi)
	# https://www.npmjs.com/package/gulp-connect-multi
	# ------------------------------------------------------------------------
	SERVER =
		root       : [ development ]
		# 개발용으로 웹 브라우저 테스트를 할 포트넘버를 입력합니다.
		port       : 8080
		# port       : Math.ceil(Math.random() * 9999)
		# 실시간으로 변경 사항을 웹 브라우저에 반영하려면 on 값을 설정합니다. (반대는 off)
		livereload : on
		# 자동으로 열리는 브라우저를 설정하고자 할 경우, 아래 주석을 제거하고 브라우저 이름을 입력합니다.
		# open       : browser: 'chrome' # chrome(또는 Google Chrome), iexplore, ...


	# ------------------------------------------------------------------------
	# [Gulp 플러그인 로더 모듈]
	# Gulp 플러그인 호출을 손쉽게 처리하도록 도와주는 플러그인 로더 설정입니다.
	#
	# Gulp 플러그인 로더 (gulp-load-plugins)
	# https://www.npmjs.com/package/gulp-load-plugins
	# ------------------------------------------------------------------------
	GLP_OPTION =
		# gulp- 또는 gulp. 으로 시작하는 Gulp 플러그인을 감지합니다.
		pattern: [
			'gulp-*'
			'gulp.*'
		]
		# gulp- 또는 gulp. 을 제외한 플러그인 이름을 사용합니다.
		replaceString: /\bgulp[\-.]/
		# Gulp 플러그인 이름이 복잡할 경우, 이름을 간단하게 수정 설정할 수 있습니다.
		rename:
			'gulp-connect-multi' : 'connect'
			'gulp-html-prettify' : 'prettify'
			# 'gulp-ruby-sass'     : 'rsass'


	# ------------------------------------------------------------------------
	# [HTML 포멧 정렬 모듈]
	# HTML 문서를 보기 좋게 정렬해줍니다.
	#
	# HTML 포멧 (gulp-html-prettify)
	# https://www.npmjs.com/package/gulp-html-prettify
	# ------------------------------------------------------------------------
	HTML_PRETTIFY =
		# 들여쓰기에 사용할 문자를 입력합니다.
		'indent_char': ' '
		# 들여쓰기 크기를 설정합니다. (예: space 2칸)
		'indent_size': 2


	# ------------------------------------------------------------------------
	# [HTML 압축 모듈]
	# HTML 문서를 최적화(압축)합니다.
	#
	# HTML 압축 (gulp-htmlmin)
	# https://www.npmjs.com/package/gulp-htmlmin
	# ------------------------------------------------------------------------
	HTML_MIN =
		# 빈 공간을 제거합니다.
		'collapseWhitespace': true


	# ------------------------------------------------------------------------
	# [CSS3 브라우저 벤더 프리픽스 자동 적용 모듈]
	# CSS3 브라우저 벤더 프리픽스를 설정에 따라 자동으로 적용 처리합니다.
	#
	# CSS3 브라우저 벤더 프리픽스 (gulp-autoprefixer)
	# https://www.npmjs.com/package/gulp-autoprefixer
	# ------------------------------------------------------------------------
	AUTOPREFIXER = [
		'ie >= 9'
		'ie_mob >= 10'
		'ff >= 30'
		'chrome >= 34'
		'safari >= 7'
		'opera >= 23'
		'ios >= 7'
		'android >= 4.4'
		'bb >= 10'
	]


	# ------------------------------------------------------------------------
	# [CSS 압축 모듈]
	# CSS3 브라우저 벤더 프리픽스를 설정에 따라 자동으로 처리합니다.
	#
	# CSS 압축 (gulp-csso)
	# http://bem.info/tools/optimizers/csso/description/
	# ------------------------------------------------------------------------
	CSSO = {}


	# ------------------------------------------------------------------------
	# [개발용 소스맵 모듈]
	# 개발 시, Debug 용으로 사용할 소스맵을 생성합니다.
	#
	# 소스맵 (gulp-sourcemaps)
	# https://www.npmjs.com/package/gulp-sourcemaps
	# ------------------------------------------------------------------------
	MAPS =
		path: '../maps'
		option:
			addComment: false


	# ------------------------------------------------------------------------
	# [Bower 컴포넌트 사용자 정의 설정]
	# Bower 컴포넌트를 사용자가 설정한대로 필요한 파일만 필터링하여 원하는 곳에 복사합니다.
	# 새로운 Bower 컴포넌트를 추가할 경우, 직접 아래에 경로를 수정해야 합니다.
	# ------------------------------------------------------------------------
	BOWER =
		src  : "#{bower_path}**/*"
		dest :
			sass : "#{source}#{sass}"
			js   :"#{source}#{www}#{js}"
		# JS 라이브러리 파일 통합
		jsMergeFileName: 'bower-libs.min.js'
		# 컴포넌트 정리
		components:
			# Bourbon
			bourbon:
				src: "#{bower_path}bourbon/app/assets/stylesheets/**"
				dest: "#{source}#{sass}bourbon"
			# Susy
			susy:
				src: "#{bower_path}susy/sass/**"
				dest: "#{source}#{sass}susy"
			# Breakpoint
			breakpoint:
				src: "#{bower_path}breakpoint-sass/stylesheets/**"
				dest: "#{source}#{sass}breakpoint"
			# FontAwesome
			fontawesome:
				src: [
						"#{bower_path}fontawesome/{css,fonts}/*"
						"#{bower_path}fontawesome/scss/*"
					]
				dest: [
						"#{source}#{www}#{css}fontawesome"
						"#{source}#{sass}fontawesome"
					]


	# ------------------------------------------------------------------------
	# [JADE, SASS, COFFEE 모듈 설정]
	# 프로젝트에 사용되는 jade, sass, coffee 모듈을 개별 설정합니다.
	# ------------------------------------------------------------------------

	# HTML 템플릿 엔진: Jade (gulp-jade)
	# # https://www.npmjs.com/package/gulp-jade
	jade =
		src    : "#{source}#{jade}**/!(_)*.jade"
		parts  : "#{source}#{jade}**/_*.jade"
		build  : build
		option :
			pretty: !true

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	# CSS 프리프로세서: Sass (gulp-sass, gulp-ruby-sass)
	# https://www.npmjs.com/package/gulp-sass
	nodeSass =
		type        : 'node'
		src         : "#{source}#{sass}/**/*.{scss,sass}"
		dest        : "#{development}#{css}"
		build       : "#{build}#{css}"
		option      : # 개발 옵션
			# style          : 'nested'
			sourceComments : 'normal'
		buildOption : # 빌드 옵션
			style          : 'compressed'
			sourceComments : 'normal'
	# https://www.npmjs.com/package/gulp-ruby-sass
	rubySass =
		type        : 'ruby'
		src         : "#{source}#{sass}"
		dest        : "#{development}#{css}"
		build       : "#{build}#{css}"
		option      : # 개발 옵션
			style           : 'expanded'
			lineNumbers     : !true
			sourcemap       : true
			compass         : false
			require         : false
			defaultEncoding : 'utf-8'
			noCache         : false
			cacheLocation   : cache
			loadPath        : [bower_path, "#{source}#{sass}"]
			precision       : 2
		buildOption : # 빌드 옵션
			style           : 'compressed'
			sourcemap       : false
			defaultEncoding : 'utf-8'

	# 사용하고자 하는 Sass 엔진 초기 값 설정 (rubySass, nodeSass)
	# 명령 창에서 변경하고자 할 경우에는 sass=ruby 또는 sass=node 입력 후, gulp 업무 실행
	SASSENGINE = do ->
		switch process.env.sass
			when 'ruby' then rubySass
			when 'node' then nodeSass
			else rubySass # Sass 엔진 초기 설정을 바꾸려면 이 값을 변경합니다.

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	# JS 컴파일러: CoffeeScript (gulp-coffee)
	# https://www.npmjs.com/package/gulp-coffee
	coffee =
		src    : "#{source}#{coffeeScript}**/*.coffee"
		dest   : "#{development}#{js}"
		option :
			bare: !true
		build  : "#{build}#{js}"
		mergeFileName: 'scripts.js'


	# ------------------------------------------------------------------------
	# [IMAGES & SVG2PNG 모듈 설정]
	# 이미지 최적화 및 svg2png 설정입니다.
	# ------------------------------------------------------------------------
	# Images 최적화: (gulp-imagemin)
	# https://www.npmjs.com/package/imagemin
	IMAGES =
		src    : [
			"#{source}#{images}**/*.{gif,jpg,jpeg,png,svg}"
			"!#{source}#{images}#{sprite}"
			"!#{source}#{images}#{sprite}**/*"
		]
		dest   : "#{development}#{images}"
		build  : "#{build}#{images}"
		option :
			gif: true
			jpg: true
			png: 3 # 0 ~ 7
			svg: [
				# SVG 파일의 뷰박스(Viewbox) 속성 제거 유무 설정
				{ removeViewBox: false }
				# SVG 파일의 사용되지 않는 테두리(Strokes), 면(Fills) 색상 제거 유무 설정
				{ removeUselessStrokeAndFill: false }
				# SVG 파일의 빈 속성 제거 유무 설정
				{ removeEmptyAttrs: false }
			]
			# 플러그인(Plugins): pngquant
			# https://www.npmjs.com/browse/keyword/imageminplugin
			# https://www.npmjs.com/package/imagemin-pngquant#options
			pngquant:
				quality: '65-80',
				speed: 4

		# SVG → PNG 설정: (gulp-svg2png)
		# https://www.npmjs.com/package/gulp-svg2png
		svg2png:
			src: "#{source}#{images}#{svg}**/*.svg"
			dest: "#{source}#{images}#{svg}"
			# build: "#{build}#{images}#{svg}"


	# ------------------------------------------------------------------------
	# [SPRITES 모듈 설정]
	# 스프라이트 이미지/CSS 스타일 자동 생성 설정입니다.
	# ------------------------------------------------------------------------
	# Sprite 이미지/스타일 파일 자동 생성: (gulp.spritesmith)
	# https://github.com/twolfson/gulp.spritesmith
	SPRITE =
		src     : [
			"#{source}#{images}#{sprite}**/*.png"
			"!#{source}#{images}#{sprite}#{svg}**/*"
		]
		dest    :
			img: "#{development}#{images}#{sprite}"
			css: "#{development}#{css}#{sprite}"
		build   :
			img: "#{build}#{images}#{sprite}"
			css: "#{build}#{css}#{sprite}"
		options :
			imgName     : 'sprites.png'
			imgPath     : "../#{images}#{sprite}sprites.png" # 이미지 경로
			cssName     : 'sprites.css' # sass, scss 확장자 변경 가능
			cssTemplate : 'sprites-template.mustache' # https://github.com/twolfson/gulp.spritesmith#mustache-template
			padding     : 0
			algorithm   : 'binary-tree' # 참고: https://github.com/twolfson/gulp.spritesmith#algorithms
			# engine: 'pixelsmith'

		# SVG 스프라이트 이미지 생성 설정
		# https://www.npmjs.com/package/gulp-svg-sprites
		SVG     :
			src    : "#{source}#{images}#{sprite}#{svg}/**/*.svg"
			dest   : "#{source}#{images}#{sprite}#{svg}#{svg_output}"
			# 이동 옵션
			move:
				src: "#{source}#{images}#{sprite}#{svg}#{svg_output}/**/*"
				dest: "#{development}"
				build: "#{build}"
			# 옵션
			# windows 환경: gulp-svg-sprite 모듈
			option:
				shape:
					dimension:
						maxWidth: 32 # 3000
						maxHeight: 32 # 3000
					spacing:
						padding: 10 # 0

				 # 참고: https://github.com/jkphl/svg-sprite#d-output-mode-configuration
				mode:
					# css, view, defs, symbol, stack
					css:     # «css» 모드 활성화
						sprite: 'svg/sprite.css.svg' # svg 출력 파일 이름 
						prefix: 'svg-%s' # 접두사 설정(선택자)
						layout: 'packed' # 레이아웃 설정: 'vertical', 'horizontal', 'diagonal'
						bust: true
						render:
							css: true  # CSS 출력
							scss: true # SCSS 출력
						example: true
				
				# MacOS 환경: gulp-svg-sprites 모듈
				# option :
				# 	mode      : "sprite" # sprite, defs, symbols
				# 	common    : "icon" # class 속성 이름
				# 	selector  : "%f" # 파일 이름
				# 	layout    : "vertical" # vertical, horizontal, diagonal
				# 	padding   : 0 # 간격 설정
				# 	# CSS 출력 설정
				# 	cssFile   : "css/sprites/svg-sprite.css"
				# 	# svg 출력 설정
				# 	svg:
				# 		sprite  : "images/sprites/svg-sprite.svg"
				# 		defs    : "images/sprites/svg-defs.svg"
				# 		symbols : "images/sprites/svg-symbols.svg"


	# ------------------------------------------------------------------------
	# [HTML, CSS, JS 모듈 설정]
	# html, css, js 파일 설정입니다.
	# ------------------------------------------------------------------------

	# HTML 설정
	HTML =
		src: "#{source}#{www}**/*.html"
		dest: "#{development}"
		build: "#{build}"
		options: # http://validator.github.io/validator/#options
			'errors-only' : off
			'format'      : 'gnu'
			'html'        : off
			'no-stream'   : off
			'verbose'     : off

	# CSS 설정
	CSS =
		src           : [
			"#{source}#{www}#{css}**/*.css"
			"!#{source}#{www}#{css}fontawesome"
			"!#{source}#{www}#{css}fontawesome/**/*"
		]
		dest          : ["#{development}#{css}", "#{development}#{css}**/*.css"]
		build         : "#{build}#{css}"
		mergeFileName : "all.min.css"

		# FontAwesome 이동 설정
		fontawesome:
			src  : "#{source}#{www}#{css}fontawesome/**/*"
			dest : "#{development}#{css}fontawesome"
			rename: 
				file: "#{source}#{sass}fontawesome/font-awesome.scss"
				dest: "#{source}#{sass}fontawesome"

	# JS 설정
	JS =
		src           : "#{source}#{www}#{js}**/*.js"
		dest          : [
			"#{development}#{js}"
			[
				# 배열 아이템 추가 순서대로 병합됩니다.
				"#{development}#{js}**/*.js"
				"!#{development}#{js}all.min.js"
				"!#{development}#{js}bower-libs.min.js"
				"!#{development}#{js}scripts.min.js"
				"!#{development}#{js}scripts.js"
			]
		]
		build         : "#{build}#{js}"
		mergeFileName : "all.min.js"


	# ======================================================================

	# 환경설정(Configuration) 객체 반환
	_config =

		# 프로젝트 폴더 경로
		src           : source
		dev           : development
		build         : build
		cache         : cache
		bower_path    : bower_path

		# 설정
		DEL           : DEL
		SERVER        : SERVER
		GLP_OPTION    : GLP_OPTION
		HTML_PRETTIFY : HTML_PRETTIFY
		HTML_MIN      : HTML_MIN
		AUTOPREFIXER  : AUTOPREFIXER
		CSSO          : CSSO
		MAPS          : MAPS
		bower         : BOWER

		# jade, sass, coffee 설정 객체
		jade          : jade
		sass          : SASSENGINE
		coffee        : coffee

		# images, sprite, css, js 설정 객체
		images        : IMAGES
		sprite        : SPRITE
		HTML          : HTML
		CSS           : CSS
		JS            : JS