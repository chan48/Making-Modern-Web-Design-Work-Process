### Jade 언어
- [Jade 레퍼런스](http://jade-lang.com/reference/)

---

###Jade 모듈(Gulp)
[gulp-jade 모듈](https://www.npmjs.com/package/gulp-jade)

---

#### 모듈 설치
```sh
$ npm i -D gulp-jade
```

-

#### gulpfile.js
```js
// 모듈 호출
var gulp = require('gulp'),
	jade = require('gulp-jade');

// 경로 설정
var jade_src__path = './src/**/*.jade';
var jade_dist__path = './dist/';

// 기본 업무 등록
gulp.task('default', ['jade']);

// SSI 업무 설정
gulp.task('jade', function() {
	gulp.src(jade_src__path)
		.pipe(jade()) // options: http://jade-lang.com/api/
		.pipe(gulp.dest(jade_dist__path));
});

// 관찰 업무 설정
gulp.task('watch', function() {
	gulp.watch([jade_src__path], function(event) {
		gulp.start('jade');
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