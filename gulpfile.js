// Modules 호출
var gulp     = require('gulp'),
		jshint	 = require('gulp-jshint'),
		uglify	 = require('gulp-uglify'),
		concat   = require('gulp-concat'),
		rename   = require('gulp-rename');

/**
 * Javascript 파일 문법 검사 > 병합 > 압축
 */
gulp.task('scripts', function() {
	gulp
		// .src(['./src/domhelper-id.js', './src/domhelper-tag.js'])
		// .src('./src/*.js')
		// .src(['./src/domhelper-prevEl.js', './src/*.js'])
		.src('src/js/libs/**/*.js')
		.pipe(jshint())
		.pipe(jshint.reporter('jshint-stylish'))
		.pipe(concat('DOMlibrary.js'))
		.pipe(gulp.dest('./dist'))
		.pipe(uglify({
			// mangle: false,
			// preserveComments: 'some' // 'all', 'some'
		}))
		.pipe(rename('DOMlibrary.min.js'))
		.pipe(gulp.dest('./dist'));
});

/**
 * Gulp.task()를 사용해 기본(Default) 테스크 정의
 */
gulp.task('default', function() {
	// 콘솔(Console)에 메시지 기록(Log)
	console.log('gulp default 일이 수행되었습니다.');
});