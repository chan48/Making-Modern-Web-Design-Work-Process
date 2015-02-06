### images.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
gulp = require 'gulp'

# 업무: 이미지 svg2png, 최적화 = 종합
gulp.task 'images', ['images:svg2png'],->
  gulp.start 'images:opt'