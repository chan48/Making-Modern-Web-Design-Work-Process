### CoffeeScript 문자 보간법(String Interpolation) & 쌍따옴표 문자열(Block Strings) ###

sendMail = (to)->
	'메일을 ' + to + '에게 보냈습니다.'


sendMail = (to)->
	"메일을 #{to}에게 보냈습니다."

iWish = '2015년 출간 예정인
이 도서가 여러분의 업무 흐름에
큰 변화는 아닐지라도, 변화의
시작이 되었으면 바랍니다.'

blockString = """
<p class="block-string">" 기호를 연이어 3번 붙여 
	HTML 코드 포멧을 묶어 주면 코드를 정렬하고,
	속성의 쌍 따옴표 등을 문자로 인식시켜줍니다.</p>
"""