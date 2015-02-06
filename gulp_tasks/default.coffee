### default.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
gulp        = require 'gulp'
runSequence = require 'run-sequence'

# 업무: 초기 설정(Prepare Setting)
# 주의! settings를 먼저 수행해야 합니다.
gulp.task 'settings', ['clean', 'bower', 'images', 'sprites']

# ------------------------------------------------------------------------------------------------

# 업무: 기본(default)
gulp.task 'default', ['jade', 'sass', 'coffee', 'js', 'connect', 'watch']

# ------------------------------------------------------------------------------------------------

# 업무: HTML, CSS, JS로 작업(www)
gulp.task 'www', ['html', 'css', 'js', 'fontawesome:move', 'connect', 'watch:www']