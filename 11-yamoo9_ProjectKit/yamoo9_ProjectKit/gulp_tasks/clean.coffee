### clean.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config = require('../config')()
gulp   = require 'gulp'
del    = require 'del'


# 업무: 리셋
gulp.task 'clean:reset', ['clean:all'], del.bind(null, 'node_modules')

# ------------------------------------------------------

# 업무: 모두 제거
gulp.task 'clean:all', ['clean', 'clean:bower']

# ------------------------------------------------------

# 업무: 제거
gulp.task 'clean', del.bind(null, config.DEL)

# ------------------------------------------------------

# 업무: 캐시 제거
gulp.task 'clean:bower', del.bind(null, config.bower_path)

# ------------------------------------------------------

# 업무: 캐시 제거
gulp.task 'clean:cache', del.bind(null, config.cache)

# ------------------------------------------------------

# 업무: 개발 폴더 제거
gulp.task 'clean:develop', ->
	setTimeout (->
		del(config.dev)
		return
	), 400
	return