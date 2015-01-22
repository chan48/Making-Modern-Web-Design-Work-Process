# 객체 정의
yamoo9 = name: '지훈', job: '강사'
# switch 조건문
switch person.job
	when '디자이너' then designer(person.name)
	when '개발자' then developer(person.name)
	when '강사', '선생님'
		if person.job is '선생님'
			person.name += ' 쌤~'
		instructor(person.name)
	else 
		console.log "#{person.name}의 직업은 
		디자이너도, 개발자도, 
		강사 또는 선생님이 아닙니다."