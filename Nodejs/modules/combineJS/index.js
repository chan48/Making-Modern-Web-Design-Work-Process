/*! combineJS module @ yamoo9.net, 2014 */
// File System 내장 모듈 및 minify 외부 모듈 호출(의존)
var fs     = require('fs')
		minify = require('minify');
/**
 * combineJS 모듈 정의 및 외부로 출력
 * 모듈 내부에 전달받을 인자(배열, 문자열) 설정
 * 압축 유무를 설정하는 min 옵션 추가 (기본 값: false)
 */
module.exports = function(jsSrc, exportJs, min) {
	// mergeCode: 코드 문자 병합을 위한 변수
	// len: 조건 확인을 위한 len 변수
	var mergeCode = '', len = jsSrc.length-1; 
	
	// min 초기 값 설정
	min = min || false;
	
	// 배열 jsSrc를 개별적으로 접근 조작하기 위해
	// forEach 배열 메소드 사용.
	jsSrc.forEach(function(file, index) {
		// min 조건이 참(true)이면 코드 실행
		if(min) {
			minify(file, function(err, data) {
				mergeCode += data;
				if(index==len){ writeFile(); }
			});	
		}
		// min 조건이 거짓(false)이면 코드 실행
		else {
			// fs.readFileSync() 사용하여 파일 내용 읽기
			mergeCode += fs.readFileSync(file);
			if(index==len){ writeFile(); }
		}
	});

	// 병합된 코드 mergeCode를 내용을 파일 생성
	function writeFile() {
		fs.writeFileSync(exportJs, mergeCode);
	}
}