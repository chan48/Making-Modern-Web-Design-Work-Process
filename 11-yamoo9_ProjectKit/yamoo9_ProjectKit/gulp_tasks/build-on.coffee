### build-on.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
gulp = require 'gulp'

# 업무: build on 설정
gulp.task 'build:on', ->
    global.build = on