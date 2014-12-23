// Modules 호출
var gulp      = require('gulp'),
		csslint   = require('gulp-csslint'),
		concatcss = require('gulp-concat-css'),
		uglifycss = require('gulp-uglifycss'),
		jshint    = require('gulp-jshint'),
		uglify    = require('gulp-uglify'),
		concat    = require('gulp-concat'),
		rename    = require('gulp-rename'),
		gulpif    = require('gulp-if'),
		del       = require('del'),
		config    = require('./config.json');

/**
 * 환경설정
 */
// 검사, 병합, 압축 설정
// var config = {
// 		lint   : true,
// 		concat : true,
// 		uglify : true,
// 		rename : false
// };
// // 파일 경로(Path) 설정
// var path = {
// 	css: {
// 		src      : ['src/css/**/*.css', '!src/css/style.css'],
// 		dest     : 'dist/css/',
// 		filename : 'style.css'
// 	},
// 	js: {
// 		src      : 'src/js/libs/**/*.js',
// 		dest     : 'dist/js/',
// 		filename : 'DOMlibrary.js'
// 	}
// };

/**
 * 기본(Default) & 관찰(Watch) 업무 정의
 * clean > styles > scripts 순으로 업무 실행
 */
// gulp.task('default', function() {
// 	// 콘솔(Console)에 메시지 기록(Log)
// 	console.log('gulp default 일이 수행되었습니다.');
// });
gulp.task('default', ['clean', 'styles', 'scripts']);

// 지속적 관찰(Watch) 업무 정의
gulp.task('watch', ['clean'], function() {
	gulp.watch(config.path.css.src, ['styles']);
	gulp.watch(config.path.js.src, ['scripts']);
});

/**
 * 폴더/파일 제거
 * NPM 설치 모듈: del
 */
gulp.task('clean', function() {
	del(['dist/css/*', 'dist/js/*']);
});

/**
 * CSS 업무
 * NPM 설치 모듈: gulp-csslint, gulp-concat-css, gulp-uglifycss
 * 문법 검사 > 병합 > 압축
 */
gulp.task('styles', function() {
	gulp.src( config.path.css.src )
		// 문법검사
		.pipe( gulpif(config.lint, csslint(config.cssLintRules)) )
		.pipe( gulpif(config.lint, csslint.reporter()) )
		// 파일 병합
		.pipe( gulpif(config.concat, concatcss( config.path.css.filename )) ) 
		// 압축하지 않은 파일 출력
		.pipe( gulpif(config.rename, gulp.dest( config.path.css.dest )) )
		// 압축
		.pipe( gulpif(config.uglify, uglifycss()) )
		// 압축한 파일 이름 바꿔 출력
		.pipe( gulpif(config.rename, rename({suffix: '.min'})) )
		.pipe(gulp.dest( config.path.css.dest ));
});

/**
 * Javascript 업무
 * NPM 설치 모듈: gulp-jslint, gulp-concat, gulp-uglify
 * 문법 검사 > 병합 > 압축
 */
gulp.task('scripts', function() {
	gulp.src( config.path.js.src )
		// 문법검사
		.pipe( gulpif(config.lint, jshint()) )
		.pipe( gulpif(config.lint, jshint.reporter('jshint-stylish')) )
		// 파일 병합
		.pipe( gulpif(config.concat, concat( config.path.js.filename )) )
		// 압축하지 않은 파일 출력
		.pipe( gulpif(config.rename, gulp.dest( config.path.js.dest )) )
		// 압축
		.pipe( gulpif(config.uglify, uglify(config.jsUglifyOptions)) )
		// 압축한 파일 이름 바꿔 출력
		.pipe(gulpif(config.rename, rename({suffix: '.min'})) )
		.pipe(gulp.dest( config.path.js.dest ));
});

// gulp.task('scripts', ['js:hint', 'js:concat', 'js:uglify']);

// JS문법 검사
// gulp.task('js:hint', function() {
// 	gulp.src( path.js.src )
// 		.pipe(jshint())
// 		.pipe(jshint.reporter('jshint-stylish'));
// });
// JS 병합
// gulp.task('js:concat', function() {
// 	gulp.src( path.js.src )
// 		.pipe(concat( path.js.filename ))
// 		.pipe(gulp.dest( path.js.dest ));
// });
// JS 압축
// gulp.task('js:uglify', function() {
// 	setTimeout(function () { // 0.2초 뒤에 실행
// 		gulp.src( path.js.dest + path.js.filename )
// 			.pipe(uglify())
// 			.pipe(rename({suffix: '.min'}))
// 			.pipe(gulp.dest( path.js.dest ));
// 	}, 200);
// });

// gulp.task('scripts', function() {
// 	gulp
// 		// .src(['./src/domhelper-id.js', './src/domhelper-tag.js'])
// 		// .src('./src/*.js')
// 		// .src(['./src/domhelper-prevEl.js', './src/*.js'])
// 		.src('src/js/libs/**/*.js')
// 		.pipe(jshint())
// 		.pipe(jshint.reporter('jshint-stylish'))
// 		.pipe(concat('DOMlibrary.js'))
// 		.pipe(gulp.dest('./dist'))
// 		.pipe(uglify({
// 			mangle: false,
// 			// preserveComments: 'some' // 'all', 'some'
// 		}))
// 		.pipe(rename('DOMlibrary.min.js'))
// 		.pipe(gulp.dest('./dist'));
// });
