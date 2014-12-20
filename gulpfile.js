// Modules 호출
var gulp   = require('gulp'),
		concat = require('gulp-concat');

// Javascript 파일들을 병합
gulp.task('combine:js', function() {
	gulp
		// .src(['./src/domhelper-id.js', './src/domhelper-tag.js'])
		// .src('./src/*.js')
		// .src(['./src/domhelper-prevEl.js', './src/*.js'])
		.src('src/js/libs/**/*.js')
		.pipe(concat('DOMlibrary.js'))
		.pipe(gulp.dest('./dist'));
});

// Gulp.task()를 사용해 기본(Default) 테스크 정의
gulp.task('default', function() {
	// 콘솔(Console)에 메시지 기록(Log)
	console.log('gulp default 일이 수행되었습니다.');
});