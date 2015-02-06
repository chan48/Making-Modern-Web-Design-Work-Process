### customReporter.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 호출
config = require('../../config')()
$      = require('gulp-load-plugins')(config.GLP_OPTION)

# 모듈 정의
module.exports =
  # cssLint 사용자 정의 리포트 코드
  csslint : (file) ->
    $.util.log $.util.colors.red('오류 '+file.csslint.errorCount+'건 발견!: ') + $.util.colors.blue(file.path)

    file.csslint.results.forEach (result)->
      $.util.log $.util.colors.red('라인' + result.error.line) + ' ━  ' + $.util.colors.red(result.error.message)

  jslint : (file) ->
    # jshint 사용자 정의 리포트 코드