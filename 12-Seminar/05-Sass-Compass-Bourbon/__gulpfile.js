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
 * CONFIGURATIONS
 * --------------------------------
 */
var config = {
	jade: {
		src: './src/jade/**/*.jade',
		dist: './dist/'
	}
};

/**
 * --------------------------------
 * TASKS
 * --------------------------------
 */
gulp.task('default', ['jade']);

gulp.task('watch', function(){
	gulp.watch([config.jade.src], ['jade']);
});

gulp.task('jade', function(){
	gulp.src(config.jade.src)
		.pipe(jade({
			pretty: true
		}))
		.pipe(gulp.dest(cofig.jade.dist));
});