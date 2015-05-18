'use strict';

/**
 * --------------------------------
 * MODULES
 * --------------------------------
 */
var gulp = require('gulp'),
	jade = require('gulp-jade');


/**
 * --------------------------------
 * TASKS
 * --------------------------------
 */
gulp.task('default', ['jade']);

gulp.task('watch', function(){
	gulp.watch(['src/jade/**/*.jade'], ['jade']);
});

gulp.task('jade', function(){
	gulp.src('src/jade/**/*.jade')
		.pipe(jade())
		.pipe(gulp.dest('dist/'));
});