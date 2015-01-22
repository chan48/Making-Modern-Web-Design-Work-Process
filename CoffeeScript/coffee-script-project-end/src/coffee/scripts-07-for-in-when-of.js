### CoffeeScript 반복문 - for, in, when ###

# 문서에서 #nav a 선택자에 해당되는 요소 수집
nav_links = document.querySelecterAll '#gnb a'

# nav_links에 참조된 HTML 콜렉션을 반복 순회하여
# 클릭 이벤트 처리
for link, i in nav_links
	link.onclick = (evt)->
		# 브라우저 기본 동작 차단
		evt.preventDefault()
		href = @.getAttribute 'href'
		console.log href
		return

# Javascript 클로저: do ()-> ()->
for link, i in nav_links
	link.onclick = do (i)-> (evt)->
			# 브라우저 기본 동작 차단
			evt.preventDefault()
			href = @.getAttribute 'href'
			console.log href, i
			return

homeAppliances = [
	'냉장고'
	'에어컨'
	'비디오'
	'세탁기'
	'TV'
]

for appliance, i in homeAppliances
	purchaseProduct(i+1, appliance)

for item in homeAppliances by 2
	repairProduct(item)

### CoffeeScript 반복문 - for, of, own ###
# for~in문
for own key, value of document.body.style
	console.log key, value