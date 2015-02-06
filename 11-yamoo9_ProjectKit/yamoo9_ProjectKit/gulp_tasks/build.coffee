### build.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config = require('../config')()
gulp   = require 'gulp'

# 업무: 배포(Build, Production)
gulp.task 'build', [
  # settings 업무는 개별적으로 실행한 후,
  # build를 수행해야 오류를 방지할 수 있습니다.
  # 'settings'
  'build:on'
  'jade'
  'sass'
  'coffee'
  'images'
  'sprites'
  'clean:cache'
]

# 업무: www 배포(Build, Production)
gulp.task 'build:www', [
  # 'settings'
  'build:on'
  'images'
  'sprites'
  'html'
  'css'
  'js'
  'clean:develop'
]

# ---------------------------------------
# 업무: 세부 빌드
gulp.task 'build:jade', [
  'build:on'
  'jade'
]

gulp.task 'build:sass', [
  'build:on'
  'sass'
  'clean:cache'
]

gulp.task 'build:coffee', [
  'build:on'
  'coffee'
]

gulp.task 'build:images', [
  'build:on'
  'images'
]

gulp.task 'build:sprites', [
  'build:on'
  'sprites'
]

gulp.task 'build:html', [
  'build:on'
  'html'
]

gulp.task 'build:css', [
  'build:on'
  'css'
  'clean:develop'
]

gulp.task 'build:js', [
  'build:on'
  'js'
]