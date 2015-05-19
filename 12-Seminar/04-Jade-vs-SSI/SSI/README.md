###SSI(Server Side Includes)
[gulp-html-ssi 모듈](https://www.npmjs.com/package/gulp-html-ssi)

---

#### 모듈 설치
```sh
$ npm i -D gulp-html-ssi
```

-

#### gulpfile.js
```js
// 모듈 호출
var gulp = require('gulp'),
	ssi  = require('gulp-html-ssi');

// 경로 설정
var ssi_src__path = './source/**/*.html';
var ssi_dist__path = './dist/';

// 기본 업무 등록
gulp.task('default', ['SSI']);

// SSI 업무 설정
gulp.task('SSI', function() {
	gulp.src(ssi_src__path)
		.pipe(ssi())
		.pipe(gulp.dest(ssi_dist__path));
});

// 관찰 업무 설정
gulp.task('watch', function() {
	gulp.watch([ssi_src__path], function(event) {
		gulp.start('default');
	});
});
```

-

### HTML Includes
```html
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>SSI</title>
</head>
<body>

<!-- #include file="header.html" -->


<!-- #include virtual="footer.html" -->

</body>
</html>
```