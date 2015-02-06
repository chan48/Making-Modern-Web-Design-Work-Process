### fontawesome.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config  = require('../config')()
del     = require 'del'
gulp    = require 'gulp'
$       = require('gulp-load-plugins')(config.GLP_OPTION)

# _fa 지역 변수에 config.CSS.fontawesome 설정 객체 참조
_fa     = config.CSS.fontawesome
# _rename 지역 변수에 config.CSS.fontawesome.rename 설정 객체 참조
_rename = config.CSS.fontawesome.rename


# 업무: FontAwesome 이동
gulp.task 'fontawesome:move', ->
	gulp.src(_fa.src)
		.pipe gulp.dest(_fa.dest)

# ---------------------------------------------------------------

# 업무: font-awesome.scss 이름 변경
gulp.task 'fontawesome:rename-scss', ->
	gulp.src(_rename.file)
    # 파일 이름의 접두사로 '_'을 추가합니다.
		.pipe $.rename(prefix: '_')
		.pipe gulp.dest(_rename.dest)

# ---------------------------------------------------------------

# 업무: font-awesome.scss 파일 제거
# Sass → CSS 과정에서 변환되지 않도록 지웁니다.
gulp.task 'fontawesome:del-scss', del.bind(null, _rename.file)