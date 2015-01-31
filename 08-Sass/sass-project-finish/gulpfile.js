'use strict';
/**
 * 모듈 호출
 * [del]                - 폴더(디렉토리)/파일 제거
 * [gulp-if]            - 조건 처리
 * [gulp-rename]        - 파일 이름 변경
 * [gulp-jade]          - Jade → HTML 변환
 * [gulp-sass]          - Sass → CSS 변환
 * [gulp-ruby-sass]     - Sass → CSS 변환(Ruby 기반)
 * [gulp-ruby-compass]  - Sass → CSS 변환(Ruby 기반)
 * [gulp-plumber]       - 오류 발생해도 watch 업무 지속
 * [gulp-watch]         - 변경된 파일만 처리
 * [gulp-html-prettify] - HTML 구조 읽기 쉽게 변경
 * [gulp-connect-multi] - 웹 서버
 */
var del      = require('del'),
	gulp     = require('gulp'),
	gulpif   = require('gulp-if'),
	rename   = require('gulp-rename'),
	jade     = require('gulp-jade'),
	sass     = require('gulp-sass'),
	compass  = require('gulp-compass'),
	plumber  = require('gulp-plumber'),
	watch    = require('gulp-watch'),
	prettify = require('gulp-html-prettify'),
	connect  = require('gulp-connect-multi')(),

	// 환경설정 ./config.js
	config   = require('./config')();

/**
 * Gulp 업무(Tasks) 정의
 */

// 기본
gulp.task('default', ['template', 'compass', 'connect', 'watch']);

// 관찰
gulp.task('watch', [], function(){
	// HTML 템플릿 업무 관찰
	watch([config.jade.src, config.jade.parts], function() {
		gulp.start('template');
	});
	// Sass 업무 관찰
	watch(config.sass.src, function() {
		gulp.start('compass');
	});
});

// 제거
gulp.task('clean', function(cb){
	del(config.del, cb);
});

// 웹 서버
gulp.task('connect', connect.server( config.sev ));

// HTML 템플릿(Jade)
gulp.task('template', function(){
	gulp.src(config.jade.src)
		.pipe( plumber() )
		.pipe( jade() )
		.pipe( prettify(config.htmlPrettify) )
		.pipe( gulp.dest(config.dev) )
		.pipe( connect.reload() );
});

// CSS 프리프로세싱(Sass)
// ----------------------------------------------------
// 'gulp-sass' 사용할 경우 코드
gulp.task('sass', function(){
	gulp.src(config.sass.src)
		.pipe( plumber() )
		.pipe( sass({
			// *.sass 파일을 오류없이 처리하기 위한 해결책
			sourceComments: 'normal'
		}) )
		.pipe( gulp.dest(config.sass.dest) )
		.pipe( connect.reload() );
});
// ----------------------------------------------------
// 'gulp-compass' 사용할 경우 코드
// 'compass' 업무 이름 대신, 'sass'로 사용하여 혼란함 방지.
gulp.task('compass', function() {
	gulp.src(config.sass.src)
	.pipe( plumber({
		errorHandler: function (error) {
			console.log(error.message);
			this.emit('end');
		}
	}) )
	.pipe(compass({
		css: config.sass.dest,
		sass: config.sass.compassSrc,
		style: 'expanded' // nested, expaned, compact, compressed
	}))
	.pipe( gulp.dest(config.sass.dest) );
});