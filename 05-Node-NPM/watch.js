var fs = require('fs');

fs.watch('files', function(evt, filename) {
	console.log('이벤트: ' + evt);
	console.log('파일 이름: ' + filename);
});