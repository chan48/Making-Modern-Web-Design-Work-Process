'use strict';
/**
 * --------------------------------
 * Gulp 모듈 호출
 * --------------------------------
 */
var gulp = require('gulp');


/**
 * --------------------------------
 * Gulp 업무(Task) 등록
 * https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md
 * --------------------------------
 */

// 기본 업무
gulp.task('defaut', function() {
	console.log('Gulp 기본 업무(Task) 처리!');
});

// 사용자 정의 업무
gulp.task('custom', function() {
	console.log('Gulp 사용자 정의 업무(Task) 처리!');
});

/**
 * --------------------------------
 * Gulp 메소드
 * https://github.com/gulpjs/gulp/blob/master/docs/API.md
 * --------------------------------
 * gulp.task()
 * gulp.src()
 * gulp.dest()
 * gulp.watch()
 * gulp.start()
 * --------------------------------
 * 레시피(Recipes)
 * https://github.com/gulpjs/gulp/tree/master/docs/recipes
 * --------------------------------
 */