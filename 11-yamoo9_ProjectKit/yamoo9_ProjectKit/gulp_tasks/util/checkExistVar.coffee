### checkExistVar.coffee © yamoo9.net, 2015 ###
'use strict'

# 모듈 정의
module.exports = (_var)->
  # 전달인자 _var 값을 3항식으로 처리
  # return _var ? _var : false
	_var ? off