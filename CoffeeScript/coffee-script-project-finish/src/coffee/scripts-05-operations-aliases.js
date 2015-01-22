### CoffeeScript 연산자(Operators)와 별칭(Aliases) ###

book =
	author: '야무'
	publisher: '한빛미디어'
	publishing: no # off, false

book.autor is '야무'
book.publisher isnt '한빛미디어'

if book.publishing is not yes # on, true
	book.publishing = yes

if book.autor is '야무' or book.publisher is '한빛미디어'
	book.publishing = yes

heartToHeart = ->
	if @ is window then console.log '전역 함수'
	else if @ isnt window then console.log '객체의 메소드'

if 'author' of book
	console.log '이 책의 저자는 존재합니다.'

book.publishing = yes if book.ahthor in ['야무', '지훈']


unless 'publishingBook' of book
	book.publishingBook = ->
		book.publishing = on
		return

book.publishingBook ?= ->
	book.publishing = on
	return



if book.title? or not book.description
	book.title = '만들면서 배우는 모던 웹사이트 제작'
	book.description = '모던 웹 워크플로우 - 변화의 시작을 이끌다!'

tag = (tag, parent)->
	parent = parent ? document
	parent.getElementsByTagName tag


if mackbook? then mackbook = '맥북'