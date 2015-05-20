'use strict';

/**
 * --------------------------------
 * Modules
 * --------------------------------
 */
var gulp       = require('gulp'),
	includer   = require('gulp-html-ssi'),
	sass       = require('gulp-ruby-sass'),
	sourcemaps = require('gulp-sourcemaps');

/**
 * --------------------------------
 * Tasks
 * --------------------------------
 */

// Default
gulp.task('default', ['htmlSSI', 'sass', 'watch']);

// Watch
gulp.task('watch', function() {
	gulp.watch(['./html/**/*.html'], function(event) {
		gulp.start('htmlSSI');
	});
	gulp.watch(['./sass/**/*'], function(event) {
		gulp.start('sass');
	});
});

// htmlSSI
gulp.task('htmlSSI', function() {
	gulp.src('./html/**/*.html')
		.pipe(includer())
		.pipe(gulp.dest('./build/'));
});

// Ruby Sass & Sourcemap
gulp.task('sass', function () {
	return sass('sass/', {
		defaultEncoding : 'utf-8',
		compass         : true,
		sourcemap       : true
	})
	.on('error', function (err) {
		console.error('Error!', err.message);
	})
	.pipe(sourcemaps.write())
	.pipe(gulp.dest('./build/css/'));
});