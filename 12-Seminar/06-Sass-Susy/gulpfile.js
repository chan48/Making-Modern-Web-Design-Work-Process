'use strict';

/**
 * --------------------------------
 * MODULES
 * --------------------------------
 */
var gulp      = require('gulp'),
	jade      = require('gulp-jade'),
	sass      = require('gulp-ruby-sass'),
	sourcemap = require('gulp-sourcemaps');


/**
 * --------------------------------
 * TASKS
 * --------------------------------
 */
gulp.task('default', ['jade', 'sass', 'watch']);

gulp.task('watch', function(){
	gulp.watch(['src/jade/**/*.jade'], ['jade']);
	gulp.watch(['src/sass/**/*.(sass,scss)'], ['sass']);
});

gulp.task('jade', function(){
	gulp.src('src/jade/**/*.jade')
		.pipe(jade())
		.on('error', errorLog)
		.pipe(gulp.dest('dist/'));
});

gulp.task('sass', function(){
	return sass('src/sass/**/*.(sass,scss)', {
		defaultEncoding : 'UTF-8',
		lineNumbers     : false,
		noCache         : true,
		sourcemap       : true,
		style           : 'expanded',
		// require         : ['susy'],
		// compass         : true,
	})
	.on('error', errorLog)
	.pipe(sourcemaps.write('maps', {
		// includeContent: false,
		// sourceRoot: 'source/'
    }))
	.pipe(gulp.dest('dist/css/'));
});

/**
 * --------------------------------
 * HELPERS
 * --------------------------------
 */
function errorLog(error) {
	console.error.bind(error);
	this.emit('end');
}