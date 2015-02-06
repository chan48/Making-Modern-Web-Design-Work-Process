### gulpfile.coffee © yamoo9.net, 2015 ###
'use strict'

# require-dir 모듈 호출
requireDir = require 'require-dir'

# gulp/tasks 폴더(서브 폴더 포함)의 모든 업무(Tasks) 처리
requireDir('gulp_tasks', recurse: true)