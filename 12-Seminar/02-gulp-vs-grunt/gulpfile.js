/**
 * --------------------------------
 * Gulp 코드 패턴
 * --------------------------------
 */

// Sass → CSS 변경 업무
gulp.task('sass', function () {
	gulp.src('app/styles/**/*.scss')
		.pipe(sass())
		.pipe(autoprefixer('last 1 version'))
		.pipe(gulp.dest('dist/styles'));
});

// Sass 변경 관찰 업무
gulp.task('watch', function() {
	gulp.watch('app/styles/**/*.scss', ['sass']);
});

// 기본 업무에 등록 'sass', 'watch' 업무 등록
gulp.task('default', ['sass', 'watch']);