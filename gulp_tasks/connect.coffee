### connect.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config = require('../config')()
gulp   = require 'gulp'
$      = require('gulp-load-plugins')(config.GLP_OPTION)

# 웹 서버 모듈 참조
global.connect = $.connect()

# 웹 서버
gulp.task 'connect', ['connect:on'], global.connect.server(config.SERVER)

# -----------------------------------------------------------------------

# 웹 서버 가동 체크 변수 on!
gulp.task 'connect:on', ->
	global.connecting = on