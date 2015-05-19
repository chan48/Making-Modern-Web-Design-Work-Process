### Sass 언어 & Compass 프레임워크
- [Sass](http://sass-lang.com)
- [Compass](http://compass-style.org)

---

### Sass 모듈(Gulp)
- [gulp-sass 모듈](https://www.npmjs.com/package/gulp-sass)
- [gulp-ruby-jade 모듈](https://www.npmjs.com/package/gulp-ruby-sass)

#### Node Sass vs Ruby Sass
[Sass 플랫폼 별, 호환성 체크](http://sass-compatibility.github.io/)

### Compass 모듈(Gulp)
- [gulp-compass 모듈](https://www.npmjs.com/package/gulp-compass)

---

#### 모듈 설치
```sh
$ npm i -D gulp-sass gulp-ruby-sass
```

-

#### gulpfile.js
```js
// 모듈 호출
var gulp = require('gulp'),
	sass = require('gulp-sass');

// 경로 설정
var sass_src__path  = './src/sass/**/*.scss';
var sass_dist__path = './dist/css';

// 기본 업무 등록
gulp.task('default', ['sass']);

// Sass 업무 설정
gulp.task('sass', function() {
	gulp.src(sass_src__path)
		// options: https://github.com/sass/node-sass#options
		.pipe(sass().on('error', sass.logError))
		.pipe(gulp.dest(sass_dist__path));
});

// 관찰 업무 설정
gulp.task('watch', function() {
	gulp.watch([jade_src__path], function(event) {
		gulp.start('sass');
	});
});
```

```js
// 모듈 호출
var gulp     = require('gulp'),
	rubySass = require('gulp-ruby-sass');

// 경로 설정
var sass_src__path  = './src/sass/**/*.scss';
var sass_dist__path = './dist/css';

// 기본 업무 등록
gulp.task('default', ['rubySass']);

// Ruby Sass 업무 설정
gulp.task('rubySass', function() {
	// options: https://www.npmjs.com/package/gulp-ruby-sass#sass-options
	return sass(sass_src__path, {})
	.on('error', errorLog)
	.pipe(gulp.dest(sass_dist__path));
});

// 관찰 업무 설정
gulp.task('watch', function() {
	gulp.watch([sass_src__path], function(event) {
		gulp.start('rubySass');
	});
});
```

---

#### HELPERS
```js
/**
 * --------------------------------
 * 오류 출력을 위한 errorLog 함수
 * 오류 발생 시에도 watch 업무 중단하지 않음.
 * --------------------------------
 */
function errorLog(error) {
	console.error.bind(error);
	this.emit('end');
}
```